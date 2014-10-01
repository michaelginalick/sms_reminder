class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer  :user_id
      t.string   :title
      t.string   :content
      t.datetime :due_date

      t.timestamps
    end
  end
end
