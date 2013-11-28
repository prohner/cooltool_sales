class AddUploadFileRefToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :upload_file, index: true
  end
end
