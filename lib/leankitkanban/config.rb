module LeanKitKanban
  module Config
    class NoCredentials < StandardError; end
    class NoAccount < StandardError; end

    class << self
      attr_accessor :email, :password, :account

      LKK_DOMAIN = "leankit.com"
      API_SUFFIX = "/kanban/api"

      def validate
        raise NoCredentials if email.nil? || password.nil?
        raise NoAccount if account.nil?
      end

      def uri
        validate
        "https://#{account}.#{LKK_DOMAIN}#{API_SUFFIX}"
      end

      def basic_auth_hash
        validate
        {:basic_auth => {:username => email, :password => password}}
      end
    end
  end
end
