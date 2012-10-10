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
        #User.stub!(:new).and_return(@user)
        should_authorize(:new, @user)
      end
      it "assigns a new User to @user" do
        #User.should_receive(:new).and_return(User.new)
        get :new 
        #@user.should be_an_instance_of User
      end
      it "populates an array of roles in @roles" 
      it "renders the :new template"
    end
    
    describe "POST #create" do
      it "should pass parameters to @user" do
        User.stub!(:create).with({ :email => 'puppa@puppa.pup' }).and_return( @user = mock_model(User, email: 'puppa@puppa.pup') )
        should_authorize(:create, @user)
        User.should_receive(:create).with({ :email => 'puppa@puppa.pup' }).and_return(@user)
        post :create, :user => { :email => 'puppa@puppa.pup' }
        assigns[:user].email.should eq('puppa@puppa.pup')
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
  end
end
