class CacheController < ApplicationController
  before_action :check_key, only: [:get, :llen, :lpop, :rpop, :lrange, :scard, :smembers, :expire]
  before_action :check_list_type, only: [:llen, :lpop, :rpop, :lrange]
  before_action :check_set_type, only: [:sadd, :scard, :smembers, :srem]
  before_action :check_value, only: [:set, :rpush, :sadd, :srem]

  def index
    render json: {
      message: 'Hello. I am Ledis.'
    }
  end

  ## String
  def set
    setted = Rails.cache.write(params[:key], params[:value])
    setted ? render_ok : render_failed
  end

  def get
    render_string(fetch_value)
  end

  ## List
  def llen
    render_size(fetch_value)
  end

  def rpush
    list = fetch_value
    params.each do |key, value|
      list = LinkedList.new if list.nil?
      list.add(value) if key.include?('value')
    end

    Rails.cache.write(params[:key], list)
    render_size(list)
  end

  def lpop
    render_string(fetch_value.left_pop)
  end

  def rpop
    render_string(fetch_value.right_pop)
  end

  def lrange
    start = params[:start]
    stop  = params[:stop]
    render_string(fetch_value.lrange(start, stop))
  end

  ## Set
  def sadd
    custom_set = fetch_value
    custom_set = CustomSet.new if custom_set.nil?

    params.each do |key, value|
      custom_set.put(value) if key.include?('value')
    end

    Rails.cache.write(params[:key], custom_set)
    render_size(custom_set)
  end

  def scard
    custom_set = fetch_value
    render_size(custom_set)
  end

  def smembers
    custom_set = fetch_value
    render_list_json(custom_set.to_list)
  end

  def srem
    custom_set = fetch_value
    params.each do |key, value|
      custom_set.delete(value) if key.include?('value')
    end

    render_list_json(custom_set.to_list)
  end

  def sinter
    custom_set1 = Rails.cache.fetch(params[:key1])
    custom_set2 = Rails.cache.fetch(params[:key2])

    render_empty_list_or_set && return if custom_set1.nil? || custom_set2.nil?
    new_set = custom_set1.intersection(custom_set2)
    render_list_json(new_set)
  end

  ## Data Expiration
  def keys
    keys = Rails.cache.instance_variable_get(:@data).keys
    render_string(keys)
  end

  def del
    ## Rails.cache.delete_if {|k, v| k =~ params[:key] }
    deleted = Rails.cache.delete(params[:key])
    deleted ? render_ok : render_failed
  end

  def flushdb
    Rails.cache.clear ? render_ok : render_failed
  end

  def expire
    value = fetch_value
    time = params[:seconds].to_i
    Rails.cache.write(params[:key], value, expires_in: time.seconds)
  end

  private

  def check_key
    render_key_not_found unless key_existed?(params[:key])
  end

  def check_list_type
    render_wrong_type(fetch_value) unless list?(fetch_value)
  end

  def check_set_type
    if !set?(fetch_value) && !fetch_value.nil?
      render_wrong_type(fetch_value)
    end
  end

  def fetch_value
    Rails.cache.fetch(params[:key])
  end

  def check_value
    has_values = false

    params.each do |k, v|
      if k.include?('value')
        has_values = true
        break
      end
    end

    render_value_empty unless has_values
  end

  def render_empty_list_or_set
    render json: {
      message: '(empty list or set)'
    }
  end
end
