class Task < ActiveRecord::Base

	validates_presence_of :title
	validates_numericality_of :percentage

end
