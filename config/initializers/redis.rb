def redis_instance
  v = Redis.instance_variable_get('@redis_instance')
  if v.nil?
    config = HashWithIndifferentAccess.new( YAML.load_file("#{Rails.root.to_s}/config/config.yml")[Rails.env] )
    v = Redis.new(:host => config[:redis][:host], :port => config[:redis][:port]) rescue nil
    Redis.instance_variable_set('@redis_instance', v)
  end
  return v
end



