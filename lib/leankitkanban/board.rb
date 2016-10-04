module LeanKitKanban
  module Board
    include HTTParty
    include LeanKitRequest
    include Endpoint

    def self.all
      get(GET_BOARDS)
    end

    def self.find(board_id)
      get(build_api_endpoint(GET_BOARD, board: board_id))
    end

    def self.get_identifiers(board_id)
      get(build_api_endpoint(GET_BOARD_IDENTIFIERS, board: board_id))
    end

    def self.get_newer_if_exists(board_id, version_id)
      get(build_api_endpoint(GET_NEWER_BOARD_IF_EXISTS,
                             board: board_id,
                             version: version_id))
    end

    def self.get_board_updates(board_id, version_id)
      get(build_api_endpoint(CHECK_FOR_BOARD_UPDATES,
                             board: board_id,
                             version: version_id))
    end

    def self.get_board_history_since(board_id, version_id)
      get(build_api_endpoint(GET_BOARD_HISTORY_SINCE,
                             board: board_id,
                             version: version_id))
    end
  end
end
