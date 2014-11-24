class AddTrackPresentation < ActiveRecord::Migration
  def change
    create_table :track_presentation do |t|
      t.references  :presentation
      t.string      :access_code

      t.timestamps
    end
  end
end