class AddTestDataToCase < ActiveRecord::Migration[5.1]
  def change
    add_column :cases, :test_data, :text
  end
end
