class Api::CitiesController < ApplicationController

  def index
    search params[:query]
    respond = {:query => params[:query], :suggestions => @cities.map(&:city)}
    render :json => respond.to_json
  end

  private
  def search(query)
    country_ids = [params[:country_id].to_i]
    country_ids << current_user.country_id && current_user.country_id.to_i != params[:country_id].to_i if params[:multi_country] == 'true' && is_auth?

    correct_query = LangCorrect.make(query)
    query = Russian.detransliterate(query) if query =~ /[a-zA-Z\-]/
    if query != correct_query
      @cities = City.where('city LIKE ? OR city LIKE ? ', "#{query}%", "#{correct_query}%").where(country_id: country_ids)
    else
      @cities = City.where('city LIKE ?', "#{query}%").where(country_id: country_ids)
    end
  end

end
