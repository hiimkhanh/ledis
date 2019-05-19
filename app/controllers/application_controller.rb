class ApplicationController < ActionController::API

  def key_existed?(key)
    Rails.cache.fetch(key).present?
  end

  def render_ok
    render json: {
      status: 'OK'
    }
  end

  def render_failed
    render json: {
      status: 'FAILED'
    }
  end

  def render_string(value)
    render json: {
      message: value
    }
  end

  def render_size(list)
    size = list.size
    render json: {
      message: "(interger) #{size}"
    }
  end

  def render_key_not_found
    render json: {
      message: 'ERROR: Key not found'
    }
  end

  def render_value_empty
    render json: {
      message: 'ERROR: Value is empty'
    }
  end

  def list?(value)
    value.instance_of? LinkedList
  end

  def set?(value)
    value.instance_of? CustomSet
  end

  def render_wrong_type(value)
    render json: {
      message: "ERROR: Wrong type. Value is type of #{value.class}"
    }
  end

  def render_list_json(list)
    render json: {
      data: list
    }
  end

end