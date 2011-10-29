module LeanKitKanban
  module Archive
    include HTTParty
    include LeanKitRequest

    FETCH = "/Board/{boardID}/Archive"

    def self.fetch(board_id)
      api_call = FETCH.gsub("{boardID}", board_id.to_s)
      get(api_call)
    end
  end
end