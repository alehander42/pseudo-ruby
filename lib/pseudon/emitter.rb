require 'parser/current'

module Pseudon
  def self.emit(node)
    Emitter.new.emit_program node
  end

  class Emitter
    def initialize()
      @in_class = false
    end

    def emit_program(node)
      a = node.type == :begin ? node.children : [node]
      emit a
    end

    private

    def emit(node)
      if node.is_a? AST::Node
        # p node, node.type
        send :"emit_#{node.type.downcase}", node
      elsif node.is_a? Array
        node.map &method(:emit)
      else
        node
      end
    end

    def emit_int(node)
      {type: 'int', value: node.children[0]}
    end

    def emit_send(node)
      if node.children.length == 2
        if node.children[0].nil?
          {type: 'local', name: node.children[1]}
        else
          {type: 'attr', receiver: emit(node.children[0]), slot: node.children[1]}
        end
      else
        if node.children[0].nil?
          {type: 'call', handler: node.children[1], args: emit(node.children[2..-1])}
        else
          {type: 'method_call', receiver: emit(node.children[0]), message: node.children[1], args: emit(node.children[2..-1])}
        end
      end
    end

    def emit_def(node)
      type = @in_class ? 'method' : 'function'
      args = node.children[1].children.map { |arg| {type: 'local', name: arg.children[0]} }
      arg_type_hints = args.map { '@unknown' }
      {type: type, args: emit(args), body: emit(node.children[2]), type_hint: arg_type_hints + ['@unknown']}
    end
  end
end
