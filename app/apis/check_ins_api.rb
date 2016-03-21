class CheckInsApi < Grape::API
  resource :visits do
    desc 'Get a list of check_ins'
    params do
      optional :ids, type: Array, desc: 'Array of check_in ids'
    end
    get do
      check_ins = params[:ids] ? CheckIn.where(id: params[:ids]) : CheckIn.all
      represent check_ins, with: CheckInRepresenter
    end

    desc 'Create an check_in'
    params do
      requires :business_id, type: Integer, desc: 'Id of Business'
      requires :user_id, type: Integer, desc: 'Id of User'
      requires :business_code, type: String, desc: 'Check in code for business'
    end

    post do
      business = Business.find(params[:business_id])
      user = User.find(params[:user_id])
      if business.code == params[:business_code]
        # check_in = CheckIn.create!(permitted_params)
        check_in = CheckIn.new(permitted_params)
        if check_in.save
          represent check_in, with: CheckInRepresenter
        else
          {message: "This code has already been redeemed."}
        end
      else
        {message: 'Could not register visit. Incorrect code.'}
      end
    end

    params do
      requires :id, desc: 'ID of the check_in'
    end
    route_param :id do
      desc 'Get an check_in'
      get do
        check_in = CheckIn.find(params[:id])
        represent check_in, with: CheckInRepresenter
      end

      desc 'Update an check_in'
      params do
      end
      put do
        # fetch check_in record and update attributes.  exceptions caught in app.rb
        check_in = CheckIn.find(params[:id])
        check_in.update_attributes!(permitted_params)
        represent check_in, with: CheckInRepresenter
      end
    end
  end
end
