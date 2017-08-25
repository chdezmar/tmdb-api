class CreateCasts < ActiveRecord::Migration[5.1]
  def change
    create_table :casts do |t|
      t.references :movie, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
