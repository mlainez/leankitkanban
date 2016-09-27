module LeanKitKanban
  module Board
    include HTTParty
    include LeanKitRequest
    include LeanKitEndpoint

    def self.all
      get(GET_BOARDS)
    end

    def self.find(board_id)
      api_call = GET_BOARD.gsub("{boardID}", board_id.to_s)
      get(api_call)
    end

    def self.get_identifiers(board_id)
      api_call = GET_BOARD_IDENTIFIERS.gsub("{boardID}", board_id.to_s)
      get(api_call)
    end

    def self.get_newer_if_exists(board_id, version_id)
      api_call = GET_NEWER_BOARD_IF_EXISTS.gsub("{boardID}", board_id.to_s).gsub("{versionID}", version_id.to_s)
      get(api_call)
    end

    def self.get_board_updates(board_id, version_id)
      api_call = CHECK_FOR_BOARD_UPDATES.gsub("{boardID}", board_id.to_s).gsub("{versionID}", version_id.to_s)
      get(api_call)
    end

    def self.get_board_history_since(board_id, version_id)
      api_call = GET_BOARD_HISTORY_SINCE.gsub("{boardID}", board_id.to_s).gsub("{versionID}", version_id.to_s)
      get(api_call)
    end
  end
end
