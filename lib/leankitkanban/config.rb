module LeanKitKanban
  module Config
    class NoCredentials < StandardError; end
    class NoBoardID < StandardError; end
    class NoAccount < StandardError; end

    class << self
      attr_writer :email, :password, :boardID, :account

      def validate
        raise NoCredentials if @email.nil? || @password.nil?
        raise NoBoardID if @boardID.nil?
        raise NoAccount if @account.nil?
      end
    end
  end
end