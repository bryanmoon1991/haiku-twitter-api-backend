class Api::V1::SearchesController < ApplicationController

    def index
        search = User.all
        render json: search
    end

end