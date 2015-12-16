yml = YAML.load_file("#{Rails.root.to_s}/config/config.yml")[Rails.env]
RailsAdmin.config do |config|

  config.authorize_with do
    authenticate_or_request_with_http_basic('Login required') do |username, password|
      username == yml['admin']['username'] && password == yml['admin']['password']
    end
  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    show
    edit
    delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Topic do
    field :title
    field :description
    field :content
    field :keywords
    field :url
    field :image_url
    field :topic_rubric
  end

  config.model TopicRubric do
    field :title
    field :topics
  end
end
