class ApiController < ApplicationController

  def page_edits
    subdomain = params[:subdomain]

    query_results = ChannelTop.select(:timestamp, :count)
      .where(channel: subdomain).order(:timestamp)
    results = query_results.map do |elem|
      [elem.timestamp.to_i * 1000, elem.count]
    end

    render  json: results.to_json, callback: params[:callback]
  end 

  def page_edits_update
    subdomain = params[:subdomain]

    result = ChannelTop.select(:timestamp, :count)
      .where(channel: subdomain).order(timestamp: :desc).limit(1)[0]

    Rails.logger.info result
    render json: [result.timestamp.to_i * 1000, result.count].to_json, callback: params[:callback]
  end
end
