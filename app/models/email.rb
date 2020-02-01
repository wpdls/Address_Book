class Email < ApplicationRecord
    belongs_to :person

    validates :email, presence: true, email: true
 
        
    validates_uniqueness_of :email, :scope => :person_id,
        :message => "You already have this email"
end
