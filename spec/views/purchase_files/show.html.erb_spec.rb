require 'spec_helper'

describe "purchase_files/show" do
  before(:each) do
    @purchase_file = assign(:purchase_file, stub_model(PurchaseFile,
      :name => "Name",
      :contents => "MyText",
      :processing_errors => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
