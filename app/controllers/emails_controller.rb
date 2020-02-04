class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @person = Person.find(params[:person_id])
    @email = @person.emails.build(params[:email])
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @person = Person.find(params[:person_id])
    @email = @person.emails.build(email_params_new)
  
    respond_to do |format|
      if @email.save
        format.html { redirect_to person_path(@email.person_id), notice: 'Email was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.js
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to person_path(@email.person_id), notice: 'Email was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.js
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to person_path(@email.person_id), notice: 'Email was successfully deleted.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:email, :comment, :person_id)
    end

    def email_params_new
      params.permit(:email, :comment, :person_id)
    end
end
