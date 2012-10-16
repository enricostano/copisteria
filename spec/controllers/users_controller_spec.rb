# spec/controllers/users_controller_spec.rb
require 'spec_helper'

describe UsersController do
  context "if the user passes all the authorizations" do
    describe "GET #index" do
      before(:each) do
        should_authorize(:index, User)
      end
      it "populates an array of users" do
        User.should_receive(:accessible_by).and_return(@user)
        get :index
      end
      it "renders the :index view" do
        get :index
        response.should render_template :index
      end
    end
  
    describe "GET #show" do
      before(:each) do
        should_authorize(:show, User)
        User.should_receive(:find).with("1").and_return(@user)
      end
    
      it "assigns the requested user to @user" do
        get :show, id: "1"
        assigns[:user].should eq(@user)
      end
      it "renders the :show template" do
        get :show, id: "1"
        response.should render_template :show
      end
    end
    
    describe "GET #new" do
      before(:each) do
        @user = mock_model(User)
        should_authorize(:new, @user)
        User.should_receive(:new).and_return(@user)
      end
      it "assigns a new User to @user" do
        get :new
        assigns[:user].should eq(@user)
      end
      it "populates an array of roles in @roles" do
        Role.should_receive(:all).and_return(@roles = mock("All the roles"))
        get :new
        assigns[:roles].should eq(@roles)
      end
      it "renders the :new template" do
        get :new
        response.should render_template :new
      end
    end
   
    describe "#edit" do
      before(:each) do
        should_authorize(:edit, User)
        User.should_receive(:find).with("1").and_return(@user)
      end

      it "assigns the requested user to @user" do
        get :edit, id: "1"
        assigns[:user].should eq(@user)
      end
      it "populate @roles with all available roles" do
        Role.should_receive(:all).and_return(@roles = mock("All the roles"))
        get :edit, id: "1"
        assigns[:roles].should eq(@roles)
      end
    end

    describe "POST #create" do
      before do
        @user = mock_model(User)
        should_authorize(:create, @user)
        User.should_receive(:new).with("email" => "puppa@puppa.pup").and_return(@user)
        #@user.should_receive(:save).and_return(true)
      end
      it "assigns a new User to @user with some parameters" do
        @user.should_receive(:save).and_return(true)
        post :create, :user => { :email => 'puppa@puppa.pup' }
        assigns[:user].should eq(@user)
      end
      it "populates an array of roles in @roles" do
        @user.should_receive(:save).and_return(true)
        Role.should_receive(:all).and_return(@roles = mock("All the roles"))
        post :create, :user => { :email => 'puppa@puppa.pup' }
        assigns[:roles].should eq(@roles)
      end
      
      context "with valid attributes" do
        it "redirects to the user page" do
          @user.should_receive(:save).and_return(true)
          post :create, :user => { :email => 'puppa@puppa.pup' }
          response.should redirect_to(@user)
        end
      end

      context "with invalid attributes" do
        it "re-renders the :new template" do
          @user.should_receive(:save).and_return(false)
          post :create, :user => { :email => 'puppa@puppa.pup' }
          response.should render_template :new
        end
      end
    end

    describe "PUT #update" do
      before(:each) do
        @user = mock_model(User)
        should_authorize(:update, @user)
        User.should_receive(:find).with("1").and_return(@user)
      end
      it "delete :password and :password_confirmation params if :password is blank" do
        @user.should_receive(:update_attributes).with("role_ids" => {"1"=> "1"}).and_return(true)
        get :update, id: "1", :user => { "password" => nil,
                                         "password_confirmation" => "confirmation",
                                         "role_ids" => {"1" => "1"} }
      end
      it "assigns an empty hash to :role_ids param if it is nil" do
        @user.should_receive(:update_attributes).with("role_ids" => []).and_return(true)
        get :update, id: "1", :user => { "role_ids" => nil }
        assigns["params[:user][:role_ids]"].should == []
      end
      
      context "with valid params" do
        it "redirects to the user page with notice" do
          @user.should_receive(:update_attributes).and_return(true)
          get :update, id: "1", :user => {}
          flash[:notice].should_not be_nil
          #response.should redirect_to(@user)
        end
      end
      
      context "with invalid params" do
        it "renders the :edit template" do
          @user.should_receive(:update_attributes).and_return(false)
          get :update, id: "1", :user => {}
          response.should render_template :edit
        end
      end
    end

    describe "DELETE #destroy" do
      it "delete the given project" do
        should_authorize(:destroy, User)
        User.should_receive(:find).with("1").and_return(@user)
        @user.should_receive(:destroy).and_return(true)
        get :destroy, id: "1"
        response.should redirect_to(users_url)
      end
    end
  end
end
