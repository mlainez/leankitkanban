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

  describe :find_by_external_id do
    before :each do
      @board_id    = mock("boardID")
      @external_id = mock("externalID")
    end

    it "gets the board card whose id is passed" do
      api_call = "/Board/#{@board_id}/GetCardByExternalId/#{@external_id}"
      LeanKitKanban::Card.should_receive(:get).with(api_call)
      LeanKitKanban::Card.find_by_external_id(@board_id, @external_id)
    end
  end
end