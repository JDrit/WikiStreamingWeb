class StatsController < ApplicationController
  def index
   redirect_to "/subdomain/en.wikipedia"
  end

  def channel
    @subdomain = params[:subdomain]

    timestamp = PageTop.maximum(:timestamp)
    @active_pages = PageTop.select(:page, :count)
      .where(timestamp: timestamp, channel: "#{@subdomain}")
      .order(count: :desc)

    @active_users = Log.select("username, count(*) as c").where(timestamp: (timestamp - 1.hours)..timestamp).group(:username).order('c desc').limit(10)
    Rails.logger.info @active_users.length
  end 

end
