class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount HelloApi => '/'
  mount BusinessesApi => '/'
  mount UsersApi => '/'
  mount CheckInsApi => '/'

  add_swagger_documentation
end
