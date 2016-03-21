class CheckInRepresenter < Napa::Representer
  property :id, type: Integer
  property :user_id, type: Integer
  property :business_id, type: Integer
  property :business_code, type: String
  # property :message, type: String
end
