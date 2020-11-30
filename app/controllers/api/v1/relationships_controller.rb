class Api::V1::RelationshipsController < ApplicationController
    skip_before_action :authorized, only: [:create, :destroy] 
 

    def create
       relationship = Relationship.create(relationship_params) 
       if relationship.valid?
            render json: relationship, status: :created
       else
            render json: { error: relationship.errors.full_messages }, status: :not_acceptable 
       end
    end

    def destroy
        relationship = Relationship.find(params[:id])
        relationship.destroy
        render json: relationship
    end

    private

    def relationship_params
        params.permit(:follower_id, :followee_id)
    end

end
