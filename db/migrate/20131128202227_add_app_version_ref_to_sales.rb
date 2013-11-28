class AddAppVersionRefToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :app_version, index: true
  end
end
