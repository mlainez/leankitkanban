require "spec_helper"

describe LeanKitKanban::Endpoint do
  before :all do
    ConfigHelper.set_test_config
  end

  describe :build_api_endpoint do
    before :each do
      @board_id     = double("boardID")
      @version_id   = double("versionID")
      @endpoint_url = "/Board/{boardID}/BoardVersion/{versionID}/GetNewerIfExists"
    end

    it "should build an endpoint based on the given input" do
      expected = "/Board/#{@board_id}/BoardVersion/#{@version_id}/GetNewerIfExists"
      actual = LeanKitKanban::Endpoint::ClassMethods.build_api_endpoint(@endpoint_url, board: @board_id, version: @version_id)

      expect(actual).to eq(expected)
    end
  end
end
