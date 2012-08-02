class PurchaseFilesController < ApplicationController
  # GET /purchase_files
  # GET /purchase_files.json
  def index
    @purchase_files = PurchaseFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchase_files }
    end
  end

  # GET /purchase_files/1
  # GET /purchase_files/1.json
  def show
    @purchase_file = PurchaseFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @purchase_file }
    end
  end

  # GET /purchase_files/new
  # GET /purchase_files/new.json
  def new
    @purchase_file = PurchaseFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase_file }
    end
  end

  # POST /purchase_files
  # POST /purchase_files.json
  def create
    @purchase_file = PurchaseFile.new(purchase_file_params)

    respond_to do |format|
      if @purchase_file.save
        format.html { redirect_to @purchase_file, notice: 'Purchase file was successfully created.' }
        format.json { render json: @purchase_file, status: :created, location: @purchase_file }
      else
        format.html { render action: "new" }
        format.json { render json: @purchase_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_files/1
  # DELETE /purchase_files/1.json
  def destroy
    @purchase_file = PurchaseFile.find(params[:id])
    @purchase_file.destroy

    respond_to do |format|
      format.html { redirect_to purchase_files_url }
      format.json { head :no_content }
    end
  end

  private

  def purchase_file_params
    if uploaded_file = params[:purchase_file] && params[:purchase_file][:uploaded_file]
      {
        name: uploaded_file.original_filename,
        contents: uploaded_file.read
      }
    else
      {}
    end
  end
end
