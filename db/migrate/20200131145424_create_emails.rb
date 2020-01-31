class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string :email, null: false
      t.text :comment
      t.belongs_to :person, foreign_key: true

      t.timestamps
    end
  end
end
