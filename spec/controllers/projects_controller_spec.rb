# spec/controllers/projects_controller_spec.rb
require 'spec_helper'

describe ProjectsController do
  context "if the user pass all the authorizations" do
    let(:projects) { mock("All the projects") }
    let(:project) { mock_model(Project) }
    
    describe "GET #index" do
      before(:each) do
        should_authorize(:index, Project)
        Project.should_receive(:accessible_by).and_return(projects)
        get :index
      end

      it "assigns a list of Projects to @projects" do
        assigns(:projects).should eq(projects)
      end
      it "renders the #index template" do
        response.should render_template :index
      end
    end

    describe "GET #show" do
      before(:each) do
        should_authorize(:show, project)
        Project.should_receive(:find).with("1").and_return(project)
        get :show, id: "1"
      end

      it "assigns the requested Project to @project" do
        assigns(:project).should eq(project)
      end
      it "renders the #show template" do
        response.should render_template :show
      end
    end

    describe "GET #new" do
      before(:each) do
        should_authorize(:new, project)
        Project.should_receive(:new).and_return(project)
        get :new
      end

      it "assigns a new Project to @project" do
        assigns(:project).should eq(project)
      end
      it { should render_template :new }
    end

    describe "GET #edit" do
      before(:each) do
        should_authorize(:edit, project)
        Project.should_receive(:find).with("1").and_return(project)
        get :edit, id: "1"
      end

      it "assigns the requested Project to @project" do
        assigns(:project).should eq(project)
      end
      it { should render_template :edit }
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "assigns a new Project to @project with some params"
        it "redirect to the project page with notice"
      end

      context "with invalid attributes" do
        it "renders the :new template"
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        it "assigns the requested Project to @project"
        it "redirects to the project page with notice"
      end

      context "with invalid params" do
        it "renders the :edit template"
      end
    end

    describe "DELETE #destroy" do
      it "assigns the requested Project to @project"
      it "redirects to #index action"
    end
  end
end
