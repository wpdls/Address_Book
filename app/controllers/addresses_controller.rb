class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.order("updated_at DESC")
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    @person = Person.find(params[:person_id])
    @addresses = @person.addresses
  end

  # GET /addresses/new
  def new
    @person = Person.find(params[:person_id])
    @address = @person.addresses.build
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    # @address = Address.new(address_params)
    @person = Person.find(params[:person_id])
    @address = @person.addresses.build(address_params_new)

    respond_to do |format|
      if @address.save
        format.html { redirect_to person_path(@address.person_id), notice: 'Address was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to person_path(@address.person_id), notice: 'Address was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to person_path(@address.person_id), notice: 'Address was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:street, :city, :zip, :state, :country)
    end
    def address_params_new
      params.permit(:street, :city, :zip, :state, :country)
    end
end
