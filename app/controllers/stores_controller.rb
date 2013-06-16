class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :index_filter, only: [:index]
  before_action :public_filter, only: [:public]
  before_action :private_filter, only: [:private]

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

    def index_filter
      unless public_credential || private_credential
        redirect_to root_path
      end
    end

    def public_filter
      unless staff_member && (public_credential || private_credential)
        redirect_to stores_path
      end
    end

    def private_filter
      unless staff_member && private_credential
        redirect_to stores_path
      end
    end

    def staff_member
      @store = Store.find(params[:id])
      current_staff && current_staff.stores.include?(@store)
    end

    def public_credential
      current_staff && current_staff.invitations.first.credential == "public"
    end

    def private_credential
      current_staff && (current_staff.invitations.first.credential == "private" ||
                        current_staff.invitations.first.credential == "admin")
    end

end
