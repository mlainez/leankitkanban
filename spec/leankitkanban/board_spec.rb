require "spec_helper"

describe LeanKitKanban::Board do
  before :all do
    ConfigHelper.set_test_config
  end

  describe :all do
    it "should get all boards for the given account" do
      api_call = "/Boards"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.all
    end
  end

  describe :find do
    before :each do
      @board_id  = double("boardID")
    end

    it "should get the board" do
      api_call = "/Boards/#{@board_id}"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.find(@board_id)
    end
  end

  describe :get_identifiers do
    before :each do
      @board_id  = double("boardID")
    end

    it "should get the identifiers of the board" do
      api_call = "/Board/#{@board_id}/GetBoardIdentifiers"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.get_identifiers(@board_id)
    end
  end

  describe :get_newer_if_exists do
    before :each do
      @board_id   = double("boardID")
      @version_id = double("versionID")
    end

    it "should get a greater version of the board than the one passed" do
      api_call = "/Board/#{@board_id}/BoardVersion/#{@version_id}/GetNewerIfExists"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.get_newer_if_exists(@board_id, @version_id)
    end
  end

  describe :get_board_updates do
    before :each do
      @board_id   = double("boardID")
      @version_id = double("versionID")
    end

    it "should get updates for the board and version that are provided" do
      api_call = "/Board/#{@board_id}/BoardVersion/#{@version_id}/CheckForUpdates"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.get_board_updates(@board_id, @version_id)
    end
  end

  describe :get_board_history_since do
    before :each do
      @board_id   = double("boardID")
      @version_id = double("versionID")
    end

    it "should get a greater version of the board than the one passed" do
      api_call = "/Board/#{@board_id}/BoardVersion/#{@version_id}/GetBoardHistorySince"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.get_board_history_since(@board_id, @version_id)
    end
  end
end
