class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
  end

  def public
    @store = Store.find(params[:id])
    @line_items = @store.line_items
    @staffs = @store.staffs
  end

  def private
    @store = Store.find(params[:id])
    @line_items = @store.line_items
    @staffs = @store.staffs
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name)
    end
end