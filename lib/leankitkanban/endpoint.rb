module LeanKitEndpoint
  # Archive endpoints
  ARCHIVE = "/Board/{boardID}/Archive"

  # Backlog endpoints
  BACKLOG = "/Board/{boardID}/Backlog"

  # Board endpoints
  GET_BOARDS                = "/Boards"
  GET_BOARD                 = "/Boards/{boardID}"
  GET_BOARD_IDENTIFIERS     = "/Board/{boardID}/GetBoardIdentifiers"
  GET_NEWER_BOARD_IF_EXISTS = "/Board/{boardID}/BoardVersion/{versionID}/GetNewerIfExists"
  CHECK_FOR_BOARD_UPDATES   = "/Board/{boardID}/BoardVersion/{versionID}/CheckForUpdates"
  GET_BOARD_HISTORY_SINCE   = "/Board/{boardID}/BoardVersion/{versionID}/GetBoardHistorySince"

  # Card endpoints
  DELETE_CARD      = "/Board/{boardID}/DeleteCard/{cardID}"
  DELETE_CARDS     = "/Board/{boardID}/DeleteCards"
  FIND_CARD        = "/Board/{boardID}/GetCard/{cardID}"
  FIND_CARD_EXT_ID = "/Board/{boardID}/GetCardByExternalId/{externalID}"
  ADD_CARD         = "/Board/{boardID}/AddCard/Lane/{laneID}/Position/{position}"
  ADD_CARDS        = "/Board/{boardID}/AddCards?wipOverrideComment={comment}"
  UPDATE_CARD      = "/Board/{boardID}/UpdateCard/"
  HISTORY_CARD     = "/Card/History/{boardID}/{cardID}"
  MOVE_CARD        = "/Board/{boardID}/MoveCard/{cardID}/Lane/{laneID}/Position/{position}"

end
