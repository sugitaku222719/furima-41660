class Purchaser < ApplicationRecord
  belongs_to :area
  belongs_to :history
end
