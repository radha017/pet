class AddMessageToAdopt < ActiveRecord::Migration[7.0]
  def change
    add_column :adopts, :message, :text
  end
end
