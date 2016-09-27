require "spec_helper"

describe LeanKitKanban::Archive do
  describe :fetch do
    before :each do
      @board_id  = double("boardID")
    end

    it "should get the archive of the given board" do
      api_call = "/Board/#{@board_id}/Archive"
      LeanKitKanban::Archive.should_receive(:get).with(api_call)
      LeanKitKanban::Archive.fetch(@board_id)
    end
  end
end
