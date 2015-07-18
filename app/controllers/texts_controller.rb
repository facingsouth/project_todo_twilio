class TextsController < ApplicationController

  def send_text
    flash[:success] = "Text sent!"
    redirect_to todos_path
  end
end
