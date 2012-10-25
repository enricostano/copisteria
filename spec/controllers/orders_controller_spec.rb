# spec/controllers/orders_controller_spec.rb
require 'spec_helper'

describe OrdersController do
  context "if the user pass all the authorizations" do
    let(:orders) { mock("All the orders") }
    let(:order) { mock_model(Order) }
    let(:user) { mock_model(User) }
    
    describe "GET #index" do
      before(:each) do
        should_authorize(:index, Order)
        Order.should_receive(:accessible_by).and_return(orders)
        get :index
      end

      it "assigns a list of Orders to @orders" do
        assigns(:orders).should eq(orders)
      end
      it { should render_template :index }
    end

    describe "GET #show" do
      before(:each) do
        should_authorize(:show, order)
        Order.should_receive(:find).with("1").and_return(order)
        get :show, id: "1"
      end

      it "assigns the requested Order to @order" do
        assigns(:order).should eq(order)
      end
      it { should render_template :show }
    end

    describe "GET #new" do
      before(:each) do
        should_authorize(:new, order)
        Order.should_receive(:new).and_return(order)
        get :new
      end

      it "assigns a new Order to @order" do
        assigns(:order).should eq(order)
      end
      it { should render_template :new }
    end

    describe "GET #edit" do
      before(:each) do
        should_authorize(:edit, order)
        Order.should_receive(:find).with("1").and_return(order)
        get :edit, id: "1"
      end

      it "assigns the requested Order to @order" do
        assigns(:order).should eq(order)
      end
      it { should render_template :edit }
    end

    describe "POST #create" do

      
      before(:each) do
        session[:cart] = { "1" => "1" }
        controller.stub!(:current_user).and_return(user)
        should_authorize(:create, order)
        Order.should_receive(:new).and_return(order)
      end

      context "with valid attributes" do
        before(:each) do
          order.should_receive(:add_line_items_to_order_from_cart).with("1" => "1").and_return(true)
          order.should_receive(:save).and_return(true)
          get :create
        end

        it "assigns a new Order to @order with some params" do
          assigns(:order).should eq(order)
        end
        it "assigns the cart in the session to cart" do
          assigns(:cart).should == { "1" => "1" }
        end
        it "assigns the current user to order.user" do
          assigns(:order.user).should eq(user)
        end
        it { should redirect_to(order) }
        it { flash[:notice].should_not be_nil }
      end

      context "with invalid attributes" do
        before(:each) do
          order.should_receive(:save).and_return(false)
          get :create, order: { "name" => "Diga sul fiume Chidro" }
        end

        it { should render_template :new }
      end
    end

    describe "PUT #update" do
      before(:each) do
        should_authorize(:update, order)
        Order.should_receive(:find).with("1").and_return(order)
      end

      context "with valid params" do
        before(:each) do
          order.should_receive(:update_attributes).with("user_id" => "1").and_return(true)
          get :update, id: "1", order: { "user_id" => "1" }
        end

        it "assigns the requested Order to @order" do
          assigns(:order).should eq(order)
        end
        it { should redirect_to(order) }
        it { flash[:notice].should_not be_nil }
      end

      context "with invalid params" do
        before(:each) do
          order.should_receive(:update_attributes).with("user_id" => "1").and_return(false)
          get :update, id: "1", order: { "user_id" => "1" }
        end

        it { should render_template :edit }
      end
    end

    describe "DELETE #destroy" do
      before(:each) do
        should_authorize(:destroy, order)
        Order.should_receive(:find).with("1").and_return(order)
        order.should_receive(:destroy).and_return(false)
        get :destroy, id: "1"
      end
        
      it "assigns the requested Order to @order" do
        assigns(:order).should eq(order)
      end
      it { should redirect_to(orders_url) }
    end

    describe "#authorize" do
      context "with valid Order" do
        it "assigns the requested Order to @order"
        it "add line items from cart to @order"
        it "set @order authorized true"
        it "notify the User via email"
        it "redirect to the Dashboard with positive notice"
      end

      context "with invalid Order" do
        it "redirect_to the Dashboard with negative notice"
      end
    end
  end
end
