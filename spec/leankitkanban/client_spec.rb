require "spec_helper"

describe LeanKitKanban::Client do
  describe :connection do
    context "when there is no token" do
      before :each do
        LeanKitKanban::Client.token = nil
      end

      it "raises a no token error" do
        lambda{ LeanKitKanban::Client.connection }.should raise_error(LeanKitKanban::Client::NoToken)
      end
    end
  end
end