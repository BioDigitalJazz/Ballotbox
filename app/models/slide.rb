class Slide < ActiveRecord::Base

  validates :slide_number, numericality: { only_integer: true,
                                           greater_than: 0 }
  validates :content, presence: true
  validates :type, inclusion: { in: ['regular', 'survey'] }

  before_validation do
    self.type ||= 'regular'
  end

  belongs_to :presentation
  has_many :surveyoptions
end