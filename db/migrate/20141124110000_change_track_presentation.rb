class ChangeTrackPresentation < ActiveRecord::Migration
  def change
    rename_table :track_presentation, :track_presentations
  end
end