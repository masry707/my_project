class Ingredient < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    has_many :needs
    has_many :recipes, through: :needs
end
