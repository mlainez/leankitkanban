module LeanKitKanban
  module Backlog
    include HTTParty
    include LeanKitRequest

    FETCH = "/Board/{boardID}/Backlog"

    def self.fetch(board_id)
      api_call = FETCH.gsub("{boardID}", board_id.to_s)
      get(api_call)
    end
  end
end