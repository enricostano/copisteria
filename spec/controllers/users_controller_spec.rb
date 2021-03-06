# spec/controllers/users_controller_spec.rb
require 'spec_helper'

describe UsersController do
  context "if the user passes all the authorizations" do
    describe "GET #index" do
      before(:each) do
        should_authorize(:index, User)
        User.should_receive(:accessible_by).and_return(@users = mock("All the users the user can see"))
        get :index
      end

      it "populates an array of users in @users" do
        assigns(:users).should eq(@users)
      end
      it "renders the :index view" do
        response.should render_template :index
      end
    end
  
    describe "GET #show" do
      before(:each) do
        @user = mock_model(User)
        should_authorize(:show, @user)
        User.should_receive(:find).with("1").and_return(@user)
        get :show, id: "1"
      end
    
      it "assigns the requested user to @user" do
        assigns[:user].should eq(@user)
      end
      it "renders the :show template" do
        response.should render_template :show
      end
    end
    
    describe "GET #new" do
      before(:each) do
        @user = mock_model(User)
        should_authorize(:new, @user)
        User.should_receive(:new).and_return(@user)
        Role.should_receive(:all).and_return(@roles = mock("All the roles"))
        get :new
      end

      it "assigns a new User to @user" do
        assigns[:user].should eq(@user)
      end
      it "populates an array of roles in @roles" do
        assigns[:roles].should eq(@roles)
      end
      it "renders the :new template" do
        response.should render_template :new
      end
    end
   
    describe "#edit" do
      before(:each) do
        @user = mock_model(User)
        should_authorize(:edit, @user)
        User.should_receive(:find).with("1").and_return(@user)
        Role.should_receive(:all).and_return(@roles = mock("All the roles"))
        get :edit, id: "1"
      end

      it "assigns the requested user to @user" do
        assigns[:user].should eq(@user)
      end
      it "populate @roles with all available roles" do
        assigns[:roles].should eq(@roles)
      end
    end

    describe "POST #create" do
      before do
        @user = mock_model(User)
        should_authorize(:create, @user)
        User.should_receive(:new).with("email" => "puppa@puppa.pup").and_return(@user)
      end
      context "with valid attributes" do
        before do
          @user.should_receive(:save).and_return(true)
          Role.should_receive(:all).and_return(@roles = mock("All the roles"))
          post :create, :user => { :email => 'puppa@puppa.pup' }
        end
        it "assigns a new User to @user with some parameters" do
          assigns[:user].should eq(@user)
        end
        it "populates an array of roles in @roles" do
          assigns[:roles].should eq(@roles)
        end
        it "redirects to the user page with notice" do
          flash[:notice].should_not be_nil
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

      context "with valid parameters" do
        before(:each) do
          @user.should_receive(:update_attributes).with("email" => "puppa@puppa.pup").and_return(true)
          get :update, id: "1", :user => { :email => "puppa@puppa.pup" }
        end
      
        it "assigns the requested user to @user" do
          assigns(:user).should eq(@user)
        end
        #it "assigns an empty hash to :role_ids param if it is nil" do
          #get :update, id: "1", :user => { "role_ids" => nil }
          #assigns["params[:user][:role_ids]"].should == []
        #end
        it "redirects to the user page with notice" do
          flash[:notice].should_not be_nil
          response.should redirect_to(@user)
        end
      end
      
      context "with invalid params" do
        before(:each) do
          @user.should_receive(:update_attributes).and_return(false)
          get :update, id: "1", :user => { "password" => nil,
                                           "password_confirmation" => "confirmation",
                                           "email" => "puppa@puppa.pup" }
        end
        
        it "delete :password and :password_confirmation params if :password is blank" do
          controller.params[:user][:password].should be_nil
          controller.params[:user][:password_confirmation].should be_nil
        end
        it "renders the :edit template" do
          response.should render_template :edit
        end
      end
    end

    describe "DELETE #destroy" do
      before(:each) do
        @user = mock_model(User)
        should_authorize(:destroy, @user)
        User.should_receive(:find).with("1").and_return(@user)
        @user.should_receive(:destroy).and_return(true)
        get :destroy, id: "1"
      end

      it "assigns the requested user to @user" do
        assigns(:user).should eq(@user)
      end
      it "redirect to User index view" do
        response.should redirect_to(users_url)
      end
    end
  end
end
