module LeanKitKanban
  module Backlog
    include HTTParty
    include LeanKitRequest
    include LeanKitEndpoint

    def self.fetch(board_id)
      api_call = GET_BOARD_BACKLOG.gsub("{boardID}", board_id.to_s)
      get(api_call)
    end
  end
end
