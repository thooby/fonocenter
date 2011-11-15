class RegistrosController < ApplicationController
  # GET /registros
  # GET /registros.json
  def index
    @registros = Registro.page(params[:page])
    #@registros = Registro.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @registros }
    end
  end
  def stats
    @users = User.all
    @stats = Registro.informe
    @stats2 = Registro.informe_dias(30)
    x=Date.new(2011,9,4)
    @stats3 = Registro.informe_mes(x)
    respond_to do |format|
      format.html # stats.html.erb
      format.json { render :json => @stats }
    end
  end

  # GET /registros/1
  # GET /registros/1.json
  def show
    @registro = Registro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @registro }
    end
  end

  # GET /registros/new
  # GET /registros/new.json
  def new
    @registro = Registro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @registro }
    end
  end

  # GET /registros/1/edit
  def edit
    @registro = Registro.find(params[:id])
  end

  # POST /registros
  # POST /registros.json
  def create
    @registro = Registro.new(params[:registro])

    respond_to do |format|
      if @registro.save
        format.html { redirect_to @registro, :notice => 'Registro was successfully created.' }
        format.json { render :json => @registro, :status => :created, :location => @registro }
      else
        format.html { render :action => "new" }
        format.json { render :json => @registro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registros/1
  # PUT /registros/1.json
  def update
    @registro = Registro.find(params[:id])
    respond_to do |format|
      if @registro.update_attributes(params[:registro])
        format.html { redirect_to @registro, :notice => 'Registro was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @registro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registros/1
  # DELETE /registros/1.json
  def destroy
    @registro = Registro.find(params[:id])
    @registro.destroy

    respond_to do |format|
      format.html { redirect_to registros_url }
      format.json { head :ok }
    end
  end
  def welcome
  end
end
