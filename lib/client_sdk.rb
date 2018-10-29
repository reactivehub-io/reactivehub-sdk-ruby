class ClientSDK
  attr_accessor :client_key, :client_secret, :namespace

  def initialize(client_key, client_secret, namespace)
    raise ArgumentError, 'Client Key is not valid' unless !client_key.empty?
    raise ArgumentError, 'Client Secret is not valid' unless !client_secret.empty?
    raise ArgumentError, 'Namespace is not valid' unless !namespace.empty?

    @client_key = client_key
    @client_secret = client_secret
    @namespace = namespace
  end

  def to_s
    "{ client_key: #{@client_key}, client_secret: #{@client_secret}, namespace: #{@namespace} }"
  end
end