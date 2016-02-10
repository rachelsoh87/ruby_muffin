require 'byebug'

class Oven

	def initialize
		@muffin_in_oven = []
	end

	def bake!(time_lapsed)
		for muffin in @muffin_in_oven
			muffin.time_baked += time_lapsed
		end
	end

	def insert_muffin(muffin)
		@time_baked = 0 #reset baking time everytime a new batch is inserted into the oven
		@muffin_in_oven << muffin
	end

	def remove_muffin(muffin_type)
		@muffin_in_oven.delete(muffin_type)
	end
end

class Muffin
	attr_accessor :time_baked
	
	def initialize
		@time_baked = 0
	end
	
	def status
		if time_baked < @required_bake_time * 0.3
			"doughy"
		elsif time_baked < @required_bake_time
			"almost ready"
		elsif time_baked == @required_bake_time 
			"perfect"
		elsif time_baked > @required_bake_time
			"burned"
		end	
	end

end 

class ChocolateChipMuffin < Muffin
	def initialize
		super
		@ingredients = "chocolate chips"
		@required_bake_time = 10
	end
end

class BlueBerryMuffin < Muffin
	def initialize
		super
		@ingredients = "blueberries"
		@required_bake_time = 12
	end
end

#must put all muffins that you
bakery_oven = Oven.new
choc_muffin = ChocolateChipMuffin.new
blue_muffin = BlueBerryMuffin.new
bakery_oven.insert_muffin(choc_muffin)
bakery_oven.insert_muffin(blue_muffin)
bakery_oven.bake!(3)
p blue_muffin.status
p choc_muffin.status
bakery_oven.bake!(7)
p blue_muffin.status
p choc_muffin.status
p bakery_oven.remove_muffin(choc_muffin)
p bakery_oven


