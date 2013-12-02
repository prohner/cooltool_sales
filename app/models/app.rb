class App < ActiveRecord::Base
  has_many :app_versions, dependent: :destroy
  before_save :assign_defaults #, :only => [ :create, :update ]
  validate :data_is_okay
  validates :title, presence: true
  
  @@default_proceeds = {
    "ACT Spell"                 => 2.1,
    "Face Flipper"              => 0.7,
    "Mortgage Mate"             => 0.7,
    "Picture Pusher"            => 0.7,
    "Rehabulizer"               => 2.1,
    "Sk8 Score!"                => 6.3,
    "Step-by-Step"              => 2.1,
    "StudyUp!"                  => 0.7,
    "Take Turn Timer"           => 0.7,
    "The Backpacker Checklist"  => 0.7,
    "Thought Cloud"             => 2.1,
    "What in the World"         => 0.7,
    "focus:MMA"                 => 0.7,
    "SenGen"                    => 0.0,
    "HighRidge Insurance"       => 0.0,
    "GoBingo"                   => 0.7,
    "WordAACcess"               => 10.5
  }
  
  def sales_total
    total_sales = 0
    app_versions.each do |app_version|
      app_version.sales.each do |sale|
        total_sales += sale.developer_proceeds * sale.units
      end
    end
    total_sales
  end
  
  def sales_total_within_date_range(from, to)
    total_sales = 0
    app_versions.each do |app_version|
      app_version.sales.each do |sale|
        if from <= sale.sales_date and sale.sales_date <= to
          total_sales += sale.developer_proceeds * sale.units
        end
      end
    end
    total_sales
  end

private 
  def data_is_okay
    errors[:title] = "Couldn't find '#{title}' in our acceptable titles list." if @@default_proceeds[title].nil?
  end
  
  def assign_defaults
    self.default_proceeds_in_dollars ||= @@default_proceeds[self.title]
  end
end
