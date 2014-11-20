class AddSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references  :presentation
      t.string      :access_code

      t.timestamps
    end
  end
end