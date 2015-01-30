class CalendariosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_calendario, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @calendarios = Calendario.all
    respond_with(@calendarios)
  end

  def show
    respond_with(@calendario)
  end

  def new
    @calendario = Calendario.new
    respond_with(@calendario)
  end

  def edit
  end

  def create
    @calendario = Calendario.new(calendario_params)
    @calendario.save
    respond_with(@calendario)
  end

  def update
    @calendario.update(calendario_params)
    respond_with(@calendario)
  end

  def destroy
    @calendario.destroy
    respond_with(@calendario)
  end

  private
    def set_calendario
      @calendario = Calendario.find(params[:id])
    end

    def calendario_params
      params.require(:calendario).permit(:processo_seletivo_id, {:evento_calendario_ids => []})
    end
end