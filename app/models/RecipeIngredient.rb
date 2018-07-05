class RecipeIngredient
	@@all = []

	attr_accessor :ingredient, :recipe

	def initialize(ingredient, recipe)
		@ingredient = ingredient
		@recipe = recipe
		@@all << self
	end

	def self.all
		@@all
	end
end