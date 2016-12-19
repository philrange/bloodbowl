class Player < ActiveRecord::Base  
	belongs_to :team

	def skills_array
		skills != nil ? skills.tr('[]"', '').split(', ') : nil
	end

end
