class Slide < ActiveRecord::Base

  validates :slide_number, presence: true, 
                           numericality: { only_integer: true,
                                           greater_than: 0 }
  validates :content, presence: true
  validates :slide_type, presence: true,
                         inclusion: { in: ['regular', 'survey'] }

  before_validation do
    self.slide_type ||= 'regular'
    self.slide_type.downcase!
  end

  belongs_to  :presentation
  has_many    :survey_options

  def register_vote(survey_option)
    SurveyFeedback.create(survey_option: survey_option, session: session[:session_id])
  end


end