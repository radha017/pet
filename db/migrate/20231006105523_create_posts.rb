class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :caption, null: false, default: ""
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.timestamps
    end
  end
end
