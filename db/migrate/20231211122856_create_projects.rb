class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :adress
      t.datetime :date
      t.integer :size
      t.boolean :video
      t.boolean :drone
      t.boolean :photo

      t.timestamps
    end
  end
end
