class Address < ApplicationRecord
    belongs_to :person

    validates :street, :city, :zip, :country, presence: true
end
