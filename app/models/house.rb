class House < ApplicationRecord
    has_many :stations
    validates :name, :price, :address, :age, :information, presence: true
    accepts_nested_attributes_for :stations, reject_if: :all_blank
end
