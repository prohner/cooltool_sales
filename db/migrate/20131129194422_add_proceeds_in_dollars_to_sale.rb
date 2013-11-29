class AddProceedsInDollarsToSale < ActiveRecord::Migration
  def change
    add_column :sales, :proceeds_in_dollars, :float
  end
end
