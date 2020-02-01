class Phone < ApplicationRecord
    belongs_to :person
    validates_presence_of :person

    validates :phone_number, presence: true
end
