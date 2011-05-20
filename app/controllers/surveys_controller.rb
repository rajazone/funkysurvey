class SurveysController < ApplicationController
 before_filter :check_login ,:except => [:login,:createsession]



  def login
   
  
  end
  
 def createsession
     @usercheck= User.where(:username => params[:username] ,:password => params[:password]).all
     if(@usercheck.blank?)
     	respond_to do |format|
                format.html { redirect_to(:root, :notice => 'Username/Password not found.Please retry or Signup as a User') }         
		
	end

     else
     
	session[:username] = params[:username]
	respond_to do |format|
		format.html { redirect_to(:controller => "other",:action => "home" ) }
		format.xml  { head :ok }
        end
     end  
  end

  # GET /surveys
  # GET /surveys.xml

  def index
   @surveys = Survey.where(:surveyowner => session[:username]).all
   # @surveys = Survey.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.xml
   def show
    @survey = Survey.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.xml
  def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.xml
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to(@survey, :notice => 'Survey was successfully created.') }
        format.xml  { render :xml => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.xml
  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to(@survey, :notice => 'Survey was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.xml
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
      format.xml  { head :ok }
    end
  end

  private 

  def check_login
    unless session[:username]
         redirect_to (:root)
     end
  end

end
