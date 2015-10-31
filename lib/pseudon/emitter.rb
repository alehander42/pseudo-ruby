require 'parser/current'
require_relative 'templates'

module Pseudon
  module_function :emit

  def emit(node)
    Emitter.new(TEMPLATES).emit_cell node
  end

  class Emitter
    def initialize(templates, offset = 2)
      @offset = ' ' * offset
      @templates = templates
    end

    def emit_cell(node, depth = 0)
      "(Cell\n#{emit_nodes(node.children, "\n", 1)})\n"
    end

    def emit_node(node, depth = 0)
      (@offset * depth ) + if node.is_a?(Parser::AST::Node)
        emit_template @templates[node.kind], node, depth
      else
        node.to_s
      end
    end

    def emit_template(template, node, depth = 0)

    def emit_nodes(nodes, sep, depth = 0)
      sep.join(nodes.map { |node| emit_node(node, depth) })
    end
end
