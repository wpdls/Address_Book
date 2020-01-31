class Person < ApplicationRecord
    has_many :addresses, dependent: :destroy
    has_many :phones, dependent: :destroy
    has_many :emails, dependent: :destroy
    accepts_nested_attributes_for :addresses, allow_destroy: true
   
    validates :first_name, :last_name, presence: true
    validates :social_security_number, numericality: { only_integer: true, allow_nil: true}

end
