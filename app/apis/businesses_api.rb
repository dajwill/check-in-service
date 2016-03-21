class BusinessesApi < Grape::API
  resource :businesses do
    desc 'Get a list of businesses'
    params do
      optional :ids, type: Array, desc: 'Array of business ids'
    end

    get do
      businesses = params[:ids] ? Business.where(id: params[:ids]) : Business.all
    end

    desc 'Create a business'
    params do
      requires :name, type: String, desc: 'Name of business'
      optional :business_type, type: String, desc: "Type of business"
    end

    post do
      # if params[:name].present?
      #   business = Business.create!(permitted_params)
      #   business.update_columns(code: rand(10**4))
      #   respresent business, BusinessRepresenter
      # else
      #   {message: 'Must include a business name'}
      # end
      business = Business.create!(permitted_params)
      business.update_columns(code: rand(10**4))
      respresent business, with: BusinessRepresenter
    end

    params do
      requires :id, type: Integer, desc: 'Id of business'
    end
    route_param :id do
      desc 'Get a business'
      get do
        business = Business.find(params[:id])
        represent business, with: BusinessRepresenter
      end

      desc 'Update a business'
      params do
        optional :name, type: String, desc: 'Name of business'
        optional :business_type, type: String, desc: "Type of business"
      end
      put do
        business = Business.find(params[:id])
        business.update_attributes!(permitted_params)
        represent business, with: BusinessRepresenter
      end

      desc 'Update business code'
      params do

      end
      post '/update_code' do
        business = Business.find(params[:id])
        business.update_columns(code: rand(10**4))
      end
    end
  end
end
