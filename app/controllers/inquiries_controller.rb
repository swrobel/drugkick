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
    redirect_to new_inquiry_path
    # @inquiry = Inquiry.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @inquiry }
    # end
  end

  # GET /inquiries/new
  # GET /inquiries/new.xml
  def new
    session[:inquiry_params] ||= {} 
    if session[:inquiry_id]
      @inquiry = Inquiry.find(session[:inquiry_id])
    else
      @inquiry = Inquiry.new(session[:inquiry_params]) 
    end
    
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
    logger.info params
    session[:inquiry_params].deep_merge!(params[:inquiry]) if params[:inquiry]
    if session[:inquiry_id]
      @inquiry = Inquiry.find(session[:inquiry_id])
    else
      @inquiry = Inquiry.new(session[:inquiry_params]) 
    end
    @inquiry.update_attributes(session[:inquiry_params])
    @inquiry.ip = request.remote_ip
    @inquiry.current_step = session[:inquiry_step]  
    if @inquiry.valid?
      if params[:back_button]  
        @inquiry.previous_step
      elsif params[:finish]
        @inquiry.last_step 
      else
        @inquiry.next_step  
      end  
      session[:inquiry_step] = @inquiry.current_step  
    end
    
    session[:inquiry_id] = @inquiry.id if @inquiry.save

    render 'new'

    # Railscasts code
    # if @inquiry.new_record?  
    #   render 'new'  
    # else
    #   lsession[:inquiry_step] = session[:inquiry_params] = nil  
    #   flash[:notice] = "Inquiry saved."  
    #   redirect_to @inquiry  
    # end

    # Original scaffold code
    # @inquiry = Inquiry.new(params[:inquiry])

    # respond_to do |format|
    #   if @inquiry.save
    #     format.html { redirect_to(@inquiry, :notice => 'Inquiry was successfully created.') }
    #     format.xml  { render :xml => @inquiry, :status => :created, :location => @inquiry }
    #   else
    #     format.html { render :action => "new" }
    #     format.xml  { render :xml => @inquiry.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  # PUT /inquiries/1
  # PUT /inquiries/1.xml
  def update
    logger.info params
    all_done = false
    session[:inquiry_params].deep_merge!(params[:inquiry]) if params[:inquiry]
    @inquiry = Inquiry.find(params[:id])
    @inquiry.update_attributes(session[:inquiry_params])
    @inquiry.ip = request.remote_ip
    @inquiry.current_step = session[:inquiry_step]  
    if @inquiry.valid?
      if params[:back_button]  
        @inquiry.previous_step
      elsif params[:finish]
        @inquiry.last_step 
      else
        if @inquiry.last_step?
          all_done = true
        else
          @inquiry.next_step
        end
     end
      session[:inquiry_step] = @inquiry.current_step  
    end
    @inquiry.save!
    logger.info @inquiry.current_step
    logger.info @inquiry.last_step?
    logger.info @inquiry.inspect

    if all_done
      redirect_to congrats_path
    else
      render 'new'
    end
    # @inquiry = Inquiry.find(params[:id])

    # respond_to do |format|
    #   if @inquiry.update_attributes(params[:inquiry])
    #     format.html { redirect_to(@inquiry, :notice => 'Inquiry was successfully updated.') }
    #     format.xml  { head :ok }
    #   else
    #     format.html { render :action => "edit" }
    #     format.xml  { render :xml => @inquiry.errors, :status => :unprocessable_entity }
    #   end
    # end
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
