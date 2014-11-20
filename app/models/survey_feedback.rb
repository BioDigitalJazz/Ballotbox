class SurveyFeedback < ActiveRecord::Base

  validates :total_votes, presence: true,
                          numericality: { only_integer: true,
                                          greater_than_or_equal_to: 0 }

  before_validation do
    self.total_votes ||= 0
  end             

  belongs_to :survey_option
  belongs_to :session
end