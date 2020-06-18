require 'rails_helper'
RSpec.describe Product, type: :model do
  subject { Product.new(title: "Apple", content: "One apple a day keeps a doctor away", price: "12" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    subject.title=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a content" do
    subject.content=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a price" do
    subject.price=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the price is not all digits" do
    subject.price =~ /\A\d+\Z/
  end
  it "returns the correct title" do
    expect(subject.title).to eq("Apple")
  end

end