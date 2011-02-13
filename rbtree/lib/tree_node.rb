require 'singleton'

class TreeNode

    include Comparable

    RED = 'red'
    BLACK = 'black'

    attr_reader :color
    attr_accessor :left, :right, :node_data

    def initialize(node_data = nil, color = RED)
        @color = color
        @node_data = node_data
    end

    def <=>(other_node)
        return node_data <=> other_node.node_data if other_node.method(:node_data)
        node_data <=> other_node
    end

    def filled?
        not node_data == nil
    end

end
