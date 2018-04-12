require 'open-uri'

class UsdaRequester
  attr_reader :data, :data_to_assign

  API_KEY = 'fbfxvslLNzeppsSuq8yZsp4Bcyc3aUHFrI1RcLAf'

  def initialize(upc)
    @data = ""
    @data_to_assign = ""
    usda_no = get_usda_no(upc)
    if usda_no != ""
      get_data(usda_no)
      @data_to_assign = {usda_no: usda_no, upc: upc}
      get_data_to_assign
    end
  end

  def get_usda_no(upc)
    url = "https://api.nal.usda.gov/ndb/search/?format=json&q=#{upc}&api_key=#{API_KEY}"
    usda_data = JSON.load(open(url))
    usda_data['list'] ? usda_data['list']['item'][0]['ndbno'] : ""
  end

  def get_data(usda_no)
    url = "https://api.nal.usda.gov/ndb/reports/?ndbno=#{usda_no}&type=f&format=json&api_key=#{API_KEY}"
    usda_data = JSON.load(open(url))
    @data = usda_data['report']['food']
  end

  def get_data_to_assign
    get_name
    get_usda_unit
    get_nutrient_data
    get_density
  end

  def get_name
    data_to_assign[:name] = "#{data['name'][0..data['name'].index(', UPC:')-1].downcase}: Pending N"
  end

  def get_usda_unit
    data_to_assign[:usda_unit] = data['ru']
  end

  def get_nutrient_data
    data_to_assign[:nutrients] = {}
    data['nutrients'].each {|attribute_hash|
      data_to_assign[:nutrients][attribute_hash['nutrient_id']] = {
        nutrient_usda_name: attribute_hash['name'],
        nutrient_amount_per_ingredient_usda_unit: attribute_hash['value'].to_f/100,
        nutrient_usda_unit: attribute_hash['unit']}
    }
  end

  def get_density
    serving = get_data_for_density_calculation(data['nutrients'][0]['measures'][0], 'label', 'qty')
    equivalent = get_data_for_density_calculation(data['nutrients'][0]['measures'][0], 'eunit', 'eqv')
    if serving.values.any?{|v| v==""} || equivalent.values.any?{|v| v==""} || serving[:unit].physical_property == equivalent[:unit].physical_property
      data_to_assign[:name] = "#{data_to_assign[:name]}&D"
    else
      data_to_assign[:density] = calculate_density(serving, equivalent)
    end
  end

  def get_data_for_density_calculation(source, unit, amount)
    amount = source[amount]
    unit = Unit.find_by(name: source[unit]) ? Unit.find_by(name: source[unit]) : Unit.find_by(abbreviation: source[unit])
    amount = "" if amount == nil
    unit = "" if unit == nil
    {amount: amount, unit: unit}
  end

  def calculate_density(serving, equivalent)
    ratio = (serving[:amount] * serving[:unit].lowest_unit_equivalence) / (equivalent[:amount] * equivalent[:unit].lowest_unit_equivalence)
    density = serving[:unit].physical_property == 'mass' ? ratio : 1/ratio
  end

end
