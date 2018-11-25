require 'eventmachine'
require 'em-http'
require 'fiber'
require './client_sdk'

def async_post(url, payload)
  f = Fiber.current
  http = EventMachine::HttpRequest.new(url).post :body => payload
  http.callback { f.resume(http) }
  http.errback { f.resume(http) }

  return Fiber.yield
end

module ReactivehubSDK
  def build_client(team_name, client_key, client_secret)
    ClientSDK.new(team_name, client_key, client_secret)
  end

  def publish_event(client, event_name, payload)
    url = "https://#{client.team_name}.reactivehub.io/#{event_name}"

    EventMachine.run do
      Fiber.new{
        puts "Send HTTP request to POST: #{url}"
        data = async_post(url, payload)

        EventMachine.stop
      }.resume
    end
  end

  module_function :build_client, :send_event
end