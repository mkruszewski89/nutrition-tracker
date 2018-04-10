require 'open-uri'

class UsdaRequester
  attr_reader :data, :data_to_assign

  NUTRIENT_NAMES = {
    "Cholesterol" => :cholesterol,
    "Energy" => :calorie,
    "Protein" => :protein,
    "Carbohydrate, by difference" => :carbohydrate,
    "Fiber, total dietary" => :fiber,
    "Sugars, total" => :sugar,
    "Total lipid (fat)" => :fat_total,
    "Fatty acids, total saturated" => :fat_saturated,
    "Calcium, Ca" => :calcium,
    "Iron, Fe" => :iron,
    "Magnesium, Mg" => :magnesium,
    "Phosphorus, P" => :phosphorus,
    "Potassium, K" => :potassium,
    "Sodium, Na" => :sodium,
    "Zinc, Zn" => :zinc,
    "Copper, Cu" => :copper,
    "Manganese, Mn" => :manganese,
    "Selenium, Se" => :selenium,
    "Vitamin A, RAE" => :vitamin_a,
    "Vitamin E (alpha-tocopherol)" => :vitamin_e,
    "Vitamin C, total ascorbic acid" => :vitamin_c,
    "Thiamin" => :thiamin,
    "Riboflavin" => :riboflavin,
    "Niacin" => :niacin,
    "Vitamin B-6" => :vitamin_b6,
    "Vitamin B-12" => :vitamin_b12,
    "Choline, total" => :choline,
    "Vitamin K (phylloquinone)" => :vitamin_k,
    "Folate, total" => :folate
   }

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
    get_usda_unit
    get_name
    get_nutrients
    get_density
  end

  def get_usda_unit
    data_to_assign[:usda_unit] = data['ru']
  end

  def get_name
    data_to_assign[:name] = "#{data['name'][0..data['name'].index(', UPC:')-1].downcase}: Pending N"
  end

  def get_nutrients
    data_to_assign[:nutrients] = {}
    data['nutrients'].each {|attribute_hash|
      get_nutrient(attribute_hash) if NUTRIENT_NAMES.keys.include?(attribute_hash['name'])
    }
  end

  def get_nutrient(nutrient)
    nutrient_unit = "#{NUTRIENT_NAMES[nutrient['name']]}_unit".to_sym
    nutrient_per_usda_unit = "#{NUTRIENT_NAMES[nutrient['name']]}_per_usda_unit".to_sym
    data_to_assign[:nutrients][nutrient_unit] = nutrient['unit']
    data_to_assign[:nutrients][nutrient_per_usda_unit] = nutrient['value'].to_f/100
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
