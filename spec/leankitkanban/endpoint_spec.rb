require "spec_helper"

describe LeanKitKanban::LeanKitEndpoint do
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
      actual = LeanKitKanban::LeanKitEndpoint::ClassMethods.build_api_endpoint(@endpoint_url, board_id: @board_id, version_id: @version_id)

      expect(actual).to eq(expected)
    end
  end
end
