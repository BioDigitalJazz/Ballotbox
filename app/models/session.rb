class Session < ActiveRecord::Base
  validates :access_code, presence: true

  belongs_to  :presentation
  has_many    :survey_feedbacks
end