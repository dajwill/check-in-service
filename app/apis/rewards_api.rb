class RewardsApi < Grape::API
  resource :rewards do
    desc 'Get a list of rewards'
    params do
      optional :ids, type: Array, desc: 'Array of reward ids'
    end
    get do
      rewards = params[:ids] ? Reward.where(id: params[:ids]) : Reward.all
      represent rewards, with: RewardRepresenter
    end

    desc 'Create an reward'
    params do
      requires :business_id, type: Integer, desc: 'Id of business'
      requires :visit_count, type: Integer, desc: 'Visits required'
      requires :offer, type: String, desc: 'Reward offer'
      requires :password, type: String, desc: 'Password for business'
    end

    post do
      business = Business.find(params[:business_id])
      if business.password == params[:password]
        reward = Reward.create!(business_id: params[:business_id], visit_count: params[:visit_count], offer: params[:offer])
      end
      represent reward, with: RewardRepresenter
    end

    params do
      requires :id, desc: 'ID of the reward'
    end
    route_param :id do
      desc 'Get an reward'
      get do
        reward = Reward.find(params[:id])
        represent reward, with: RewardRepresenter
      end

      desc 'Update an reward'
      params do
        optional :business_id, type: Integer, desc: 'Id of business'
        optional :visit_count, type: Integer, desc: 'Visits required'
        optional :offer, type: String, desc: 'Reward offer'
        requires :password, type: String, desc: 'Password for business'
      end
      put do
        # fetch reward record and update attributes.  exceptions caught in app.rb
        reward = Reward.find(params[:id])
        reward.update_attributes!(permitted_params)
        represent reward, with: RewardRepresenter
      end
    end
  end
end
