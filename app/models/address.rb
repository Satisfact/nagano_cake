class Address < ApplicationRecord
    validates :postcode, presence: true
    validates :address, presence: true
    validates :name, presence: true

    belongs_to :customer
    
    #テーブルのセルをたす
    def full_address
        self.postcode + self.address + self.name
    end
end
