class FormsController < ApplicationController
  before_action :set_form, only: [:edit, :update,:destroy]
  before_action :authenticate_student!

  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
    if params[:ip].present?
    @forms = Form.find_by_ip_address(params[:ip]);
  else
    @forms = Form.all
  end
  end

  # GET /forms/1
  # GET /forms/1.jsonx
  def show

  end

  # GET /forms/new
  def new
    @form=Form.new
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms
  # POST /forms.json
  def create
        @form = Form.new(form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'AluminiForm was successfully created.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
       params.require(:form).permit(:current, :is_placed, :comname, :comaddr, :desig, :exp, :abroad, :univ, :course, :starcompany, :staraddr, :commun, :mobile, :curmail, :linked_id, :areaofinterset, :contribute)
    end
end