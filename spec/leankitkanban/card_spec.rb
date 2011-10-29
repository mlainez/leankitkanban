require "spec_helper"

describe LeanKitKanban::Card do
  describe :find do
    before :each do
      @board_id  = mock("boardID")
      @card_id   = mock("cardID")
    end

    it "gets the board card whose id is passed" do
      api_call = "/Board/#{@board_id}/GetCard/#{@card_id}"
      LeanKitKanban::Card.should_receive(:get).with(api_call)
      LeanKitKanban::Card.find(@board_id, @card_id)
    end
  end
end