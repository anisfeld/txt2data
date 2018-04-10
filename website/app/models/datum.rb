class Datum < ApplicationRecord

 belongs_to :project, optional: true
 require 'csv'
 require 'activerecord-import/base'


 # inspired by https://richonrails.com/articles/importing-csv-files
 def self.import(file, project_id)
 	items = []

 	#file_path = Rails.root.join('lib', 'seeds', 'some_data.csv')
	#Datum.import(file_path, 14)


	if file.class == ActionDispatch::Http::UploadedFile
		file_path = file.path
		
	else
		# allows for easier seeding
		file_path = file
	end

    CSV.foreach(file_path, headers: true, encoding: 'ISO-8859-1') do |row|

		data_hash = row.to_hash

		@data = Datum.new
		#if data_hash[:id].exists? && data_hash[:text].exists?
		@data.pid = data_hash["id"].to_i
		@data.data = data_hash["text"]
		@data.project_id = project_id
		@data.complete = false
	#	items << @data
		@data.save
	#	puts items
	end
  	#Datum.import(items)
  end 

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |datum|
        csv << datum.attributes.values_at(*column_names)
      end
    end
  end

end

