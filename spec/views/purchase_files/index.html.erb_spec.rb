require 'spec_helper'

describe "purchase_files/index" do
  before(:each) do
    assign(:purchase_files, [
      stub_model(PurchaseFile,
        :name => "Name",
        :contents => "MyText",
        :processing_errors => "MyText"
      ),
      stub_model(PurchaseFile,
        :name => "Name",
        :contents => "MyText",
        :processing_errors => "MyText"
      )
    ])
  end

  it "renders a list of purchase_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
