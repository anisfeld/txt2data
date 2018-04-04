class DataController < ApplicationController

  def destroy
    datum = Datum.find_by(id: params[:id])
    datum.delete
    project = Project.find_by(id: params[:project_id])
    if project.data_id == params[:id]
    	project.data_id = nil
    	project.data_id = Datum.where(project_id: params[:project_id]).first.id
    	project.save
    end

    redirect_to "/projects/#{params[:project_id]}/"
  end




  def update
  	@data = Datum.find_by(id: params["id"])


  @data.field_1 = params["datum"]["field_1"]
	@data.field_2 = params["datum"]["field_2"]
	@data.field_3 = params["datum"]["field_3"]
	@data.field_4 = params["datum"]["field_4"]
	@data.field_5 = params["datum"]["field_5"]
  @data.field_1_on = params["datum"]["field_1_on"]
  @data.field_2_on = params["datum"]["field_2_on"]
  @data.field_3_on = params["datum"]["field_3_on"]
  @data.complete = true
	
	if @data.save
	  project = Project.find_by(id: params[:project_id])
	  next_data = Datum.where(complete: false).where(project_id: params[:project_id]).first
	  if next_data.present?
		  project.data_id = next_data.id
		  project.save
	      redirect_to "/projects/#{params[:project_id]}/data/#{next_data.id}/edit", notice: "Your project has been updated!"
      else
      	project.data_id = -1
		project.save
      	redirect_to "/projects/#{params[:project_id]}/", notice: "Your project is complete!"
      end
    else
      render 'update', notice: "Sorry! We could not save your changes."
    end

  end



  def show
  	@data = Datum.find_by(id: params["id"])
  end

  def import
    begin
      puts params[:file]
      notice = "Data imported."
      Datum.import(params[:file], params[:id])
    rescue
      notice = ""
    end 
    
      # Connect data to project so we know how to find the next text for analysis
      project = Project.find_by(id: params[:id])

     if Datum.where(project_id: params[:id]).present?
      	project.data_id = Datum.where(project_id: params[:id]).first.id
      	project.save
     else
     	notice = "Could not update project"
     end
    
  	 redirect_to "/projects/#{params[:id]}/", notice: notice
  end
end















