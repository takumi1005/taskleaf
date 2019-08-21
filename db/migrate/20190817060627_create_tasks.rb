class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.timestamps
      t.index :tasks, :name, unique: true
    end
  end
end
