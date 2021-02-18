class Api::V1::PhonesController < Api::V1::ApiController
  before_action :set_phone, only: [:show, :update, :destroy]

  # GET /api/v1/phones
  def index
    @phones = Phone.all
    render json: @phones
  end

  # GET /api/v1/phones/1
  def show
    render json: @phone
  end

  # POST /api/v1/phones
  def create

    # Pegando o contact_id correto, independente da rota
    contact_id = params[:phone][:contact_id].present? ? params[:phone][:contact_id] : params[:contact_id]

    @phone = Phone.new(
        contact_id: contact_id,
        phone_number: params[:phone][:phone_number]
    )
    if @phone.save
      render json: @phone, status: :created
    else
      render json: @phone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/phones/1
  def update
    if @phone.update(phone_params)
      render json: @phone
    else
      render json: @phone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/phones/1
  def destroy
    @phone.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_phone
    @phone = Phone.find(params[:id])
  end

  def phone_params
    params.require(:phone).permit(:phone_number)
  end

end
