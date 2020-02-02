class Phone < ApplicationRecord
    belongs_to :person

    validates :phone_number, presence: true
    validates_uniqueness_of :phone_number, :scope => :person_id,
        :message => "You already have this phone number"
end
