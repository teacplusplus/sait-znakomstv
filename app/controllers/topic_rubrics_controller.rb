class TopicRubricsController < ApplicationController
  def index
    @topic_rubrics = TopicRubric.all
    if params[:rubric_id].present?
      @topic_rubric = @topic_rubrics.find{|topic_rubric| topic_rubric.rubric_id == params[:rubric_id].to_i}
      raise ActiveRecord::RecordNotFound if @topic_rubric.blank?
      @topics_all = Topic.order('putdate desc').where(:rubric_id => @topic_rubric.id)
    else
      @topics_all = Topic.order('putdate desc')
    end
    @limit = per_page
    params[:page] ||= 1
    @topics = @topics_all.paginate(:page=> params[:page], :per_page => @limit)
    @pages = (@topics_all.count.to_f / @limit.to_f).ceil
  end


  def per_page
    12
  end
end