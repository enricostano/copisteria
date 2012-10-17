# spec/controllers/institutions_controller_spec.rb
require 'spec_helper'

describe InstitutionsController do
  context "if the user pass all the authorizations" do
    describe "GET #index" do
      before(:each) do
        should_authorize(:index, Institution)
        Institution.should_receive(:accessible_by).and_return(@institutions = mock("All the institutions"))
        get :index
      end

      it "assigns all the Institutions to @institutions" do
        assigns(:institutions).should eq(@institutions)
      end
      it "renders the :index template" do
        response.should render_template :index
      end
    end

    describe "GET #show" do
      before(:each) do
        @institution = mock_model(Institution)
        should_authorize(:show, @institution)
        Institution.should_receive(:find).with("1").and_return(@institution)
        get :show, id: "1"
      end

      it "assigns the requested institution to @institution" do
        assigns(:institution).should eq(@institution)
      end
      it "renders the :show template" do
        response.should render_template :show
      end
    end

    describe "GET #new" do
      before(:each) do
        @institution = mock_model(Institution)
        should_authorize(:new, @institution)
        Institution.should_receive(:new).and_return(@institution)
        get :new
      end

      it "assigns a new institution to @institution" do
        assigns(:institution).should eq(@institution)
      end
      it "renders the :new template" do
        response.should render_template :new
      end
    end

    describe "GET #edit" do
      it "assigns the requested institution to @institution" do
        @institution = mock_model(Institution)
        should_authorize(:edit, @institution)
        Institution.should_receive(:find).with("1").and_return(@institution)
        get :edit, id: "1"
        assigns(:institution).should eq(@institution)
      end
    end

    describe "POST #create" do
      before(:each) do
        @institution = mock_model(Institution)
        should_authorize(:create, @institution)
        Institution.should_receive(:new).with("name" => "Comune di Puppa").and_return(@institution)
      end

      context "with valid attributes" do
        before(:each) do
          @institution.should_receive(:save).and_return(true)
          get :create, institution: { "name" => "Comune di Puppa" }
        end

        it "assigns a new Institution to @institution with some params" do
          assigns(:institution).should eq(@institution)
        end
        it "redirect to the institution page with notice" do
          response.should redirect_to(@institution)
          flash[:notice].should_not be_nil
        end
      end

      context "with invalid attributes" do
        it "render :new template" do
          @institution.should_receive(:save).and_return(false)
          get :create, institution: { "name" => "Comune di Puppa" }
          response.should render_template :new
        end
      end
    end

    describe "PUT #update" do
      before(:each) do
        @institution = mock_model(Institution)
        should_authorize(:update, @institution)
        Institution.should_receive(:find).with("1").and_return(@institution)
      end

      context "with valid parameters" do
        before(:each) do
          @institution.should_receive(:update_attributes).with("name" => "Comune di Puppa").and_return(true)
          get :update, id: "1", institution: { "name" => "Comune di Puppa" }
        end

        it "assigns the requested institution to @institution" do
          assigns(:institution).should eq(@institution)
        end
        it "redirect to institution page with notice" do
          response.should redirect_to(@institution)
          flash[:notice].should_not be_nil
        end
      end

      context "with invalid parameters" do
        it "renders de :edit template" do
          @institution.should_receive(:update_attributes).with("name" => "Comune di Puppa").and_return(false)
          get :update, id: "1", institution: { "name" => "Comune di Puppa" }
          response.should render_template :edit
        end
      end
    end
    
    describe "DELETE #destroy" do
      before(:each) do
        @institution = mock_model(Institution)
        should_authorize(:destroy, @institution)
        Institution.should_receive(:find).with("1").and_return(@institution)
        @institution.should_receive(:destroy).and_return(true)
        get :destroy, id: "1"
      end
        
      it "assigns the requested institution to @institution" do
        assigns(:institution).should eq(@institution)
      end
      it "redirect to :index action" do
        response.should redirect_to(institutions_url)
      end
    end
  end
end
