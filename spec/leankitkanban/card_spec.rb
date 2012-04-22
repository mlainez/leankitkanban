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

    it "should return the object returned from the api call" do
      api_call = "/Board/#{@board_id}/GetCard/#{@card_id}"
      object = Object.new
      LeanKitKanban::Card.should_receive(:get).with(api_call).and_return(object)
      result = LeanKitKanban::Card.find(@board_id, @card_id)
      result.should be(object)
    end

    it "should return nil if the api call returns nil" do
      api_call = "/Board/#{@board_id}/GetCard/#{@card_id}"
      LeanKitKanban::Card.should_receive(:get).with(api_call).and_return(nil)
      result = LeanKitKanban::Card.find(@board_id, @card_id)
      result.nil?.should equal(true)
    end

    it "should return the first object if returned an array" do
      array = [Object.new, Object.new]
      api_call = "/Board/#{@board_id}/GetCard/#{@card_id}"
      LeanKitKanban::Card.should_receive(:get).with(api_call).and_return(array)
      result = LeanKitKanban::Card.find(@board_id, @card_id)
      result.should equal(array[0])
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

    it "should return the object returned from the api call" do
      api_call = "/Board/#{@board_id}/GetCardByExternalId/#{@external_id}"
      object = Object.new
      LeanKitKanban::Card.should_receive(:get).with(api_call).and_return(object)
      result = LeanKitKanban::Card.find_by_external_id(@board_id, @external_id)
      result.should be(object)
    end

    it "should return nil if the api call returns nil" do
      api_call = "/Board/#{@board_id}/GetCardByExternalId/#{@external_id}"
      LeanKitKanban::Card.should_receive(:get).with(api_call).and_return(nil)
      result = LeanKitKanban::Card.find_by_external_id(@board_id, @external_id)
      result.nil?.should equal(true)
    end

    it "should return the first object if returned an array" do
      api_call = "/Board/#{@board_id}/GetCardByExternalId/#{@external_id}"
      array = [Object.new, Object.new]
      LeanKitKanban::Card.should_receive(:get).with(api_call).and_return(array)
      result = LeanKitKanban::Card.find_by_external_id(@board_id, @external_id)
      result.should equal(array[0])
    end
  end
end
