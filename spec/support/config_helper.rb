module ConfigHelper
  def self.set_test_config
    LeanKitKanban::Config.email    = EMAIL
    LeanKitKanban::Config.password = PASSWORD
    LeanKitKanban::Config.account  = TEST_ACCOUNT
  end
end