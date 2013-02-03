class UsersController < ApplicationController
  authorize_resource
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  # GET /admin/users/new
  # GET /admin/users/new.json
  def new
    #@user = User.new
    @roles = Role.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    #@user = User.find(params[:id])
    @roles = Role.all
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    #@user = User.new(params[:user])
    @roles = Role.all

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/users/1
  # PUT /admin/users/1.json
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    #params[:user][:role_ids] ||= []
    #@user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    #@user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
