class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :project_id
      t.string :status, default: 'New'

      t.timestamps
    end
  end
end
