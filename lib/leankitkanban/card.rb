module LeanKitKanban
  module Card
    include HTTParty
    include LeanKitRequest
    include LeanKitEndpoint

    def self.delete(board_id, card_id)
      api_call = DELETE_CARD.gsub("{boardID}", board_id.to_s).gsub("{cardID}", card_id.to_s)
      post(api_call, {})
    end

    def self.delete_multiple(board_id, card_ids)
      api_call = DELETE_CARDS.gsub("{boardID}", board_id.to_s)
      post(api_call, card_ids)
    end

    def self.move(board_id, card_id,lane_id,position=0)
      api_call = MOVE_CARD.gsub("{boardID}", board_id.to_s).gsub("{cardID}", card_id.to_s).gsub("{laneID}", lane_id.to_s).gsub("{position}", position.to_s)
      post(api_call,{})
    end

    def self.find(board_id, card_id)
      api_call = FIND_CARD.gsub("{boardID}", board_id.to_s).gsub("{cardID}", card_id.to_s)
      get(api_call)
    end

    def self.find_by_external_id(board_id, external_id)
      api_call = FIND_CARD_EXT_ID.gsub("{boardID}", board_id.to_s).gsub("{externalID}", external_id.to_s)
      get(api_call)
    end

    def self.add(board_id, lane_id, position, body)
      api_call = ADD_CARD.gsub("{boardID}", board_id.to_s).gsub("{laneID}", lane_id.to_s).gsub("{position}", position.to_s)
      post(api_call, body)
    end

    def self.add_multiple(board_id, comment, cards)
      api_call = ADD_CARDS.gsub("{boardID}", board_id.to_s).gsub("{comment}", URI::encode(comment))
      post(api_call, cards)
    end

    def self.update(board_id, body)
      api_call = UPDATE_CARD.gsub("{boardID}", board_id.to_s)
      post(api_call, body)
    end

    def self.history(board_id, card_id)
      api_call = HISTORY_CARD.gsub("{boardID}", board_id.to_s).gsub("{cardID}", card_id.to_s)
      get(api_call)
    end
  end
end
