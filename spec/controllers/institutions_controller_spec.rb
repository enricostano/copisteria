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
      it "assigns the requested institution to @institution"
      it "renders the :show template"
    end

    describe "GET #new" do
      it "assigns a new institution to @institution"
      it "renders the :new template"
    end

    describe "GET #edit" do
      it "assigns the requested institution to @institution"
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "assigns the requested institution to @institution"
        it "redirect to the institution page with notice"
      end

      context "with invalid attributes" do
        it "render :new template"
      end
    end

    describe "PUT #update" do
      context "with valid parameters" do
        it "assigns the requested institution to @institution"
        it "redirect to institution page with notice"
      end

      context "with invalid parameters" do
        it "renders de :edit template"
      end
    end
    
    describe "DELETE #destroy" do
      it "assigns the requested institution to @institution"
      it "redirect to :index template"
    end
  end
end
