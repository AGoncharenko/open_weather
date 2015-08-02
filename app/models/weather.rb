class Weather
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :city, :country

  
end
