require_relative 'pseudon/parser'
require_relative 'pseudon/emitter'
require 'yaml'

module Pseudon
  def self.translate(source)
    YAML.dump(Pseudon.emit(Pseudon.parse(source)))
  end
end
