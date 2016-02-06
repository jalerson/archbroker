class FeedbacksController < ApplicationController
  def new
  end

  def create
    FeedbackMailer.send_feedback(params[:name], params[:email], params[:message]).deliver
    redirect_to root_path, :notice => "Thanks for send your feedback! We will contact you soon."
  end
end
