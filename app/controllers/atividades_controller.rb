class AtividadesController < ApplicationController
  before_action :set_atividade, only: %i[ show edit update destroy ]

  # GET /atividades or /atividades.json
  def index
    if params[:search_date].present?
      @atividades = Atividade.where("data = ?", params[:search_date])
    else
      @atividades = Atividade.all
    end
  end

  # GET /atividades/1 or /atividades/1.json
  def show
  end

  # GET /atividades/new
  def new
    @atividade = Atividade.new
  end

  # GET /atividades/1/edit
  def edit
  end

  # POST /atividades or /atividades.json
  def create
    @atividade = Atividade.new(atividade_params)

    set_atividade_status

    respond_to do |format|
      if @atividade.save
        format.html { redirect_to atividade_url(@atividade), notice: "Atividade was successfully created." }
        format.json { render :show, status: :created, location: @atividade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atividades/1 or /atividades/1.json
  def update
    # set_atividade_status

    respond_to do |format|
      set_atividade_status

      if @atividade.update(atividade_params)
        format.html { redirect_to atividade_url(@atividade), notice: "Atividade was successfully updated." }
        format.json { render :show, status: :ok, location: @atividade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1 or /atividades/1.json
  def destroy
    @atividade.destroy!

    respond_to do |format|
      format.html { redirect_to atividades_url, notice: "Atividade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade
      @atividade = Atividade.find(params[:id])
    end

    def set_atividade_status
      if atividade_params[:hora_inicio].present?
        if atividade_params[:hora_final].present?
          @atividade.status = "finalizada"
        else
          @atividade.status = "Iniciada"
        end
      else
        @atividade.status = "não iniciada"
      end
    end

    # Only allow a list of trusted parameters through.
    def atividade_params
      params.require(:atividade).permit(:nome, :data, :hora_inicio, :hora_final)
    end
end
