class BusinessRepresenter < Napa::Representer
  property :id, type: String
  property :name, type: String
  property :business_type, type: String
  property :code, type: Integer
end
