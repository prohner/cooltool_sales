class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :title
      t.string :sku
      t.string :apple_identifier
      t.string :category

      t.timestamps
    end
  end
end
