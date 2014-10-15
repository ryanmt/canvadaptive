module Authentication
  $oauth_creds = { CanvasProxy[:client_key] => CanvasProxy[:client_secret] }

  def authenticate!
    if key = params['oauth_consumer_key']
      if secret = $oauth_creds[key]
        @tp = IMS::LTI::ToolProvider.new(key, secret, params)
      else
        @tp = IMS::LTI::ToolProvider.new(nil, nil, params)
        @tp.lti_msg = "Your consumer didn't use a recognized key."
        @tp.lti_errorlog = "You did it wrong!"
        show_error "Consumer key wasn't recognized"
        return false
      end
    else
      show_error "No consumer key"
      return false
    end
    if !@tp.valid_request?(request)
      show_error "The OAuth signature was invalid"
      return false
    end

    if Time.now.utc.to_i - @tp.request_oauth_timestamp.to_i > 60*60
      show_error "Your request is too old."
      return false
    end

    @username = @tp.username

    return true
  end
  def valid_request?(request)
    @tp.valid_request?(request)
  end
  def outcome_service?
    @tp.outcome_service?
  end
end