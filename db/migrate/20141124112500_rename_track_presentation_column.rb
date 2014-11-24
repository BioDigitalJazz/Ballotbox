class RenameTrackPresentationColumn < ActiveRecord::Migration
  def change
    rename_column :survey_feedbacks, :session_id, :track_presentation_id
  end
end