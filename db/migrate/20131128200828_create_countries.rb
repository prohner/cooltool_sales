class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country
      t.string :digraph

      t.timestamps
    end
  end
end
