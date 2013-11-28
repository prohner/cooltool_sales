class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :units
      t.decimal :proceeds
      t.string :customer_currency
      t.references :country, index: true
      t.string :currency_of_proceeds
      t.decimal :customer_price

      t.timestamps
    end
  end
end
