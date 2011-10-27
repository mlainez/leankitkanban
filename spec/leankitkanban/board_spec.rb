require "spec_helper"

describe LeanKitKanban::Board do
  describe :all do
    before :each do
      LeanKitKanban::Config.email    = EMAIL
      LeanKitKanban::Config.password = PASSWORD
      LeanKitKanban::Config.account  = TEST_ACCOUNT
      @response = mock("Response")
      LeanKitKanban::Config.stub(:uri)
      LeanKitKanban::Board.stub(:get => @response)
      @response.stub(:body)
    end

    it "gets the base uri" do
      LeanKitKanban::Config.should_receive(:uri)
      LeanKitKanban::Board.all
    end

    it "gets the basic authentication hash" do
      LeanKitKanban::Config.should_receive(:basic_auth_hash)
      LeanKitKanban::Board.all
    end

    it "gets all boards for that account" do
      LeanKitKanban::Board.should_receive(:get).and_return(@response)
      LeanKitKanban::Board.all
    end

    it "gets the body from the response" do
      @response.should_receive(:body)
      LeanKitKanban::Board.all
    end
  end
end