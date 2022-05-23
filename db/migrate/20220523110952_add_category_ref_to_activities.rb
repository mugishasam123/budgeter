class AddCategoryRefToActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :category, null: false, foreign_key: true
  end
end
