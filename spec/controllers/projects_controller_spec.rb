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
      it { should render_template :index }
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
      it { should render_template :show }
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
      before(:each) do
        should_authorize(:create, project)
        Project.should_receive(:new).with("name" => "Diga sul fiume Chidro").and_return(project)
      end

      context "with valid attributes" do
        before(:each) do
          project.should_receive(:save).and_return(true)
          get :create, project: { "name" => "Diga sul fiume Chidro" }
        end

        it "assigns a new Project to @project with some params" do
          assigns(:project).should eq(project)
        end
        it { should redirect_to(project) }
        it { flash[:notice].should_not be_nil }
      end

      context "with invalid attributes" do
        before(:each) do
          project.should_receive(:save).and_return(false)
          get :create, project: { "name" => "Diga sul fiume Chidro" }
        end

        it { should render_template :new }
      end
    end

    describe "PUT #update" do
      before(:each) do
        should_authorize(:update, project)
        Project.should_receive(:find).with("1").and_return(project)
      end

      context "with valid params" do
        before(:each) do
          project.should_receive(:update_attributes).with("name" => "Diga sul fiume Chidro").and_return(true)
          get :update, id: "1", project: { "name" => "Diga sul fiume Chidro" }
        end

        it "assigns the requested Project to @project" do
          assigns(:project).should eq(project)
        end
        it { should redirect_to(project) }
        it { flash[:notice].should_not be_nil }
      end

      context "with invalid params" do
        before(:each) do
          project.should_receive(:update_attributes).with("name" => "Diga sul fiume Chidro").and_return(false)
          get :update, id: "1", project: { "name" => "Diga sul fiume Chidro" }
        end

        it { should render_template :edit }
      end
    end

    describe "DELETE #destroy" do
      before(:each) do
        should_authorize(:destroy, project)
        Project.should_receive(:find).with("1").and_return(project)
        project.should_receive(:destroy).and_return(false)
        get :destroy, id: "1"
      end
        
      it "assigns the requested Project to @project" do
        assigns(:project).should eq(project)
      end
      it { should redirect_to(projects_url) }
    end
  end
end
