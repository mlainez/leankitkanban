require "spec_helper"

describe LeanKitKanban::Backlog do
  describe :fetch do
    before :each do
      @board_id  = double("boardID")
    end

    it "should get the backlog of the given board" do
      api_call = "/Board/#{@board_id}/Backlog"
      LeanKitKanban::Backlog.should_receive(:get).with(api_call)
      LeanKitKanban::Backlog.fetch(@board_id)
    end
  end
end
