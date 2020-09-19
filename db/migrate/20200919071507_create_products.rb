class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :year
      t.string :color
      t.string :pantone_value
      t.timestamps
    end
  end
end
