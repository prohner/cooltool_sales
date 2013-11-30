require 'test_helper'

class AppTest < ActiveSupport::TestCase
  test "should not save app without title" do
    app = App.new
    assert !app.save, "Saved the app without a title"
  end
  
  test "the app should not save without a valid/known title" do
    app = App.new
    app.title = "ABC XYZ"
    assert !app.save, "Should not save with bad title"
  end

  test "the app should get a default value" do
    app = App.new
    app.title = "The Backpacker Checklist"
    assert app.save
    
    assert app.default_proceeds_in_dollars == 0.7, "backpacker should have default proceeds of 0.70"
  end
end
