class AddSurveyOptions < ActiveRecord::Migration
  def change
    create_table :survey_options do |t|
      t.references  :slide
      t.integer     :option_number
      t.text        :text

      t.timestamps
    end
  end
end