class Api::V1::HaikusController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :destroy] 
      
    def index
        haikus = Haiku.all 
        render json: haikus
    end

    def create
       haiku = Haiku.create(haiku_params) 
       if haiku.valid?
            render json: haiku, status: :created
       else
            render json: { error: haiku.errors.full_messages }, status: :not_acceptable 
       end
    end

    def destroy
        haiku = Haiku.find(params[:id])
        haiku.destroy
        render json: haiku
    end

    private

    def haiku_params
        params.permit(:user_id, :first, :second, :third)
    end

end
