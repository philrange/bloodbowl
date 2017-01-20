class Team < ActiveRecord::Base
	belongs_to :league
	has_many :players

    after_initialize :init

    def init
      self.rerolls  ||= 0           #will set the default value only if it's nil
      self.fanfactor  ||= 0           
    end
	
	def user
		User.find(user_id)
	end


	def budget
		budget = 1000
		cost = 0
		players.each do |player|
			puts player
			cost += player['cost']
		end

		cost += rerolls * reroll_cost
		cost += fanfactor * 10
		cost += assistantcoaches * 10
		cost += cheerleaders * 10
		cost += apothecary ? 50 : 0
		cost += wizard ? 150 : 0

		return budget - cost
	end

	def loadData
		@data = YAML.load_file("#{Rails.root}/app/assets/data/teams.yml")
	end

	def reroll_cost 
		loadData
		return @data[race]['reroll']
	end

	def team_value 
		1000 - budget
	end

end
