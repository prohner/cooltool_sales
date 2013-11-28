class AddSaleDateToSales < ActiveRecord::Migration
  def change
    add_column :sales, :sales_date, :date
  end
end
