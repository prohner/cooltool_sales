require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  setup do
    @unpaid_upgrade = sales(:upgrade_only)
    @act_spell_sale_1 = sales(:paid_sale_1)
    @act_spell_sale_1f = sales(:paid_sale_1f)
  end

  test "the only certain kinds of sales should be considered to be paid transactions" do
    assert !@unpaid_upgrade.is_paid_transaction
    assert @act_spell_sale_1.is_paid_transaction
    assert @act_spell_sale_1f.is_paid_transaction
  end
  
  test "proceeds_in_dollars should get assigned automatically" do
    app = apps(:one)
    app_version = app.app_versions[0]
    
    sale = Sale.new()
    sale.app_version = app_version
    sale.proceeds = 0.7
    sale.product_type_identifier = "1"
    sale.currency_of_proceeds = "USD"
    sale.save
    
    assert !sale.proceeds_in_dollars.nil?
    assert sale.proceeds == sale.proceeds_in_dollars
    
  end
end
