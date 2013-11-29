class AddSalesDateToUploadFile < ActiveRecord::Migration
  def change
    add_column :upload_files, :sales_date, :date
  end
end
