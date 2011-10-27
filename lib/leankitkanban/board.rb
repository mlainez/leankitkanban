module LeanKitKanban
  module Board
    include HTTParty

    ALL_BOARDS = "/Boards"

    def self.all
      base_uri        = LeanKitKanban::Config.uri
      basic_auth_hash = LeanKitKanban::Config.basic_auth_hash
      url             = "#{base_uri}#{ALL_BOARDS}"
      response        = get(url, basic_auth_hash)
      body            = response.body
      json_data       = JSON.parse body
      json_data["ReplyData"]
    end
  end
end