class ChangeTypeToSlideType < ActiveRecord::Migration
  def change
    remove_column :slides, :type, :string
    add_column :slides, :slide_type, :string
  end
end