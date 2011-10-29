require "spec_helper"

describe LeanKitKanban::Backlog do
  describe :fetch do
    before :each do
      @board_id  = mock("boardID")
    end

    it "gets the board card whose id is passed" do
      api_call = "/Board/#{@board_id}/Backlog"
      LeanKitKanban::Backlog.should_receive(:get).with(api_call)
      LeanKitKanban::Backlog.fetch(@board_id)
    end
  end
end