class SurveyFeedback < ActiveRecord::Base

  validates :total_votes, presence: true,
                        

  before_validation do
    self.total_votes ||= 0
  end             

  belongs_to :survey_option
  belongs_to :session
end