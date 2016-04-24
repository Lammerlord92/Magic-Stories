Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "KQUSLywvmVfv74uvR8OXsCnCK", "yXit3P56ijoXyLI80F8yN9fVsfagFgTjxSygZG1LafDTTSSh0z"
  provider :facebook, "561296937381989", "72af1547be063e14b761a2d63801aeaa", scope: 'public_profile, email', info_fields: 'name, first_name, last_name, age_range, gender, picture,verified, email'
end

class NonExplodingFailureEndpoint
  attr_reader :env

  def self.call(env)
    new(env).call
  end

  def initialize(env)
    @env = env
  end

  def call
    redirect_to_failure
  end

  def raise_out!
    raise env['omniauth.error'] || OmniAuth::Error.new(env['omniauth.error.type'])
  end

  def redirect_to_failure
    message_key = env['omniauth.error.type']
    new_path = '/user/sign_in'
    Rack::Response.new(["302 Moved"], 302, 'Location' => new_path).finish
  end
end

OmniAuth.config.on_failure = NonExplodingFailureEndpoint
