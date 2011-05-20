class OtherController < ApplicationController
 before_filter :check_login



 def home
     @surveys = Survey.all
  end

def takesurvey
  session[:tsurveyid] = params[:tsid]  
   respond_to do |format|
		format.html { redirect_to(:controller => "other",:action => "surveypage" ) }
	
        end
end

def viewsurvey
  session[:tsurveyid] = params[:tsid]  
   respond_to do |format|
		format.html { redirect_to(:controller => "other",:action => "results" ) }
	
        end
end

def logout
  session[:username]=nil
  redirect_to (:root) 
end
def surveypage
   @survey   = Survey.where(:id => session[:tsurveyid]).first
   @questions = Question.where(:survey_id => session[:tsurveyid]).all
end

def surveyresults
   @surveys = Survey.all
end

def results

   @survey   = Survey.where(:id => session[:tsurveyid]).first
   @questions = Question.where(:survey_id => session[:tsurveyid]).all
   @avgresponse=Array.new(@questions.length)
   i=0
    @questions.each do |question|
    	weighted=question.opt1count * 1.0 + question.opt2count * 2.0   + question.opt3count * 3.0 + question.opt4count * 4.0 + question.opt5count * 5.0
	@avgresponse[i]=weighted/question.totalresponse
	i=i+1
    end
end

def surveysubmit

   @questions = Question.where(:survey_id => session[:tsurveyid]).all
    @questions.each do |question|
              @answers=params[question.id.to_s]

	      if(@answers.to_i == 1)
	          currentcount=question.opt1count
		  currentresponse=question.totalresponse
		  currentcount = currentcount +1
		  currentresponse= currentresponse +1
	          question.update_attributes(:opt1count => currentcount,:totalresponse => currentresponse)
              end
	    
             if(@answers.to_i == 2)
	          currentcount=question.opt2count
		  currentresponse=question.totalresponse
		  currentcount = currentcount +1
		  currentresponse= currentresponse +1
	          question.update_attributes(:opt2count => currentcount,:totalresponse => currentresponse)
              end
	
             if(@answers.to_i == 3)
	          currentcount=question.opt3count
		  currentresponse=question.totalresponse
		  currentcount = currentcount +1
		  currentresponse= currentresponse +1
	          question.update_attributes(:opt3count => currentcount,:totalresponse => currentresponse)
              end
		
	      if(@answers.to_i == 4)
	          currentcount=question.opt4count
		  currentresponse=question.totalresponse
		  currentcount = currentcount +1
		  currentresponse= currentresponse +1
	          question.update_attributes(:opt4count => currentcount,:totalresponse => currentresponse)
              end
		
	if(@answers.to_i == 5)
	          currentcount=question.opt5count
		  currentresponse=question.totalresponse
		  currentcount = currentcount +1
		  currentresponse= currentresponse +1
	          question.update_attributes(:opt5count => currentcount,:totalresponse => currentresponse)
              end
		
              
      end
end

private 

  def check_login
    unless session[:username]
         redirect_to (:root)
     end
  end

end
