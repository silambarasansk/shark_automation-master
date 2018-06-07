# frozen_string_literal: true
require 'net/http'

class WebService
  include Singleton

  SHARK_API_TOKEN = "7538be7e185e439294a5cb935586a26c"

  def post(endpoint, json_body)
    uri = URI(endpoint)
    token = "Token token=#{SHARK_API_TOKEN}"
    req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json', 'Authorization' => token})
    req.body = json_body

    Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
  end
end
