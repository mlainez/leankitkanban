module LeanKitKanban
  module Card
    include HTTParty
    include LeanKitRequest

    FIND_CARD     = "/Board/{boardID}/GetCard/{cardID}"
    FIND_CARD_EXT = "/Board/{boardID}/GetCardByExternalId/{externalID}"

    def self.find(board_id, card_id)
      api_call = FIND_CARD.gsub("{boardID}", board_id.to_s).gsub("{cardID}", card_id.to_s)
      get(api_call)
    end

    def self.find_by_external_id(board_id, external_id)
      api_call = FIND_CARD_EXT.gsub("{boardID}", board_id.to_s).gsub("{externalID}", external_id.to_s)
      get(api_call)
    end
  end
end