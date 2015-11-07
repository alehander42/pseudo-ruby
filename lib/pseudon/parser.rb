require 'parser/current'

module Pseudon
  def self.parse(source)
    Parser::CurrentRuby.parse source
  end
end
