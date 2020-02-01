class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.text :street, null: false
      t.text :city, null: false
      t.text :zip, null: false
      t.text :state
      t.text :country, null: false
      t.belongs_to :person, foreign_key: true, index: true

      t.timestamps
    end
  end
end
