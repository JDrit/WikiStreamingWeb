class StatsController < ApplicationController
  def index
   redirect_to "/subdomain/en.wikipedia"
  end

  def channel
    @subdomain = params[:subdomain]
    timestamp = PageTop.maximum(:timestamp)
    @active_pages = PageTop.select(:page, :count)
      .where(timestamp: timestamp, channel: "##{@subdomain}")
      .order(:timestamp)
    Rails.logger.info @active_pages
  end 

end
