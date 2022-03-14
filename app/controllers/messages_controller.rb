# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all_but_user(current_user)
    @messages = Message.includes(:user).all.order(created_at: :asc)
  end

  def create
    @message = Message.new(user: current_user, content: message_params[:message])
    if @message.save
      ActionCable.server.broadcast 'chat_channel',
                                   { message: {
                                     username: current_user.username,
                                     content: message_params[:message],
                                     user_id: current_user.id
                                   } }
    end
  end

  # dirty hack for devise turbo issue
  def log_out
    sign_out_and_redirect(current_user)
  end

  private

  def message_params
    params.permit(:message, :authenticity_token)
  end
end
