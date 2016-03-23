class UsersApi < Grape::API
  resource :users do
    desc 'Get a list of users'
    params do
      optional :ids, type: Array, desc: 'Array of user ids'
    end
    get do
      users = params[:ids] ? User.where(id: params[:ids]) : User.all
      represent users, with: UserRepresenter
    end

    desc 'Create an user'
    params do
      requires :name, type: String, desc: 'Name of new user'
    end

    post do
      user = User.create!(permitted_params)
      represent user, with: UserRepresenter
    end

    params do
      requires :id, desc: 'ID of the user'
    end
    route_param :id do
      desc 'Get an user'
      get do
        user = User.find(params[:id])
        represent user, with: UserRepresenter
      end

      desc 'Update an user'
      params do
        optional :name, type: String, desc: 'new name for user'
      end
      put do
        # fetch user record and update attributes.  exceptions caught in app.rb
        user = User.find(params[:id])
        user.update_attributes!(permitted_params)
        represent user, with: UserRepresenter
      end

      desc 'Get user rewards'
      params do
        requires :business_id, type: Integer, desc: 'Id of business'
      end
      get '/rewards' do
        user = User.find(params[:id])
        business = Business.find(params[:business_id])
        visit_count = user.check_ins.where(business_id: params[:business_id]).count
        rewards = Reward.where.not("visit_count > ?", visit_count)
        represent rewards, with: RewardRepresenter
      end

    end
  end
end
