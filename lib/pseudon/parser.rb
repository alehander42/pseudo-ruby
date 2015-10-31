require 'parser/current'

module Pseudon
  module_function :parse

  def parse(source)
    Parser::CurrentRuby.parse source
  end
end
