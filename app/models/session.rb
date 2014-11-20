class Session < ActiveRecord::Base
  validates :access_code, presence: true

  belongs_to :presentation
end