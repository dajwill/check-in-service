class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount HelloApi => '/'
  mount BusinessesApi => '/'
  mount UsersApi => '/'
  mount CheckInsApi => '/'
  mount RewardsApi => '/'

  add_swagger_documentation
end
