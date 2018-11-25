class ClientSDK
  attr_accessor :client_key, :client_secret, :team_name

  def initialize(team_name, client_key, client_secret)
    raise ArgumentError, 'Team Name is not valid' unless !team_name.empty?
    raise ArgumentError, 'Client Key is not valid' unless !client_key.empty?
    raise ArgumentError, 'Client Secret is not valid' unless !client_secret.empty?

    @team_name = team_name
    @client_key = client_key
    @client_secret = client_secret
  end

  def to_s
    "{ team_name: #{@team_name}, client_key: #{@client_key}, client_secret: #{@client_secret} }"
  end
end