require 'rails_helper'
RSpec.describe Category, type: :model do
  subject { Category.new(category: "Fruit" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a category" do
    subject.category=nil
    expect(subject).to_not be_valid
  end
  it "returns the correct category" do
    expect(subject.category).to eq("Fruit")
  end

end