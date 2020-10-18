class Genre < ApplicationRecord
    validates :name, presence: true

    
    has_many :items

    validates :is_active, presence: true

end
