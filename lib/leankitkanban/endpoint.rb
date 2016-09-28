module LeanKitKanban
  module Endpoint
    # Archive endpoints
    GET_BOARD_ARCHIVE = "/Board/{boardID}/Archive"

    # Backlog endpoints
    GET_BOARD_BACKLOG = "/Board/{boardID}/Backlog"

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

    module ClassMethods
      # Method that replaces the arguments in an endpoint with the given parameters.
      # Arguments that are passed to the build_api_endpoint method, but do not
      # live in the endpoint, are discarded.
      def build_api_endpoint(api_endpoint_template, arguments = {})
        # Endpoint parameters hash that links symbols to regex
        endpoint_parameters = { :board    => /\{boardID\}/,
                                :version  => /\{versionID\}/,
                                :lane     => /\{laneID\}/,
                                :card     => /\{cardID\}/,
                                :external => /\{externalID\}/,
                                :position => /\{position\}/,
                                :comment  => /\{comment\}/
                              }
        # Loop over the given argument symbols, retrieve the corresponding regex
        # and replace the argument with the corresponding value.
        arguments.each do |k, v|
          api_endpoint_template.gsub!(endpoint_parameters.fetch(k), v.to_s)
        end

        return api_endpoint_template
      end

      # Make the method available for Rspec
      module_function :build_api_endpoint
    end

    def self.included(receiver)
      receiver.extend ClassMethods
    end
  end
end
