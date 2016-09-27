module LeanKitKanban
  module Board
    include HTTParty
    include LeanKitRequest
    include LeanKitEndpoint

    def self.all
      get(GET_BOARDS)
    end

    def self.find(board_id)
      get(format_url(GET_BOARD, "{boardID}" => board_id))
    end

    def self.get_identifiers(board_id)
      get(format_url(GET_BOARD_IDENTIFIERS, "{boardID}" => board_id))
    end

    def self.get_newer_if_exists(board_id, version_id)
      get(format_url(GET_NEWER_BOARD_IF_EXISTS,
                     "{boardID}" => board_id,
                     "{versionID}" => version_id))
    end

    def self.get_board_updates(board_id, version_id)
      get(format_url(CHECK_FOR_BOARD_UPDATES,
                     "{boardID}" => board_id,
                     "{versionID}" => version_id))
    end

    def self.get_board_history_since(board_id, version_id)
      get(format_url(GET_BOARD_HISTORY_SINCE,
                     "{boardID}" => board_id,
                     "{versionID}" => version_id))
    end
  end
end
