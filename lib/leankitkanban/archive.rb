module LeanKitKanban
  module Archive
    include HTTParty
    include LeanKitRequest
    include LeanKitEndpoint

    def self.fetch(board_id)
      api_call = GET_BOARD_ARCHIVE.gsub("{boardID}", board_id.to_s)
      get(api_call)
    end
  end
end
