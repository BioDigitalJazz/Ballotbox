class SurveyOption < ActiveRecord::Base
  
  validates :option_label, presence: true
                            
  validates :text, presence: true                                                              

  belongs_to :slide
  has_many   :survey_feedbacks, dependent: :destroy
end