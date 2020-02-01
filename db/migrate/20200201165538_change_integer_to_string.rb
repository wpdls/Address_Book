class ChangeIntegerToString < ActiveRecord::Migration[6.0]
  def change
    change_column :phones, :phone_number, :bigint
    change_column :people, :social_security_number, :bigint
  end
end
