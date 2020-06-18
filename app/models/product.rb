class Product < ApplicationRecord
    belongs_to :category, optional: true
    validates :title, presence: true, uniqueness: true, length: { minimum: 2 }
    validates :content, presence: true
    validates :price, presence:true, numericality: { only_integer: true }
end
