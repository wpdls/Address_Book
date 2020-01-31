class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.integer :phone_number, null: false
      t.text :comment
      t.belongs_to :person, foreign_key: true

      t.timestamps
    end
  end
end
