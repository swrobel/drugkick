class InquiriesController < ApplicationController
  # GET /inquiries
  # GET /inquiries.xml
  def index
    @inquiries = Inquiry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inquiries }
    end
  end

  # GET /inquiries/1
  # GET /inquiries/1.xml
  def show
    @inquiry = Inquiry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inquiry }
    end
  end

  # GET /inquiries/new
  # GET /inquiries/new.xml
  def new
    session[:inquiry_params] ||= {}  
    @inquiry = Inquiry.new(session[:inquiry_params])  
    @inquiry.current_step = session[:inquiry_step]  

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inquiry }
    end
  end

  # GET /inquiries/1/edit
  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  # POST /inquiries
  # POST /inquiries.xml
  def create
    session[:inquiry_params].deep_merge!(params[:inquiry]) if params[:inquiry]  
    @inquiry = Inquiry.new(session[:inquiry_params])  
    @inquiry.current_step = session[:inquiry_step]  
    if @inquiry.valid?  
      if params[:back_button]  
        @inquiry.previous_step  
      elsif @inquiry.last_step?  
        @inquiry.save if @inquiry.all_valid?  
      else  
        @inquiry.next_step  
      end  
      session[:inquiry_step] = @inquiry.current_step  
    end  
    if @inquiry.new_record?  
      render 'new'  
    else  
      session[:inquiry_step] = session[:inquiry_params] = nil  
      flash[:notice] = "Inquiry saved."  
      redirect_to @inquiry  
    end
    @inquiry = Inquiry.new(params[:inquiry])

    respond_to do |format|
      if @inquiry.save
        format.html { redirect_to(@inquiry, :notice => 'Inquiry was successfully created.') }
        format.xml  { render :xml => @inquiry, :status => :created, :location => @inquiry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inquiries/1
  # PUT /inquiries/1.xml
  def update
    @inquiry = Inquiry.find(params[:id])

    respond_to do |format|
      if @inquiry.update_attributes(params[:inquiry])
        format.html { redirect_to(@inquiry, :notice => 'Inquiry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.xml
  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy

    respond_to do |format|
      format.html { redirect_to(inquiries_url) }
      format.xml  { head :ok }
    end
  end
end
