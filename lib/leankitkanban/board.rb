module LeanKitKanban
  module Board
    include HTTParty

    ALL_BOARDS  = "/Boards"
    ONE_BOARD   = "/Boards/{boardID}"
    IDENTIFIERS = "/Board/{boardID}/GetBoardIdentifiers"

    def self.all
      url      = "#{LeanKitKanban::Config.uri}#{ALL_BOARDS}"
      response = get(url, LeanKitKanban::Config.basic_auth_hash)
      parse_body(response.body)
    end

    def self.find(board_id)
      api_call = ONE_BOARD.gsub("{boardID}", board_id.to_s)
      url      = "#{LeanKitKanban::Config.uri}#{api_call}"
      response = get(url, LeanKitKanban::Config.basic_auth_hash)
      parse_body(response.body)
    end

    def self.get_identifiers(board_id)
      api_call = IDENTIFIERS.gsub("{boardID}", board_id.to_s)
      url      = "#{LeanKitKanban::Config.uri}#{api_call}"
      response = get(url, LeanKitKanban::Config.basic_auth_hash)
      parse_body(response.body)
    end

    private
    def self.parse_body(body)
      json_data       = JSON.parse body
      json_data["ReplyData"]
    end
  end
end