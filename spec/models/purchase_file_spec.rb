require 'spec_helper'

describe PurchaseFile do
  describe "creating" do
    it "can be done with name and contents" do
      lambda {
        file = PurchaseFile.create!(required_attributes)
        file.reload.name.should == required_attributes[:name]
        file.contents.should == required_attributes[:contents]
        file.processing_errors.should be_nil
      }.should change(PurchaseFile, :count).by(1)
    end
  end

  describe "validations" do
    it "is not valid without required attributes" do
      file = PurchaseFile.new(required_attributes)
      file.should be_valid
      required_attributes.keys.each do |attribute|
        file = PurchaseFile.new(required_attributes.except(attribute))
        file.should_not be_valid
        file.errors[attribute].should be_present
      end
    end
  end

  describe "processing_errors" do
    it "is not attr_accessible" do
      lambda {
        PurchaseFile.new(required_attributes.merge(processing_errors: valid_processing_errors))
      }.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it "is serialized" do
      lambda {
        file = PurchaseFile.create!(required_attributes)
        file.processing_errors.should be_nil
        file.processing_errors = valid_processing_errors
        file.save!
        file.reload.processing_errors.should == valid_processing_errors
      }.should change(PurchaseFile, :count).by(1)
    end
  end

  def valid_processing_errors
    {
      1 => "Record Invalid, name cannot be null"
    }
  end

  def required_attributes
    {
      name: "example_input.tab",
      contents: "test contents"
    }
  end
end
