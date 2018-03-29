class ProjectsController < ApplicationController

  def show
    @project = Project.find_by(id: params["id"])
  end

  def new
    @project = Project.new
  end

  def update
    @project = Project.find_by(id: params["id"])
    @project.title = params["title"]
    @project.description = params["description"]
    @project.logo_url = params["logo_url"]
    @project.user_id =  params["owner_id"].to_i
    if params["is_public"].nil?
      @project.is_public =  false
    else
      @project.is_public =  true
    end
    
    if @project.save
      redirect_to "/projects", notice: "Your project has been updated!"
    else
      render 'update'
    end
  end

  def destroy
    project = Project.find_by(id: params["id"])
    project.delete
    redirect_to "/projects"
  end

  def create

    @project = Project.new
    @project.title = params["title"]
    @project.description = params["description"]
    @project.logo_url = params["logo_url"]
    @project.user_id =  params["owner_id"].to_i
    if params["is_public"].nil?
      @project.is_public =  false
    else
      @project.is_public =  true
    end
    
    if @project.save
      redirect_to "/projects", notice: "Your project has been created! Click on the logo to add data."
    else
      render 'new'
    end
  end

  

end