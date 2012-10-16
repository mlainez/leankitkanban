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
  
  describe :delete_multiple do  
    before :each do
      @board_id = mock("boardID")
      @card_ids = [ mock("cardID_0"), mock("cardID_1"), mock("cardID_2") ]
    end

    it "deletes the card whose ids are passed" do
      api_call = "/Board/#{@board_id}/DeleteCards"
      LeanKitKanban::Card.should_receive(:post).with(api_call, @card_ids)
      LeanKitKanban::Card.delete_multiple(@board_id, @card_ids)
    end
  end

  describe :delete do  
    before :each do
      @board_id  = mock("boardID")
      @card_id   = mock("cardID")
    end

    it "deletes the board card whose id is passed" do
      api_call = "/Board/#{@board_id}/DeleteCard/#{@card_id}"
      LeanKitKanban::Card.should_receive(:post).with(api_call, {})
      LeanKitKanban::Card.delete(@board_id, @card_id)
    end
  end

  describe :add do  
    before :each do
      @board_id  = mock("boardID")
      @lane_id   = mock("laneID")
      @position  = mock("position")
      @body = { "Title" => mock("title"), "TypeId" => mock("typeID")}
    end

    it "adds the card into the lane and position provided" do
      api_call = "/Board/#{@board_id}/AddCard/Lane/#{@lane_id}/Position/#{@position}"
      LeanKitKanban::Card.should_receive(:post).with(api_call, @body)
      LeanKitKanban::Card.add(@board_id, @lane_id, @position, @body)
    end
  end

  describe :update do  
    before :each do
      @board_id = mock("boardID")
      @body = { "Id" => mock("Id"), "Title" => mock("title"), "Description" => mock("description") }
    end

    it "updates the card using the title and description provided" do
      api_call = "/Board/#{@board_id}/UpdateCard/"
      LeanKitKanban::Card.should_receive(:post).with(api_call, @body)
      LeanKitKanban::Card.update(@board_id, @body)
    end
  end

  describe :add_multiple do  
    before :each do
      @cards = []
      @board_id  = mock("boardID")
      @wip_comment = "this is a comment"
      
      lane_ids = [ mock("lane_0"), mock("lane_1") ]
      titles = [ mock("title_0"), mock("title_1") ]
      type_ids = [ mock("type_0"), mock("type_1") ]
      
      lane_ids.each_with_index { |item, i| 
        @cards[i] = { "LaneId" => lane_ids[i], "Title" => titles[i], "TypeId" => type_ids[i] }
      }
    end

    it "adds the cards into the lanes and positions provided" do
      api_call = "/Board/#{@board_id}/AddCards?wipOverrideComment=" + URI::encode(@wip_comment)
      LeanKitKanban::Card.should_receive(:post).with(api_call, @cards)
      LeanKitKanban::Card.add_multiple(@board_id, @wip_comment, @cards)
    end
  end
end