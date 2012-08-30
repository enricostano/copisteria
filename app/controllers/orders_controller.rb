# encoding: utf-8

class OrdersController < ApplicationController
  load_and_authorize_resource
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    #spostare il ciclo cart > line_items come metodo del modello Order
    cart = session[:cart]

    cart.each do | id, quantity |
      item = Project.find_by_id(id)
      @line_item = LineItem.new
      @line_item.project = item
      @line_item.quantity = quantity
      @line_item.price = item.price
      @order.line_items << @line_item
    end

    @order.user = current_user

    session.delete(:cart)

    respond_to do |format|
      if @order.save
        #Send an email to admin
        UserMailer.order_created_to_admin(@order).deliver

        format.html { redirect_to :dashboard, notice: "L'ordine è stato creato correttamente." }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def authorize
    @order = Order.find(params[:id])
    @order.authorized = true
    
    @order.line_items.each do | line_item |
      @url_connector = UrlConnector.new
      @url_connector.user = @order.user
      @url_connector.order = @order
      @url_connector.real_url = line_item.project.file.url
      @url_connector.temp_url = (0...6).map{ ('a'..'z').to_a[rand(26)] }.join
      @order.url_connectors << @url_connector
    end

    respond_to do |format|
      if @order.save
        #notify the user via email
        UserMailer.authorized_order_to_user(@order).deliver

        format.html { redirect_to dashboard_path, :notice => "L'ordine è stato autorizzato con successo" }
        format.json { head :no_content }
      else
        format.html { redirect_to dashboard_path, :notice => "L'ordine NON è stato autorizzato!" }
        format.json { head :no_content }
      end
    end
  end

  def download
    @url_connector = UrlConnector.where('temp_url = ?', params[:temp_url]).first
    if !@url_connector.nil?
      if @url_connectors.user_id == current_user_id
        send_file @url_connector.order.file.name
        #notify to admin
      end
    end
  end
end
