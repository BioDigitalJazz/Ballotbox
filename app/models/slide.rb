class Slide < ActiveRecord::Base

  validates :slide_number, numericality: { only_integer: true,
                                           greater_than: 0 }
  validates :content, presence: true
  validates :slide_type, inclusion: { in: ['regular', 'survey'] }

  before_validation do
    self.slide_type ||= 'regular'
    self.slide_type.downcase!
  end

  belongs_to  :presentation
  has_many    :survey_options
end