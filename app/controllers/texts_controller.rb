class TextsController < ApplicationController

  def send_text
    text = params[:todo]
    client = Twilio::REST::Client.new(ENV["TWILIO_ID"], ENV["TWILIO_TOKEN"])
    client.messages.create(
      from: '+16502730668',
      to: '+16504902147',
      body: text
    )
    flash[:success] = "Text sent!"
    redirect_to todos_path
  end
end
