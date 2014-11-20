class Presentation < ActiveRecord::Base

  validates :title, presence: true

  has_many :slides, dependent: :destroy
  has_many :sessions, dependent: :destroy
end