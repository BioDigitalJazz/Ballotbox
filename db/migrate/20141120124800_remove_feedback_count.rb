class RemoveFeedbackCount < ActiveRecord::Migration
  def change
    remove_column :survey_feedbacks, :total_votes, :integer
  end
end