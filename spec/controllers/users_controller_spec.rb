# spec/controllers/users_controller_spec.rb
require 'spec_helper'

describe UsersController do
  before do
    ['SuperAdmin', 'Admin', 'User'].each { |rolename| FactoryGirl.create(:role, name: rolename) }
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET #index" do
    it "populates an array of contacts" do
      get :index
      assigns(:users).should eq([user])
    end
    it "renders the :index view"
  end
  describe "GET #show" do
    it "assigns the requested user to @user"
    it "renders the :show template"
  end
  describe "GET #new" do
    it "assigns a new User to @user"
    it "populates an array of roles in @roles"
    it "renders the :new template"
  end
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database"
      it "redirects to the user page"
    end

    context "with invalid attributes" do
      it "does not save the new user in the database"
      it "re-renders the :new template"
    end
  end
end
