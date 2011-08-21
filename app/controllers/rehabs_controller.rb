class RehabsController < ApplicationController
  # GET /rehabs
  # GET /rehabs.xml
  def index
    @rehabs = Rehab.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rehabs }
    end
  end

  # GET /rehabs/1
  # GET /rehabs/1.xml
  def show
    @rehab = Rehab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rehab }
    end
  end

  # GET /rehabs/new
  # GET /rehabs/new.xml
  def new
    @rehab = Rehab.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rehab }
    end
  end

  # GET /rehabs/1/edit
  def edit
    @rehab = Rehab.find(params[:id])
  end

  # POST /rehabs
  # POST /rehabs.xml
  def create
    @rehab = Rehab.new(params[:rehab])

    respond_to do |format|
      if @rehab.save
        format.html { redirect_to(@rehab, :notice => 'Rehab was successfully created.') }
        format.xml  { render :xml => @rehab, :status => :created, :location => @rehab }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rehab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rehabs/1
  # PUT /rehabs/1.xml
  def update
    @rehab = Rehab.find(params[:id])

    respond_to do |format|
      if @rehab.update_attributes(params[:rehab])
        format.html { redirect_to(@rehab, :notice => 'Rehab was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rehab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rehabs/1
  # DELETE /rehabs/1.xml
  def destroy
    @rehab = Rehab.find(params[:id])
    @rehab.destroy

    respond_to do |format|
      format.html { redirect_to(rehabs_url) }
      format.xml  { head :ok }
    end
  end
end
