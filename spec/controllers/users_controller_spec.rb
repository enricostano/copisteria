# spec/controllers/users_controller_spec.rb
require 'spec_helper'

describe UsersController do
  context "if the user passes all the authorizations" do
    describe "GET #index" do
      before(:each) do
        should_authorize(:index, User)
      end
      it "populates an array of users" do
        @user = mock_model(User)
        User.should_receive(:all).and_return(@user)
        get :index
      end
      it "renders the :index view" do
        get :index
        response.should render_template :index
      end
    end
  
    describe "GET #show" do
      before(:each) do
        @user = mock_model(User)
        should_authorize(:show, @user)
      end
    
      it "assigns the requested user to @user" do
        # receive 1 call from CanCan #authorize! and 1 from the controller, so... twice
        User.should_receive(:find).with("1").twice.and_return(@user)
        get :show, id: "1"
      end
      it "renders the :show template" do
        get :show, id: "1"
        response.should render_template :show
      end
    end
    
    describe "GET #new" do
      before do
        @user = User.new
        should_authorize(:new, @user)
        User.stub(:new).and_return(@user)
      end
      it "assigns a new User to @user" do
        User.should_receive(:new).and_return(@user)
        get :new
        response.should be_success
      end
      it "populates an array of roles in @roles" do
        role = mock_model(Role)
        Role.should_receive(:all).and_return(role)
        get :new
      end
      it "renders the :new template" do
        get :new
        response.should render_template :new
      end
    end
    
    describe "POST #create" do
      before do
        @user = User.new
        should_authorize(:create, @user)
        User.stub(:new).with("email" => "puppa@puppa.pup").and_return(@user)
      end
      it "should pass parameters to @user" do
        #User.stub!(:create).with({ :email => 'puppa@puppa.pup' }).and_return( @user = mock_model(User, email: 'puppa@puppa.pup') )
        should_authorize(:create, mock_model(User, :email => 'puppa@puppa.pup'))
        #User.should_receive(:create).with({ :email => 'puppa@puppa.pup' }).and_return(@user)
        post :create, :user => { :email => 'puppa@puppa.pup' }
        assigns[:user].email.should eq('puppa@puppa.pup')
      end
      it "populates an array of roles in @roles" do
        role = mock_model(Role)
        Role.should_receive(:all).and_return(role)
        post :create, :user => { :email => 'puppa@puppa.pup' }
      end
      
      context "with valid attributes" do
        before do
          User.stub!(:valid?).and_return(true)
        end
        it "saves the new user in the database"
          #assigns[:user].should be_new_record
        it "redirects to the user page"
      end

      context "with invalid attributes" do
        it "does not save the new user in the database"
        it "re-renders the :new template"
      end
    end

    describe "PUT #update" do
      before(:each) do
        @user = mock_model(User)
        should_authorize(:update, @user)
        User.should_receive(:find).with("1").twice.and_return(@user)
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
      end
      it "assigns the requested user to @user" do
        @user.should_receive(:update_attributes).with("role_ids" => []).and_return(true)
        # it's already checked in the before...
        get :update, id: "1", :user => {}
      end
      
      context "with valid params" do
        before(:each) do
          @user.should_receive(:update_attributes).with("role_ids" => []).and_return(true)
          @user.stub!(:valid?).and_return(true)
        end
        it "update attributes with params" do
          @user.should_receive(:valid?).and_return(true)
          get :update, id: "1", :user => {}
        end
        it "redirects to the user page with notice"
      end
      
      context "with invalid params" do
        it "re-renders the :edit template"
      end
    end
  end
end
