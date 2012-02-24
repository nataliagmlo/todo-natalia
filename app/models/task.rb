class Task < ActiveRecord::Base

	validates_presence_of :title
	validates_numericality_of :percentage, {:only_integer => true}

	belongs_to :user 
	belongs_to :proyect

	scope :nearly_completed, :conditions => ["percentage >= ?", 90]
	scope :not_assigned, :conditions => ["user_id IS NULL"]
	scope :assigned, :conditions => ["user_id IS NOT NULL"]
	# scope :almost_due, :conditions => ["due_at < ?", 7.days.from_now] Esta mal porque la fecha se guarda la primera vez
	#Solucion
	scope :almost_due, lambda {
			{:conditions => ["due_at < ?", 7.days.from_now]}
		}

	# Saca las tareas de un usuario
	scope :for_user, lambda { |user|
		{:conditions => ["user_id = ?", user.id]}
	}
end
