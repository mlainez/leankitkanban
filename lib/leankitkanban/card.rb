module LeanKitKanban
  module Card
    include HTTParty
    include LeanKitRequest

    FIND_CARD = "/Board/{boardID}/GetCard/{cardID}"

    def self.find(board_id, card_id)
      api_call = FIND_CARD.gsub("{boardID}", board_id.to_s).gsub("{cardID}", card_id.to_s)
      get(api_call)
    end
  end
end