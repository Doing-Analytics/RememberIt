class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.references :team, null: false, foreign_key: true, index: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
