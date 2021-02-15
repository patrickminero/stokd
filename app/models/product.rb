class Product < ApplicationRecord
  serialize :attributes
  belongs_to :company
end
