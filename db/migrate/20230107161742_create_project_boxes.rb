class CreateProjectBoxes < ActiveRecord::Migration[7.0]
  def change
    create_table :project_boxes do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :create_system
      t.string :updated_system
      t.string :updated_user

      t.timestamps
    end
  end
end
