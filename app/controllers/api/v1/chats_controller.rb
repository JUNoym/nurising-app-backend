class Api::V1::ChatsController < ApplicationController
    def index
        content = Chat.all
        render json: content
    end

    def create
        chat = Chat.create!(chat_params)
        render json: { status: 201, chat: chat }
    rescue => e
        render json: { status: 422 , message: e.message}
    end

    private
        def chat_params
            params.permit(
                :message, :name
            )
        end
end