class OptionNumberToOptionLabel < ActiveRecord::Migration
  def change
    remove_column :survey_options, :option_number, :integer
    add_column :survey_options, :option_label, :string
  end
end