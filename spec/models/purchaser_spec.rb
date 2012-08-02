require 'spec_helper'

describe Purchaser do
  describe "creating" do
    it "can be done with a name" do
      lambda {
        purchaser = Purchaser.create!(name: "Joe")
        purchaser.reload.name.should == "Joe"
      }.should change(Purchaser, :count).by(1)
    end
  end
end
