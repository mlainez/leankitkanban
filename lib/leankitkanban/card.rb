module LeanKitKanban
  module Card
    include HTTParty
    include LeanKitRequest
    include Endpoint

    def self.delete(board_id, card_id)
      post(build_api_endpoint(DELETE_CARD,
                      board: board_id,
                      card: card_id), {})
    end

    def self.delete_multiple(board_id, card_ids)
      post(build_api_endpoint(DELETE_CARDS, board: board_id), card_ids)
    end

    def self.move(board_id, card_id,lane_id,position=0)
      post(build_api_endpoint(MOVE_CARD,
                      board: board_id,
                      card: card_id,
                      lane: lane_id,
                      position: position), {})
    end

    def self.find(board_id, card_id)
      get(build_api_endpoint(FIND_CARD, board: board_id, card: card_id))
    end

    def self.find_by_external_id(board_id, external_id)
      get(build_api_endpoint(FIND_CARD_EXT_ID,
                     board: board_id,
                     external: external_id))
    end

    def self.add(board_id, lane_id, position, body)
      post(build_api_endpoint(ADD_CARD,
                      board: board_id,
                      lane: lane_id,
                      position: position), body)
    end

    def self.add_multiple(board_id, comment, cards)
      post(build_api_endpoint(ADD_CARDS,
                      board: board_id,
                      comment: URI::encode(comment)), cards)
    end

    def self.update(board_id, body)
      post(build_api_endpoint(UPDATE_CARD, board: board_id), body)
    end

    def self.history(board_id, card_id)
      get(build_api_endpoint(HISTORY_CARD,
                     board: board_id,
                     card: card_id))
    end
  end
end
