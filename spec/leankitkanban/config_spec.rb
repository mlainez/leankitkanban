require "spec_helper"

describe LeanKitKanban::Config do
  describe :validate do
    before :each do
      ConfigHelper.set_test_config
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

      it "raises a no account error when no account" do
        LeanKitKanban::Config.account = nil
        lambda{ LeanKitKanban::Config.validate }.should raise_error(LeanKitKanban::Config::NoAccount)
      end
    end

    context "when the config is set" do
      it "doesn't raise a no credentials error" do
        lambda{ LeanKitKanban::Config.validate }.should_not raise_error
      end

      it "doesn't raise a no account error" do
        lambda{ LeanKitKanban::Config.validate }.should_not raise_error
      end
    end
  end

  describe :uri do
    it "validates the config" do
      LeanKitKanban::Config.should_receive(:validate)
      LeanKitKanban::Config.uri
    end

    it "returns the domain including the account name" do
      LeanKitKanban::Config.uri.should eql "https://#{TEST_ACCOUNT}.leankit.com/kanban/api"
    end
  end

  describe :basic_auth_hash do
    it "validates the config" do
      LeanKitKanban::Config.should_receive(:validate)
      LeanKitKanban::Config.basic_auth_hash
    end

    it "returns a hash with the credentials" do
      expected_hash = {:basic_auth => {:username => EMAIL, :password => PASSWORD}}
      LeanKitKanban::Config.basic_auth_hash.should eql expected_hash
    end
  end
end
