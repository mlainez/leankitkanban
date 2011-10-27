module LeanKitKanban
  module Board
    include HTTParty

    ALL_BOARDS = "/Boards"
    ONE_BOARD  = "/Boards{board_id}"

    def self.all
      base_uri        = LeanKitKanban::Config.uri
      basic_auth_hash = LeanKitKanban::Config.basic_auth_hash
      url             = "#{base_uri}#{ALL_BOARDS}"
      response        = get(url, basic_auth_hash)
      response.body
    end
  end
end