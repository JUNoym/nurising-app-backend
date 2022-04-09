class Api::V1::ChatsController < ApplicationController
    def index
        render json: {messges: [{id: 1, text: "Hello"}, {id: 2, text: "Hi"}]}
    end
end