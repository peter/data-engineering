require 'spec_helper'

describe PurchaseFilesController do
  # This should return the minimal set of attributes required to create a valid
  # PurchaseFile. As you add validations to PurchaseFile, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      name: "example_input.tab",
      contents: IO.read(File.join(Rails.root, "example_input.tab"))
    }
  end

  def create_params
    {
      uploaded_file: fixture_file_upload("/example_input.tab" , "text/csv")
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PurchaseFilesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all purchase_files as @purchase_files" do
      purchase_file = PurchaseFile.create! valid_attributes
      get_page :index, {}, valid_session
      assigns(:purchase_files).should eq([purchase_file])
      assert_text_on_page(valid_attributes[:name])
    end
  end

  describe "GET show" do
    it "assigns the requested purchase_file as @purchase_file" do
      purchase_file = PurchaseFile.create! valid_attributes
      get :show, {:id => purchase_file.to_param}, valid_session
      assigns(:purchase_file).should eq(purchase_file)
    end
  end

  describe "GET new" do
    it "assigns a new purchase_file as @purchase_file" do
      get :new, {}, valid_session
      assigns(:purchase_file).should be_a_new(PurchaseFile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PurchaseFile" do
        expect {
          post :create, {:purchase_file => create_params}, valid_session
        }.to change(PurchaseFile, :count).by(1)
      end

      it "assigns a newly created purchase_file as @purchase_file" do
        post :create, {:purchase_file => create_params}, valid_session
        assigns(:purchase_file).should be_a(PurchaseFile)
        assigns(:purchase_file).should be_persisted
      end

      it "redirects to the created purchase_file" do
        post :create, {:purchase_file => create_params}, valid_session
        response.should redirect_to(PurchaseFile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved purchase_file as @purchase_file" do
        # Trigger the behavior that occurs when invalid params are submitted
        PurchaseFile.any_instance.stubs(:save).returns(false)
        post :create, {:purchase_file => {}}, valid_session
        assigns(:purchase_file).should be_a_new(PurchaseFile)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PurchaseFile.any_instance.stubs(:save).returns(false)
        post :create, {:purchase_file => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested purchase_file" do
      purchase_file = PurchaseFile.create! valid_attributes
      expect {
        delete :destroy, {:id => purchase_file.to_param}, valid_session
      }.to change(PurchaseFile, :count).by(-1)
    end

    it "redirects to the purchase_files list" do
      purchase_file = PurchaseFile.create! valid_attributes
      delete :destroy, {:id => purchase_file.to_param}, valid_session
      response.should redirect_to(purchase_files_url)
    end
  end
end
