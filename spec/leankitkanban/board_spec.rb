require "spec_helper"

describe LeanKitKanban::Board do
  before :all do
    ConfigHelper.set_test_config
  end

  describe :all do
    before :each do
      @response  = mock("Response")
      @body      = mock("Body")
      @auth_hash = mock("Auth hash")
      LeanKitKanban::Config.stub(:uri)
      LeanKitKanban::Config.stub(:basic_auth_hash => @auth_hash)
      LeanKitKanban::Board.stub(:get => @response)
      @response.stub(:body => @body)
      LeanKitKanban::Board.stub(:parse_body)
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
      url = "/Boards"
      LeanKitKanban::Board.should_receive(:get).with(url, @auth_hash).and_return(@response)
      LeanKitKanban::Board.all
    end

    it "gets the body from the response" do
      @response.should_receive(:body).and_return(@body)
      LeanKitKanban::Board.all
    end
  end

  describe :find do
    before :each do
      @board_id  = 123
      @response  = mock("Response")
      @body      = mock("Body")
      @auth_hash = mock("Auth hash")
      LeanKitKanban::Config.stub(:uri)
      LeanKitKanban::Config.stub(:basic_auth_hash => @auth_hash)
      LeanKitKanban::Board.stub(:get => @response)
      @response.stub(:body => @body)
      LeanKitKanban::Board.stub(:parse_body)
    end

    it "gets the base uri" do
      LeanKitKanban::Config.should_receive(:uri)
      LeanKitKanban::Board.find(@board_id)
    end

    it "gets the basic authentication hash" do
      LeanKitKanban::Config.should_receive(:basic_auth_hash)
      LeanKitKanban::Board.find(@board_id)
    end

    it "gets the board whose id is passed as parameter" do
      url = "/Boards/#{@board_id}"
      LeanKitKanban::Board.should_receive(:get).with(url, @auth_hash).and_return(@response)
      LeanKitKanban::Board.find(@board_id)
    end

    it "gets the body from the response" do
      @response.should_receive(:body).and_return(@body)
      LeanKitKanban::Board.find(@board_id)
    end
  end
end