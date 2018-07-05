class Ingredient
	@@all = []

	def initialize
		@@all << self
	end

	def self.all
		@@all
	end

	# todo

	def self.most_common_allergen
		allergen_count_hash = {}
		Allergen.all.each do |each_allergen|
			if !allergen_count_hash[each_allergen]
				allergen_count_hash[each_allergen] = 1
			else
				allergen_count_hash[each_allergen] += 1
			end
		end
		sorted_hash = allergen_count_hash.sort_by {|key, value| value}
		sorted_hash.reverse![0][0]
	end
end
