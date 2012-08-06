class FileProjectsController < ApplicationController
  # GET /file_projects
  # GET /file_projects.json
  def index
    @file_projects = FileProject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @file_projects }
    end
  end

  # GET /file_projects/1
  # GET /file_projects/1.json
  def show
    @file_project = FileProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @file_project }
    end
  end

  # GET /file_projects/new
  # GET /file_projects/new.json
  def new
    @file_project = FileProject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @file_project }
    end
  end

  # GET /file_projects/1/edit
  def edit
    @file_project = FileProject.find(params[:id])
  end

  # POST /file_projects
  # POST /file_projects.json
  def create
    @file_project = FileProject.new(params[:file_project])

    respond_to do |format|
      if @file_project.save
        format.html { redirect_to @file_project, notice: 'File project was successfully created.' }
        format.json { render json: @file_project, status: :created, location: @file_project }
      else
        format.html { render action: "new" }
        format.json { render json: @file_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /file_projects/1
  # PUT /file_projects/1.json
  def update
    @file_project = FileProject.find(params[:id])

    respond_to do |format|
      if @file_project.update_attributes(params[:file_project])
        format.html { redirect_to @file_project, notice: 'File project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @file_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_projects/1
  # DELETE /file_projects/1.json
  def destroy
    @file_project = FileProject.find(params[:id])
    @file_project.destroy

    respond_to do |format|
      format.html { redirect_to file_projects_url }
      format.json { head :no_content }
    end
  end
end
