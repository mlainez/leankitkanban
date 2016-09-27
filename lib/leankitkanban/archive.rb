module LeanKitKanban
  module Archive
    include HTTParty
    include LeanKitRequest
    include LeanKitEndpoint

    def self.fetch(board_id)
      get(format_url(GET_BOARD_ARCHIVE, "{boardID}" => board_id))
    end
  end
end
