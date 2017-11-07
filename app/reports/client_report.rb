class ClientReport

  def initialize(saloon)
    @saloon = saloon
  end

  def top_ten
    get_client_name(@saloon.top_ten_clients).to_h
  end

  private

  def get_client_name(clients)
    clients.each {|client| client[1] = Client.find(client[1]).name; client.reverse!}
  end

end
