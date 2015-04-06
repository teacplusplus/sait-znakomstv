class TopicsController < ApplicationController
  def show
    @topic = Topic.where(:url => params[:id]).first
    @topic_rubrics = TopicRubric.all
    raise ActiveRecord::RecordNotFound if @topic.blank?
    number = 3
    @topics = Topic.offset(rand(Topic.count - number+1)).first(number)

    params[:page] ||= 1
    params[:type] = 'topics'
  end

  def per_page
    9
  end

end