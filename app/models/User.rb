class User
	@@all = []

	def initialize
		@@all << self
	end

	def self.all
		@@all
	end

	def recipecards
		RecipeCard.all.select do |each_recipe_card|
			each_recipe_card.user == self
		end
	end

	def recipes
		recipecards.map {|each_recipe_card| each_recipe_card.recipe}
	end

	def allergens_to
		Allergen.all.select do |each_allergen|
			each_allergen.user == self
		end
	end

	def allergens
		allergens_to.map {|allergen_ingredient| allergen_ingredient.ingredient}
	end
end