class CreateRaitings < ActiveRecord::Migration[5.2]
  def change
    create_table :raitings do |t|
      t.integer :score
      t.integer :beer_id

      t.timestamps
    end
  end
end
