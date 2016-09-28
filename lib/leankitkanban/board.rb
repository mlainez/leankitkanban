module LeanKitKanban
  module Board
    include HTTParty
    include LeanKitRequest
    include LeanKitEndpoint

    def self.all
      get(GET_BOARDS)
    end

    def self.find(board_id)
      get(build_api_endpoint(GET_BOARD, board_id: board_id))
    end

    def self.get_identifiers(board_id)
      get(build_api_endpoint(GET_BOARD_IDENTIFIERS, board_id: board_id))
    end

    def self.get_newer_if_exists(board_id, version_id)
      get(build_api_endpoint(GET_NEWER_BOARD_IF_EXISTS,
                             board_id: board_id,
                             version_id: version_id))
    end

    def self.get_board_updates(board_id, version_id)
      get(build_api_endpoint(CHECK_FOR_BOARD_UPDATES,
                             board_id: board_id,
                             version_id: version_id))
    end

    def self.get_board_history_since(board_id, version_id)
      get(build_api_endpoint(GET_BOARD_HISTORY_SINCE,
                             board_id: board_id,
                             version_id: version_id))
    end
  end
end
