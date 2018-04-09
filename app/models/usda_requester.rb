require 'open-uri'

class UsdaRequester
  attr_reader :data, :data_to_assign

  NUTRIENT_NAMES = {
    "Energy" => :calorie,
    "Protein" => :protein,
    "Carbohydrate, by difference" => :carbohydrate,
    "Sugars, total" => :sugar,
    "Total lipid (fat)" => :fat_total,
    "Fatty acids, total saturated" => :fat_saturated,
    "Fatty acids, total monounsaturated" => :fat_monounsaturated,
    "Fatty acids, total polyunsaturated" => :fat_polyunsaturated,
    "Fatty acids, total trans" => :fat_trans,
    "Fiber, total dietary" => :fiber,
    "Cholesterol" => :cholesterol,
    "Sodium, Na" => :sodium,
    "Vitamin A, RAE" => :vitamin_a,
    "Vitamin C, total ascorbic acid" => :vitamin_c,
    "Calcium, Ca" => :calcium,
    "Iron, Fe" => :iron,
  }

  API_KEY = 'fbfxvslLNzeppsSuq8yZsp4Bcyc3aUHFrI1RcLAf'

  def initialize(upc)
    @data = ""
    @data_to_assign = ""
    ndbno = upc.length == 12 ? get_ndbno(upc) : ""
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

end
