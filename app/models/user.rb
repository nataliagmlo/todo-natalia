class User < ActiveRecord::Base

	has_many :tasks
	has_many :proyects, :through => :tasks

end
