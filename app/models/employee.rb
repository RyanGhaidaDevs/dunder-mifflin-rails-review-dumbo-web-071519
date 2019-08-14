class Employee < ApplicationRecord

    validates :alias,:title, uniqueness: true 
    validates :first_name, presence: true 
    validates :last_name, presence: true


    belongs_to :dog

    def full_name
        "#{self.first_name }  #{ self.last_name}"
    end 
end
