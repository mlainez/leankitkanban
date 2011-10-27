require "spec_helper"

describe LeanKitKanban::Config do
  describe :validate do
    before :each do
      LeanKitKanban::Config.email    = EMAIL
      LeanKitKanban::Config.password = PASSWORD
      LeanKitKanban::Config.boardID  = BOARD_ID
      LeanKitKanban::Config.account  = TEST_ACCOUNT
    end

    context "when the config is not set" do
      it "raises a no credentials error when no email" do
        LeanKitKanban::Config.email = nil
        lambda{ LeanKitKanban::Config.validate }.should raise_error(LeanKitKanban::Config::NoCredentials)
      end

      it "raises a no credentials error when no password" do
        LeanKitKanban::Config.password = nil
        lambda{ LeanKitKanban::Config.validate }.should raise_error(LeanKitKanban::Config::NoCredentials)
      end

      it "raises a no boardId error when no boardID" do
        LeanKitKanban::Config.boardID = nil
        lambda{ LeanKitKanban::Config.validate }.should raise_error(LeanKitKanban::Config::NoBoardID)
      end

      it "raises a no account error when no account" do
        LeanKitKanban::Config.account = nil
        lambda{ LeanKitKanban::Config.validate }.should raise_error(LeanKitKanban::Config::NoAccount)
      end
    end

    context "when the config is set" do
      it "doesn't raise a no credentials error" do
        lambda{ LeanKitKanban::Config.validate }.should_not raise_error(LeanKitKanban::Config::NoCredentials)
      end

      it "doesn't raise a no boardID error" do
        lambda{ LeanKitKanban::Config.validate }.should_not raise_error(LeanKitKanban::Config::NoBoardID)
      end

      it "doesn't raise a no account error" do
        lambda{ LeanKitKanban::Config.validate }.should_not raise_error(LeanKitKanban::Config::NoAccount)
      end
    end
  end
end