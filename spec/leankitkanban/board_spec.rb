require "spec_helper"

describe LeanKitKanban::Board do
  before :all do
    ConfigHelper.set_test_config
  end

  describe :all do
    it "gets all boards for that account" do
      api_call = "/Boards"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.all
    end
  end

  describe :find do
    before :each do
      @board_id  = mock("boardID")
    end

    it "gets the board whose id is passed as parameter" do
      api_call = "/Boards/#{@board_id}"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.find(@board_id)
    end
  end

  describe :get_identifiers do
    before :each do
      @board_id  = mock("boardID")
    end

    it "gets the identifiers of the board whose id is passed as parameter" do
      api_call = "/Board/#{@board_id}/GetBoardIdentifiers"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.get_identifiers(@board_id)
    end
  end
end