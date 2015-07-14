class ApiController < ApplicationController

  def page_edits
    subdomain = params[:subdomain]

    Rails.logger.info params

    query_results = ChannelTop.select(:timestamp, :count)
      .where(channel: "#{subdomain}").order(:timestamp)
    results = query_results.map do |elem|
      [elem.timestamp.to_i * 1000, elem.count]
    end

    render  json: results.to_json, callback: params[:callback]
  end 

end
