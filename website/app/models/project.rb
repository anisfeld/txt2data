class Project < ApplicationRecord

	validates :title, presence: true
	#validates :image, format: 
	
	has_many :datum
	
	belongs_to :user


end
