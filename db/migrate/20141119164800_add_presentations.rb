class AddPresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string  :title
      t.text    :description

      t.timestamps
    end
  end
end