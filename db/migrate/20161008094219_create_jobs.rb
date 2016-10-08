class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :url, null: false
      t.string :email, null: false
      t.datetime :time, null: false
      t.boolean :sent, default: false
      t.timestamps
    end
  end
end
