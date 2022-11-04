class ShortUrlsController < ApplicationController

  # Since we're working on an API, we don't have authenticity tokens
  skip_before_action :verify_authenticity_token

  def index
    @short_urls = ShortUrl.all(:order => "click_count DESC")
  end

  def create
    @short_url = ShortUrl.new(short_url_params)
    if @short_url.save
      render :short_url, status :created 
    else
      render :short_url, status: :unprocessable_enty 
    end
  end

  def show
    @short_url = ShortUrl.find(params[:full_url])
  end

  private 
  def short_url_params
    params.require(:short_url).permit(:full_url, :title, :click_count)
  end

end
