class AddUserRefToActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :author, null: false, foreign_key: {to_table: :users}
  end
end
