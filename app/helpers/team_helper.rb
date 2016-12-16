module TeamHelper

	def races
		data = YAML.load_file("#{Rails.root}/app/assets/data/teams.yml")
		puts data
		return data.keys.sort
	end
end
