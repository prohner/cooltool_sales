class AddProductTypeIdentiferToSales < ActiveRecord::Migration
  def change
    add_column :sales, :product_type_identifier, :string
  end
end
