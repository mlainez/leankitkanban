module LeanKitRequest
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    REPLY_DATA_KEY  = "ReplyData"

    private
    def get(api_call)
      url      = "#{LeanKitKanban::Config.uri}#{api_call}"
      response = super(url, LeanKitKanban::Config.basic_auth_hash)
      parse_body(response.body)
    end

    def post(api_call, body)
      url = "#{LeanKitKanban::Config.uri}#{api_call}"
      headers("Content-Type" => "application/json")
      request = LeanKitKanban::Config.basic_auth_hash
      request[:body] = body.to_json
      response = super(url, request)
      parse_body(response.body)
    end

    def parse_body(body)
      json_data = JSON.parse(body)
      json_data[REPLY_DATA_KEY]
    end
  end
end