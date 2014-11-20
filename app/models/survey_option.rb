class SurveyOption < ActiveRecord::Base
  
  validates :option_number, presence: true, 
                            numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0 }
  validates :text, presence: true                                                              

  belongs_to :slide
  has_many   :survey_feedbacks
end