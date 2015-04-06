class Topic < ActiveRecord::Base
  attr_accessible  :title, :description, :content, :keywords, :rubric_id, :url, :image_url
  validates_presence_of :title, :description, :content, :keywords, :rubric_id, :url, :image_url
  if Rails.env.production?
    self.table_name = 'zs_topics'
  else
    self.table_name = 'topics'
  end
  belongs_to :topic_rubric, :foreign_key => "rubric_id"

  self.primary_key = 'topic_id'

  def timestamp_attributes_for_create
    super << :putdate
  end
end
