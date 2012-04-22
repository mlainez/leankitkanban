require "uri"
require "httparty"
require "json"

require File.join(File.dirname(__FILE__), 'leankit_request')
require File.join(File.dirname(__FILE__), 'leankitkanban', 'config')
require File.join(File.dirname(__FILE__), 'leankitkanban', 'board')
require File.join(File.dirname(__FILE__), 'leankitkanban', 'card')
require File.join(File.dirname(__FILE__), 'leankitkanban', 'backlog')
require File.join(File.dirname(__FILE__), 'leankitkanban', 'archive')

module LeanKitKanban

  private

  def self.get_single_result(results)
    return results if results.nil?
    return results[0] if results.kind_of?(Array)
    results
  end
end
