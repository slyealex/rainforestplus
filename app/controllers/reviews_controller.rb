class ReviewsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy]

  def show
  end
end
