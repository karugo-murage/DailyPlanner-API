class CreateDonations < ActiveRecord::Migration[7.2]
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.string :payment_method
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
