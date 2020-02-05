class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]

  # GET /phones
  # GET /phones.json
  def index
    @phones = Phone.order("updated_at DESC")
  end

  # GET /phones/1
  # GET /phones/1.json
  def show
    @person = Person.find(params[:person_id])
    @phones = @person.phones
  end

  # GET /phones/new
  def new
    @person = Person.find(params[:person_id])
    @phone = @person.phones.build
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones
  # POST /phones.json
  def create
    # @phone = Phone.new(phone_params)
    @person = Person.find(params[:person_id])
    @phone = @person.phones.build(phone_params_new)
  
    respond_to do |format|
      if @phone.save
        format.html { redirect_to person_path(@phone.person_id), notice: 'Phone was successfully created.' }
        format.js 
        format.json { render :show, status: :created, location: @phone }
      else
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1
  # PATCH/PUT /phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to person_path(@phone.person_id), notice: 'Phone was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @phone }
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.json
  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to person_path(@phone.person_id), notice: 'Phone was successfully deleted.' }
      format.js 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_params
      params.require(:phone).permit(:phone_number, :comment, :person_id)
    end

    def phone_params_new
      params.permit(:phone_number, :comment, :person_id)
    end
  end
