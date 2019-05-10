class RequestsController < ApplicationController
  before_action :set_request, only: [:show]

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  def view
    if current_user.studentid != params[:id]
      redirect_to root_path
    end
    @requests = Request.where(reqsi: params[:id])
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:name,:reqsi,:user_id)
    end
end
