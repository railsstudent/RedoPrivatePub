class MessagesController < ApplicationController
  def create
    @message = Message.create!(params[:message])
    PrivatePub.publish_to "/message/new", :message => @message
  end

  def index
    @messages = Message.all
  end

end
