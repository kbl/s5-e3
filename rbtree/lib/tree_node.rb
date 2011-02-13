require 'singleton'

class TreeNode

    include Comparable

    RED = 'red'
    BLACK = 'black'

    attr_reader :color
    attr_accessor :left, :right, :node_data

    def initialize(node_data = nil, color = BLACK)
        @color = color
        @node_data = node_data
    end

    def <=>(other_node)
        node_data <=> other_node.node_data
    end

end
