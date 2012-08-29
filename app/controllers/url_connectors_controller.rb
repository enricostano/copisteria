class UrlConnectorsController < ApplicationController
  # GET /url_connectors
  # GET /url_connectors.json
  def index
    @url_connectors = UrlConnector.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @url_connectors }
    end
  end

  # GET /url_connectors/1
  # GET /url_connectors/1.json
  def show
    @url_connector = UrlConnector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @url_connector }
    end
  end

  # GET /url_connectors/new
  # GET /url_connectors/new.json
  def new
    @url_connector = UrlConnector.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @url_connector }
    end
  end

  # GET /url_connectors/1/edit
  def edit
    @url_connector = UrlConnector.find(params[:id])
  end

  # POST /url_connectors
  # POST /url_connectors.json
  def create
    @url_connector = UrlConnector.new(params[:url_connector])

    respond_to do |format|
      if @url_connector.save
        format.html { redirect_to @url_connector, notice: 'Url connector was successfully created.' }
        format.json { render json: @url_connector, status: :created, location: @url_connector }
      else
        format.html { render action: "new" }
        format.json { render json: @url_connector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /url_connectors/1
  # PUT /url_connectors/1.json
  def update
    @url_connector = UrlConnector.find(params[:id])

    respond_to do |format|
      if @url_connector.update_attributes(params[:url_connector])
        format.html { redirect_to @url_connector, notice: 'Url connector was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @url_connector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_connectors/1
  # DELETE /url_connectors/1.json
  def destroy
    @url_connector = UrlConnector.find(params[:id])
    @url_connector.destroy

    respond_to do |format|
      format.html { redirect_to url_connectors_url }
      format.json { head :no_content }
    end
  end
end
