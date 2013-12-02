require 'test_helper'

class AppTest < ActiveSupport::TestCase

  test "should not save app without title" do
    app = App.new
    assert !app.save, "Saved the app without a title"
  end
  
  test "the app should not save without a valid/known title" do
    app = App.new
    app.title = "ABC XYZ"
    assert !app.valid?, "Should not save with bad title"
  end

  test "the app should get a default proceeds value" do
    app = App.new
    app.title = "Picture Pusher"
    app.default_proceeds_in_dollars = 0.7
    assert app.save, "Failed to save new app #{app.title}"
    assert app.default_proceeds_in_dollars == 0.7, "#{app.title} should have default proceeds of 0.70 but has #{app.default_proceeds_in_dollars}"
  end
  
  test "the fixture should be okay" do
    app = apps(:one)
    assert app.save, "Failed to save fixture one"
  end
  
  test "the app title should be unique" do
    app = App.new
    app.title = "Rehabulizer"
    app.default_proceeds_in_dollars = 0.7
    assert app.save, "Failed to save new app #{app.title}.  Title may be used in fixture or elsewhere?"
  
    app = App.new
    app.title = "Rehabulizer"
    app.default_proceeds_in_dollars = 0.7
    assert !app.save, "Should not be able to save a second copy of #{app.title}"
  end
end
