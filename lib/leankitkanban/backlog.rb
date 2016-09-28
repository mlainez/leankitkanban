module LeanKitKanban
  module Backlog
    include HTTParty
    include LeanKitRequest
    include LeanKitEndpoint

    def self.fetch(board_id)
      get(build_api_endpoint(GET_BOARD_BACKLOG, board_id: board_id))
    end
  end
end
