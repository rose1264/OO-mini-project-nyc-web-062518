class Recipe


	@@all = []

	def initialize
		@@all << self
	end

	def self.all
		@@all
	end

	def self.most_popular
		# num_1_popular_recipe = nil
		# RecipeCard.all.find do |rc|
		# 	if 
	end

	def recipecards
		RecipeCard.all.select do |each_recipe_card|
			each_recipe_card.recipe == self
		end
	end

	def users
		recipecards.map {|each_recipe_card| each_recipe_card.user}
	end

	def recipeingredients
		RecipeIngredient.all.select do |each_recipe_ingredient|
			each_recipe_ingredient.recipe == self
		end
	end

	def ingredients
		recipeingredients.map {|each_recipe_ingredient| each_recipe_ingredient.ingredient}
	end
end