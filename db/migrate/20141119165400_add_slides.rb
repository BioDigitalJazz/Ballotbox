class AddSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.references  :presentation
      t.integer     :slide_number
      t.string      :type
      t.text        :content

      t.timestamps
    end
  end
end