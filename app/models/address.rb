class Address < ApplicationRecord
    belongs_to :person

    validates :street, :city, :zip, :country, presence: true
    validates_uniqueness_of :street, :scope => :person_id,
        :message => "You already have this Address"
    
end
