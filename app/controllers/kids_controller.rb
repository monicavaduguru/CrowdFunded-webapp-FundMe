class KidsController < ApplicationController
  before_action :set_kid, only: [:show, :edit, :update, :destroy]

  # GET /kids
  # GET /kids.json
  def index
    @kids = Kid.all
  end

  # GET /kids/1
  # GET /kids/1.json
  def show
  end

  # GET /kids/new
  def new
    @kid = Kid.new
  end

  # GET /kids/1/edit
  def edit
    
  end

  # POST /kids
  # POST /kids.json
  def create
    @kid = Kid.new(kid_params)
    @kid.money_needed=@kid.money_required-@kid.money_received

    respond_to do |format|
      if @kid.save
        format.html { redirect_to @kid, notice: 'Kid was successfully created.' }
        format.json { render action: 'show', status: :created, location: @kid }
      else
        format.html { render action: 'new' }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kids/1
  # PATCH/PUT /kids/1.json
  def update
    respond_to do |format|
      puts ((kid_params[:money_required].to_i-kid_params[:money_received].to_i).to_s)
       
        h={:money_needed =>(kid_params[:money_required].to_i-kid_params[:money_received].to_i).to_s}
        h.merge!(kid_params)
        puts h
        kid_params=h
                puts "here"

        puts kid_params
      if @kid.update(kid_params)
        
        #kid_params.merge!(h)
        #puts "here"
        #puts kid_params
        format.html { redirect_to @kid, notice: 'Kid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kids/1
  # DELETE /kids/1.json
  def destroy
    @kid.destroy
    respond_to do |format|
      format.html { redirect_to kids_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kid
      @kid = Kid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kid_params
      params.require(:kid).permit(:name, :age, :purpose, :money_required, :comments, :image_url, :address, :money_received)
    end
end
