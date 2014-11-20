class SurveyFeedback < ActiveRecord::Base         

  belongs_to :survey_option
  belongs_to :session

end