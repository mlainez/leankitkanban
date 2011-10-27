require "spec_helper"

describe LeanKitKanban::Board do
  before :all do
    ConfigHelper.set_test_config
  end

  describe :all do
    before :each do
      @response = mock("Response")
      @body     = mock("Body")
      @json     = mock("Json")
      LeanKitKanban::Config.stub(:uri)
      LeanKitKanban::Board.stub(:get => @response)
      @response.stub(:body => @body)
      JSON.stub(:parse => @json)
      @json.stub(:[])
    end

    it "gets the base uri" do
      LeanKitKanban::Config.should_receive(:uri)
      LeanKitKanban::Board.all
    end

    it "gets the basic authentication hash" do
      LeanKitKanban::Config.should_receive(:basic_auth_hash)
      LeanKitKanban::Board.all
    end

    it "gets all boards for that account" do
      LeanKitKanban::Board.should_receive(:get).and_return(@response)
      LeanKitKanban::Board.all
    end

    it "gets the body from the response" do
      @response.should_receive(:body).and_return(@body)
      LeanKitKanban::Board.all
    end

    it "converts the response body json" do
      JSON.should_receive(:parse).with(@body)
      LeanKitKanban::Board.all
    end
  end
end