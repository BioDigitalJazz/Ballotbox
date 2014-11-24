
class SurveyFeedback < ActiveRecord::Base

  belongs_to :survey_option
  belongs_to :track_presentation

end