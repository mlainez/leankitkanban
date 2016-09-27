module LeanKitKanban
  module Backlog
    include HTTParty
    include LeanKitRequest
    include LeanKitEndpoint

    def self.fetch(board_id)
      get(format_url(GET_BOARD_BACKLOG, "{boardID}" => board_id))
    end
  end
end
