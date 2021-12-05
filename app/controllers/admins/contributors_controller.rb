module Admins
  class ContributorsController < AdminsController
    before_action :set_contributor, only: %i[ edit update destroy ]

    # GET /contributors or /contributors.json
    def index
      @contributors = Contributor.all
    end

    # GET /contributors/new
    def new
      @contributor = Contributor.new
    end

    # GET /contributors/1/edit
    def edit
    end

    # POST /contributors or /contributors.json
    def create
      @contributor = Contributor.new(contributor_params)

      respond_to do |format|
        if @contributor.save
          format.html { redirect_to contributors_url, notice: "Contributor was successfully created." }
          format.json { render :index, status: :created, location: contributors_url }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @contributor.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /contributors/1 or /contributors/1.json
    def update
      respond_to do |format|
        if @contributor.update(contributor_params)
          format.html { redirect_to contributors_url, notice: "Contributor was successfully updated." }
          format.json { render :index, status: :ok, location: contributors_url }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @contributor.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /contributors/1 or /contributors/1.json
    def destroy
      @contributor.destroy
      respond_to do |format|
        format.html { redirect_to contributors_url, notice: "Contributor was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contributor
        @contributor = Contributor.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def contributor_params
        params.require(:contributor).permit(:puzzle_id, :is_finished, :finish_date)
      end
  end
end