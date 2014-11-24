class Presentation < ActiveRecord::Base

  validates :title, presence: true

  has_many :slides, dependent: :destroy
  has_many :track_presentations, dependent: :destroy
end