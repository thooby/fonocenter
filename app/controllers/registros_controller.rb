class RegistrosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin_user!,  :except => [:index, :show, :new, :create, :welcome]
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
  def trozos
  end
  def presenta_trozo
    datos = params[:registro]
    fecha_ini = Date.new(datos['fecha_ini(1i)'].to_i,datos['fecha_ini(2i)'].to_i,datos['fecha_ini(3i)'].to_i)
    fecha_fin = Date.new(datos['fecha_fin(1i)'].to_i,datos['fecha_fin(2i)'].to_i,datos['fecha_fin(3i)'].to_i)
    @registros = Registro.sel_trozo(fecha_ini,fecha_fin,datos['lugar_id'])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @registros }
    end
  end
  def stats
    @x=Date.new(params["registro"]["fecha(1i)"].to_i,params["registro"]["fecha(2i)"].to_i,params["registro"]["fecha(3i)"].to_i)
    @discri = params["registro"]["stat_op"].to_i
    lugar_id = params["registro"]["lugar_id"].to_i
    @users = User.all
    @stats = Registro.informe_op(@x, @discri,lugar_id)
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
  def find
  end
end
