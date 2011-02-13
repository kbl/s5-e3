require 'singleton'

class TreeNode

    RED = 'red'
    BLACK = 'black'

    attr_reader :color
    attr_accessor :left, :right, :node_data

    def initialize(left = nil, right = nil, color = BLACK)
        @color = color
        @left = left
        @right = right
    end

end
