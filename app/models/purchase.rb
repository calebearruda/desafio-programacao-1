class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :purchaser
  belongs_to :merchant
end
