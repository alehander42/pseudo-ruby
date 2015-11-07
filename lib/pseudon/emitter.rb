require 'parser/current'
require_relative 'templates'

module Pseudon
  def self.emit(node)
    Emitter.new(TEMPLATES).emit_cell node
  end

  class Emitter
    def initialize(templates, offset = 2)
      @offset = ' ' * offset
      @templates = templates
    end

    def emit_cell(node, depth = 0)
      a = node.type == :begin ? node.children : [node]
      "(Cell\n#{emit_nodes(a, "\n", 1)})\n"
    end

    def emit_node(node, depth = 0)
      (@offset * depth ) + if node.is_a?(AST::Node)
        emit_template @templates[node.type], node, depth
      else
        node.to_s
      end
    end

    def emit_template(template, node, depth = 0)
      placeholders = template.scan /%{\d+}/
      result = template
      placeholders.reduce(template) do |out, q|
        child = emit_node(node.children[q[2..-2].to_i])
        out.gsub(q, child)
      end
    end

    def emit_nodes(nodes, sep, depth = 0)
      nodes.map { |node| emit_node(node, depth) }.join(sep)
    end
  end
end
