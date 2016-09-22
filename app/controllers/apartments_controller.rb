class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource
  # GET /apartments
  # GET /apartments.json
  def index
    @apartments = Apartment.all

    @pindrop = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
      marker.infowindow apartment.full_address
    end

  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
    @apartments = Apartment.find(params[:id]) #@apartments may also be found using the set_apartment method provided by scaffolding

   @pindrop = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
     marker.lat apartment.latitude
     marker.lng apartment.longitude
     marker.infowindow apartment.full_address
   end

  end

  # GET /apartments/new
  def new
    @apartment = current_user.apartments.build

    @owners_for_select = Owner.all.map do |owner|
      [owner.name, owner.id]
    end
  end

  # GET /apartments/1/edit
  def edit
    if @apartment.user == current_user
      @owners_for_select = Owner.all.map do |owner|
      [owner.name, owner.id]
      end
    else
      redirect_to '/'
    end
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = current_user.apartments.build(apartment_params)

    @owners_for_select = Owner.all.map do |owner|
      [owner.name, owner.id]
    end

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    @owners_for_select = Owner.all.map do |owner|
      [owner.name, owner.id]
    end
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    if @apartment.user == current_user
      @apartment.destroy
      respond_to do |format|
        format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to '/'
    end
  end

  # add in the map location method to call on it in the js file : render the json object
  def map_location
    @apartments = Apartment.find(params[:apartment_id])
    @hash = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
      marker.infowindow apartment.full_address
    end
    render json: @hash.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:address_1, :address_2, :city, :postal_code, :state, :country, :owner_id, :lattitude, :longitude, :image)
    end
end
