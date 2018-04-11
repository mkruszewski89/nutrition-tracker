require 'open-uri'

class UsdaRequester
  attr_reader :data, :data_to_assign

  API_KEY = 'fbfxvslLNzeppsSuq8yZsp4Bcyc3aUHFrI1RcLAf'

  def initialize(upc)
    @data = ""
    @data_to_assign = ""
    ndbno = get_ndbno(upc)
    if ndbno != ""
      get_data(ndbno)
      @data_to_assign = {ndbno: ndbno, upc: upc}
      get_data_to_assign
    end
  end

  def get_ndbno(upc)
    url = "https://api.nal.usda.gov/ndb/search/?format=json&q=#{upc}&api_key=#{API_KEY}"
    usda_info = JSON.load(open(url))
    usda_info['list'] ? usda_info['list']['item'][0]['ndbno'] : ""
  end

  def get_data(ndbno)
    url = "https://api.nal.usda.gov/ndb/reports/?ndbno=#{ndbno}&type=f&format=json&api_key=#{API_KEY}"
    usda_info = JSON.load(open(url))
    @data = usda_info['report']['food']
  end

  def get_data_to_assign
    get_name
    get_storage_unit
    get_nutrients_per_storage_unit
    get_density
  end

  def get_name
    data_to_assign[:name] = "#{data['name'][0..data['name'].index(', UPC:')-1].downcase}: Pending N"
  end

  def get_storage_unit
    data_to_assign[:storage_unit] = data['ru']
  end

  def get_nutrients_per_storage_unit
    data_to_assign[:nutrients] = {}
    data['nutrients'].each {|attribute_hash|
      data_to_assign[:nutrients][attribute_hash['nutrient_id']] = {nutrient_usda_name: attribute_hash['name'], nutrient_amount_per_ingredient_storage_unit: attribute_hash['value'].to_f/100, nutrient_storage_unit: attribute_hash['unit']}
    }
  end

  def get_density
    serving = get_data_for_density(data['nutrients'][0]['measures'][0], 'label', 'qty')
    equivalent = get_data_for_density(data['nutrients'][0]['measures'][0], 'eunit', 'eqv')
    if serving.values.any?{|v| v==""} || equivalent.values.any?{|v| v==""} || serving[:unit].physical_property == equivalent[:unit].physical_property
      data_to_assign[:name] = "#{data_to_assign[:name]}&D"
    else
      data_to_assign[:density] = calculate_density(serving, equivalent)
    end
  end

  def get_data_for_density(usda_source, unit, quantity)
    quantity = usda_source[quantity]
    unit = Unit.find_by(name: usda_source[unit]) ? Unit.find_by(name: usda_source[unit]) : Unit.find_by(abbreviation: usda_source[unit])
    quantity = "" if quantity == nil
    unit = "" if unit == nil
    {quantity: quantity, unit: unit}
  end

  def calculate_density(serving, equivalent)
    ratio = (serving[:quantity] * serving[:unit].lowest_unit_equivalence) / (equivalent[:quantity] * equivalent[:unit].lowest_unit_equivalence)
    density = serving[:unit].physical_property == 'mass' ? ratio : 1/ratio
  end

end
