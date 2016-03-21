class RewardRepresenter < Napa::Representer
  property :id, type: Integer
  property :business_id, type: Integer
  property :visit_count, type: Integer
  property :offer, type: String
end
