require 'singleton'

class TreeNode

    include Comparable

    RED = 'red'
    BLACK = 'black'

    attr_reader :color
    attr_accessor :left, :right
    attr_accessor :key, :value 

    def initialize(key, value = nil)
        @color = RED
        @key = key
        @value = value
    end

    def <=>(other_node)
        @key <=> other_node.key
    end

    def to_s
        "#{color[0]} #{key}:#{value}"
    end

end
