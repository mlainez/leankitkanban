module LeanKitKanban
  module Config
    class NoCredentials < StandardError; end
    class NoAccount < StandardError; end

    class << self
      attr_accessor :email, :password, :account

      LKK_DOMAIN = "leankitkanban.com"

      def validate
        raise NoCredentials if email.nil? || password.nil?
        raise NoAccount if account.nil?
      end

      def uri
        validate
        "http://#{account}.#{LKK_DOMAIN}/Kanban/API"
      end

      def basic_auth_hash
        validate
        {:basic_auth => {:username => email, :password => password}}
      end
    end
  end
end