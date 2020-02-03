class Person < ApplicationRecord
    has_many :addresses, dependent: :destroy
    has_many :phones, dependent: :destroy
    has_many :emails, dependent: :destroy
    accepts_nested_attributes_for :addresses, allow_destroy: true
    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :emails, allow_destroy: true

    validates :first_name, :last_name, presence: true
    validates :social_security_number, length: {is: 10,
    message: "Your Social Security Number should be 10 numbers"}, allow_nil: true
end
