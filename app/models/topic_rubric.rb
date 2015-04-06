class TopicRubric < ActiveRecord::Base

  attr_accessible  :title
  validates_presence_of :title

  if Rails.env.production?
    self.table_name = 'zs_topics_rubrics'
  else
    self.table_name = 'topics_rubrics'
  end
  self.primary_key = 'rubric_id'

  has_many :topics, :foreign_key => 'topic_id'

  def timestamp_attributes_for_create
    super << :putdate
  end
end
