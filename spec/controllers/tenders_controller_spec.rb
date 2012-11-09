# spec/controllers/tenders_controller_spec.rb
require 'spec_helper'

describe TendersController do
  context "if the user pass all the authorizations" do
    let(:tenders) { mock("All the tenders") }
    let(:tender) { mock_model(Tender) }
    
    describe "GET #index" do
      before(:each) do
        should_authorize(:index, Tender)
        Tender.should_receive(:accessible_by).and_return(tenders)
        get :index
      end

      it "assigns a list of Tenders to @tenders" do
        assigns(:tenders).should eq(tenders)
      end
      it { should render_template :index }
    end

    describe "GET #show" do
      before(:each) do
        should_authorize(:show, tender)
        Tender.should_receive(:find).with("1").and_return(tender)
        get :show, id: "1"
      end

      it "assigns the requested Tender to @tender" do
        assigns(:tender).should eq(tender)
      end
      it { should render_template :show }
    end

    describe "GET #new" do
      before(:each) do
        should_authorize(:new, tender)
        Tender.should_receive(:new).and_return(tender)
        get :new
      end

      it "assigns a new Tender to @tender" do
        assigns(:tender).should eq(tender)
      end
      it { should render_template :new }
    end

    describe "GET #edit" do
      before(:each) do
        should_authorize(:edit, tender)
        Tender.should_receive(:find).with("1").and_return(tender)
        get :edit, id: "1"
      end

      it "assigns the requested Tender to @tender" do
        assigns(:tender).should eq(tender)
      end
      it { should render_template :edit }
    end

    describe "POST #create" do
      before(:each) do
        should_authorize(:create, tender)
        Tender.should_receive(:new).with("name" => "Diga sul fiume Chidro").and_return(tender)
      end

      context "with valid attributes" do
        before(:each) do
          tender.should_receive(:save).and_return(true)
          get :create, tender: { "name" => "Diga sul fiume Chidro" }
        end

        it "assigns a new Tender to @tender with some params" do
          assigns(:tender).should eq(tender)
        end
        it { should redirect_to(tender) }
        it { flash[:notice].should_not be_nil }
      end

      context "with invalid attributes" do
        before(:each) do
          tender.should_receive(:save).and_return(false)
          get :create, tender: { "name" => "Diga sul fiume Chidro" }
        end

        it { should render_template :new }
      end
    end

    describe "PUT #update" do
      before(:each) do
        should_authorize(:update, tender)
        Tender.should_receive(:find).with("1").and_return(tender)
      end

      context "with valid params" do
        before(:each) do
          tender.should_receive(:update_attributes).with("name" => "Diga sul fiume Chidro").and_return(true)
          get :update, id: "1", tender: { "name" => "Diga sul fiume Chidro" }
        end

        it "assigns the requested Tender to @tender" do
          assigns(:tender).should eq(tender)
        end
        it { should redirect_to(tender) }
        it { flash[:notice].should_not be_nil }
      end

      context "with invalid params" do
        before(:each) do
          tender.should_receive(:update_attributes).with("name" => "Diga sul fiume Chidro").and_return(false)
          get :update, id: "1", tender: { "name" => "Diga sul fiume Chidro" }
        end

        it { should render_template :edit }
      end
    end

    describe "DELETE #destroy" do
      before(:each) do
        should_authorize(:destroy, tender)
        Tender.should_receive(:find).with("1").and_return(tender)
        tender.should_receive(:destroy).and_return(false)
        get :destroy, id: "1"
      end
        
      it "assigns the requested Tender to @tender" do
        assigns(:tender).should eq(tender)
      end
      it { should redirect_to(tenders_url) }
    end
  end
end
