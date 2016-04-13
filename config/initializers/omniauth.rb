Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "KQUSLywvmVfv74uvR8OXsCnCK", "yXit3P56ijoXyLI80F8yN9fVsfagFgTjxSygZG1LafDTTSSh0z"
  provider :facebook, "561296937381989", "72af1547be063e14b761a2d63801aeaa", scope: 'public_profile', info_fields: 'name, first_name, last_name, age_range, gender, picture,verified'
end
