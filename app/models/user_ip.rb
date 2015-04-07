# encoding: utf-8
require 'ipaddr'
class UserIp


  def self.country_id_from_ip(ip)
    long = ip2long(ip).to_s
    array = redis_instance.zrangebyscore(hash_key, long, '+inf', :limit => [0, 1]) rescue []
    county_hash[array.first.to_s[0..1]]
  end

  def self.ip2long(ip)
    IPAddr.new(ip).to_i rescue 0
  end

  def self.county_hash
    return {
      'az'=>81,
      'am'=>245,
      'by'=>248,
      'bg'=>428,
      'uk'=>616,
      'de'=>1012,
      'ge'=>1280,
      'il'=>1393,
      'it'=>1786,
      'kz'=>1894,
      'kg'=>2303,
      'lv'=>2448,
      'lt'=>2514,
      'md'=>2788,
      'ru'=>3159,
      'us'=>5681,
      'tj'=>9575,
      'tm'=>9638,
      'uz'=>9787,
      'ua'=>9908,
      'cz'=>10874,
      'ab'=>10875,
      'ee'=>10968
    }
  end
  def self.hash_key
    'ips'
  end

end