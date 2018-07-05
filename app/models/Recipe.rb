class Recipe

	@@all = []
  

	def initialize
		@@all << self
	end

	def self.all
		@@all
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

	def allergens
		self.ingredients.select do |item|
			Allergen.all.include?(item)
		end 
	end

	def add_ingredients(ingredient_array)
		ingredient_array.each do |item|
			RecipeIngredient.new(item,self)
		end
	end

	def self.most_popular
		user_count_hash = {}
		RecipeCard.all.each do |each_recipe_card|
			if !user_count_hash[each_recipe_card.recipe]
				user_count_hash[each_recipe_card.recipe] = 1
			else
				user_count_hash[each_recipe_card.recipe] += 1
			end
		end
		sorted_hash = user_count_hash.sort_by {|key, value| value}
		sorted_hash.reverse![0][0]
	end
		
end



















