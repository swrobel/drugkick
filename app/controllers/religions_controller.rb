class ReligionsController < ApplicationController
  # GET /religions
  # GET /religions.xml
  def index
    @religions = Religion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @religions }
    end
  end

  # GET /religions/1
  # GET /religions/1.xml
  def show
    @religion = Religion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @religion }
    end
  end

  # GET /religions/new
  # GET /religions/new.xml
  def new
    @religion = Religion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @religion }
    end
  end

  # GET /religions/1/edit
  def edit
    @religion = Religion.find(params[:id])
  end

  # POST /religions
  # POST /religions.xml
  def create
    @religion = Religion.new(params[:religion])

    respond_to do |format|
      if @religion.save
        format.html { redirect_to(@religion, :notice => 'Religion was successfully created.') }
        format.xml  { render :xml => @religion, :status => :created, :location => @religion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @religion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /religions/1
  # PUT /religions/1.xml
  def update
    @religion = Religion.find(params[:id])

    respond_to do |format|
      if @religion.update_attributes(params[:religion])
        format.html { redirect_to(@religion, :notice => 'Religion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @religion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /religions/1
  # DELETE /religions/1.xml
  def destroy
    @religion = Religion.find(params[:id])
    @religion.destroy

    respond_to do |format|
      format.html { redirect_to(religions_url) }
      format.xml  { head :ok }
    end
  end
end
