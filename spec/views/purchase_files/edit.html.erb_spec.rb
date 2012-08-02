require 'spec_helper'

describe "purchase_files/edit" do
  before(:each) do
    @purchase_file = assign(:purchase_file, stub_model(PurchaseFile,
      :name => "MyString",
      :contents => "MyText",
      :processing_errors => "MyText"
    ))
  end

  it "renders the edit purchase_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchase_files_path(@purchase_file), :method => "post" do
      assert_select "input#purchase_file_name", :name => "purchase_file[name]"
      assert_select "textarea#purchase_file_contents", :name => "purchase_file[contents]"
      assert_select "textarea#purchase_file_processing_errors", :name => "purchase_file[processing_errors]"
    end
  end
end
