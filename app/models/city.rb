class City < ActiveRecord::Base
  self.table_name= 'cities'
  self.primary_key= 'city_id'

  def name
    self.city
  end

end
