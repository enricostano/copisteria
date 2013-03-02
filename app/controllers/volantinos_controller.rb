class VolantinosController < ApplicationController
  # GET /volantinos
  # GET /volantinos.json
  def index
    @volantinos = Volantino.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @volantinos }
    end
  end

  # GET /volantinos/1
  # GET /volantinos/1.json
  def show
    @volantino = Volantino.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volantino }
    end
  end

  # GET /volantinos/new
  # GET /volantinos/new.json
  def new
    @volantino = Volantino.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @volantino }
    end
  end

  # GET /volantinos/1/edit
  def edit
    @volantino = Volantino.find(params[:id])
  end

  # POST /volantinos
  # POST /volantinos.json
  def create
    @volantino = Volantino.new(params[:volantino])

    respond_to do |format|
      if @volantino.save
        format.html { redirect_to @volantino, notice: 'Volantino was successfully created.' }
        format.json { render json: @volantino, status: :created, location: @volantino }
      else
        format.html { render action: "new" }
        format.json { render json: @volantino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /volantinos/1
  # PUT /volantinos/1.json
  def update
    @volantino = Volantino.find(params[:id])

    respond_to do |format|
      if @volantino.update_attributes(params[:volantino])
        format.html { redirect_to @volantino, notice: 'Volantino was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @volantino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volantinos/1
  # DELETE /volantinos/1.json
  def destroy
    @volantino = Volantino.find(params[:id])
    @volantino.destroy

    respond_to do |format|
      format.html { redirect_to volantinos_url }
      format.json { head :no_content }
    end
  end
end
