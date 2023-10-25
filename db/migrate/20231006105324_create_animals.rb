class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :name, default: "", null: false
      t.string :species, default: "", null: false
      t.string :breed, default: "", null: false
      t.integer :age, null: false, default: 0
      t.text :description, null: false, default: ""
      t.boolean :is_adopted, default: 0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
