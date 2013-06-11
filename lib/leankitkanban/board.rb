module LeanKitKanban
  module Board
    include HTTParty
    include LeanKitRequest

    ALL_BOARDS      = "/Boards"
    ONE_BOARD       = "/Boards/{boardID}"
    IDENTIFIERS     = "/Board/{boardID}/GetBoardIdentifiers"
    NEWER_IF_EXISTS = "/Board/{boardID}/BoardVersion/{versionID}/GetNewerIfExists"
    HISTORY_SINCE   = "/Board/{boardID}/BoardVersion/{versionID}/GetBoardHistorySince"
    
    # http://myaccount.leankitkanban.com/Kanban/Api/Board/boardId/AddCard/Lane/laneId/Position/position
    
    ADD_CARD        = "/Board/{boardID}/AddCard/Lane/{laneID}/Position/{position}"

    def self.all
      get(ALL_BOARDS)
    end

    def self.find(board_id)
      api_call = ONE_BOARD.gsub("{boardID}", board_id.to_s)
      get(api_call)
    end

    def self.get_identifiers(board_id)
      api_call = IDENTIFIERS.gsub("{boardID}", board_id.to_s)
      get(api_call)
    end

    def self.get_newer_if_exists(board_id, version_id)
      api_call = NEWER_IF_EXISTS.gsub("{boardID}", board_id.to_s).gsub("{versionID}", version_id.to_s)
      get(api_call)
    end

    def self.get_board_history_since(board_id, version_id)
      api_call = HISTORY_SINCE.gsub("{boardID}", board_id.to_s).gsub("{versionID}", version_id.to_s)
      get(api_call)
    end
    
    def self.add_card(board_id, lane_id, position, newcard)
      api_call = ADD_CARD.gsub("{boardID}", board_id.to_s).gsub("{laneID}", lane_id.to_s).
                          gsub("{position}", position.to_s)
                          
      options = { :body => newcard }      
      # p options.inspect
      
      post(api_call, options)
    end
  end
end