require_relative 'pseudon/parser'
require_relative 'pseudon/emitter'

module Pseudon
  def self.translate(source)
    Pseudon.emit(Pseudon.parse(source))
  end
end
