class AddSurveyFeedbacks < ActiveRecord::Migration
  def change
    create_table :survey_feedbacks do |t|
      t.references  :survey_option
      t.references  :session
      t.integer     :total_votes

      t.timestamps
    end
  end
end