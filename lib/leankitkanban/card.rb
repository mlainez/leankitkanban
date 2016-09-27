module LeanKitKanban
  module Card
    include HTTParty
    include LeanKitRequest
    include LeanKitEndpoint

    def self.delete(board_id, card_id)
      post(format_url(DELETE_CARD,
                      "{boardID}" => board_id,
                      "{cardID}" => card_id), {})
    end

    def self.delete_multiple(board_id, card_ids)
      post(format_url(DELETE_CARDS, "{boardID}" => board_id), card_ids)
    end

    def self.move(board_id, card_id,lane_id,position=0)
      post(format_url(MOVE_CARD,
                      "{boardID}" => board_id,
                      "{cardID}" => card_id,
                      "{laneID}" => lane_id,
                      "{position}" => position), {})
    end

    def self.find(board_id, card_id)
      get(format_url(FIND_CARD, "{boardID}" => board_id, "{cardID}" => card_id))
    end

    def self.find_by_external_id(board_id, external_id)
      get(format_url(FIND_CARD_EXT_ID,
                     "{boardID}" => board_id,
                     "{externalID}" => external_id))
    end

    def self.add(board_id, lane_id, position, body)
      post(format_url(ADD_CARD,
                      "{boardID}" => board_id,
                      "{laneID}" => lane_id,
                      "{position}" => position), body)
    end

    def self.add_multiple(board_id, comment, cards)
      post(format_url(ADD_CARDS,
                      "{boardID}" => board_id,
                      "{comment}" => URI::encode(comment)), cards)
    end

    def self.update(board_id, body)
      post(format_url(UPDATE_CARD, "{boardID}" => board_id), body)
    end

    def self.history(board_id, card_id)
      get(format_url(HISTORY_CARD,
                     "{boardID}" => board_id,
                     "{cardID}" => card_id))
    end
  end
end
