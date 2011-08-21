class TreatmentTypesController < ApplicationController
  # GET /treatment_types
  # GET /treatment_types.xml
  def index
    @treatment_types = TreatmentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @treatment_types }
    end
  end

  # GET /treatment_types/1
  # GET /treatment_types/1.xml
  def show
    @treatment_type = TreatmentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @treatment_type }
    end
  end

  # GET /treatment_types/new
  # GET /treatment_types/new.xml
  def new
    @treatment_type = TreatmentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @treatment_type }
    end
  end

  # GET /treatment_types/1/edit
  def edit
    @treatment_type = TreatmentType.find(params[:id])
  end

  # POST /treatment_types
  # POST /treatment_types.xml
  def create
    @treatment_type = TreatmentType.new(params[:treatment_type])

    respond_to do |format|
      if @treatment_type.save
        format.html { redirect_to(@treatment_type, :notice => 'Treatment type was successfully created.') }
        format.xml  { render :xml => @treatment_type, :status => :created, :location => @treatment_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @treatment_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /treatment_types/1
  # PUT /treatment_types/1.xml
  def update
    @treatment_type = TreatmentType.find(params[:id])

    respond_to do |format|
      if @treatment_type.update_attributes(params[:treatment_type])
        format.html { redirect_to(@treatment_type, :notice => 'Treatment type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @treatment_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_types/1
  # DELETE /treatment_types/1.xml
  def destroy
    @treatment_type = TreatmentType.find(params[:id])
    @treatment_type.destroy

    respond_to do |format|
      format.html { redirect_to(treatment_types_url) }
      format.xml  { head :ok }
    end
  end
end
