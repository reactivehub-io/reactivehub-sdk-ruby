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
  def build_client(client_key, client_secret, namespace)
    ClientSDK.new(client_key, client_secret, namespace)
  end

  def send_event(client, event_name, payload)
    url = "https://#{client.namespace}.reactivehub.io/#{event_name}"

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