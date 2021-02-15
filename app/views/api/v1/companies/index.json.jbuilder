json.array! @companies do |company|
  json.extract! company, :id, :name, :description, :business_type
end