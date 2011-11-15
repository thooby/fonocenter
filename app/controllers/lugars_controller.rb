class LugarsController < ApplicationController
  before_filter :authenticate_user!
  # GET /lugars
  # GET /lugars.json
  def index
    @lugars = Lugar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @lugars }
    end
  end

  # GET /lugars/1
  # GET /lugars/1.json
  def show
    @lugar = Lugar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @lugar }
    end
  end

  # GET /lugars/new
  # GET /lugars/new.json
  def new
    @lugar = Lugar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @lugar }
    end
  end

  # GET /lugars/1/edit
  def edit
    @lugar = Lugar.find(params[:id])
  end

  # POST /lugars
  # POST /lugars.json
  def create
    @lugar = Lugar.new(params[:lugar])

    respond_to do |format|
      if @lugar.save
        format.html { redirect_to @lugar, :notice => 'Lugar was successfully created.' }
        format.json { render :json => @lugar, :status => :created, :location => @lugar }
      else
        format.html { render :action => "new" }
        format.json { render :json => @lugar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lugars/1
  # PUT /lugars/1.json
  def update
    @lugar = Lugar.find(params[:id])

    respond_to do |format|
      if @lugar.update_attributes(params[:lugar])
        format.html { redirect_to @lugar, :notice => 'Lugar was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @lugar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lugars/1
  # DELETE /lugars/1.json
  def destroy
    @lugar = Lugar.find(params[:id])
    @lugar.destroy

    respond_to do |format|
      format.html { redirect_to lugars_url }
      format.json { head :ok }
    end
  end
end
