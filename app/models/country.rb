class Country < ActiveRecord::Base
  self.table_name = 'countries'
  self.primary_key = 'country_id'

  def self.ordered
    all = self.order("country")
    ord = [all.find{|country| country.name == 'Россия'}, all.find{|country| country.name == 'Украина'}, all.find{|country| country.name == 'Беларусь'}].compact
    ord + all.reject{|c| ord.include?(c)}
  end

  def self.cache_ordered_for_select
    @cache_ordered_for_select ||= ordered.map{|c| [c.name, c.id]}.uniq
  end

  def name
    self.country
  end

end
