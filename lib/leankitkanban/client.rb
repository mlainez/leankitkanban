module LeanKitKanban
  module Client
    class NoToken < StandardError; end

    class << self
      attr_writer :token

      def connection(options={})
        raise NoToken
      end
    end
  end
end