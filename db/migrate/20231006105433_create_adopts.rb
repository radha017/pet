class CreateAdopts < ActiveRecord::Migration[7.0]
  def change
    create_table :adopts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true
      t.date :date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
