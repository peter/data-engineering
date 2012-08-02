require 'spec_helper'

describe "purchase_files/new" do
  before(:each) do
    assign(:purchase_file, stub_model(PurchaseFile,
      :name => "MyString",
      :contents => "MyText",
      :processing_errors => "MyText"
    ).as_new_record)
  end

  it "renders new purchase_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchase_files_path, :method => "post" do
      assert_select "input#purchase_file_name", :name => "purchase_file[name]"
      assert_select "textarea#purchase_file_contents", :name => "purchase_file[contents]"
      assert_select "textarea#purchase_file_processing_errors", :name => "purchase_file[processing_errors]"
    end
  end
end
