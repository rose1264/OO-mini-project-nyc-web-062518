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

	
	def add_recipe_card(date, rating, recipe)
		RecipeCard.new(date, rating, self, recipe)
	end

	def declare_allergen(ingredient)
		Allergen.new(self, ingredient)
	end

	def top_three_recipe
		recipe_card_array = self.recipecards.sort_by {|each_recipe_card| each_recipe_card.rating}
		recipe_card_array.reverse![0..2].map {|each_recipe_card| each_recipe_card.recipe}
	end

	def most_recent_recipe
		recipe_card_array = self.recipecards.sort_by {|each_recipe_card| each_recipe_card.date}
		recipe_card_array[-1].recipe
	end
end