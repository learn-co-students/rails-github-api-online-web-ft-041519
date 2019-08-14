class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  BASE_URL = "https://github.com/login/oauth/authorize"

  def create
    resp = Faraday.get(BASE_URL) do |req|
      req.params["client_id"] = ENV["GITHUB_CLIENT"]
    end

    body = JSON.parse(resp.body)
    binding.pry
  end
end
