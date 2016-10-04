module LeanKitKanban
  module Archive
    include HTTParty
    include LeanKitRequest
    include Endpoint

    def self.fetch(board_id)
      get(build_api_endpoint(GET_BOARD_ARCHIVE, board: board_id))
    end
  end
end
