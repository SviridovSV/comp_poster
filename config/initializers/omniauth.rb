Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1016487655148361", "f2e908cb486401fd2dd6cf21e4dc2dfb", scope: 'public_profile', info_fields: 'id, name, link'
end