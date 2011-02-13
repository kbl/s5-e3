require 'minitest/autorun'

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'tree_node'))

class TreeNodeTest < MiniTest::Unit::TestCase

    def test_tree_node_should_be_red_by_default
        node_color = TreeNode.new(1).color
        assert 'red' == node_color
    end

    def test_new_node_childs_should_be_nils
        node = TreeNode.new(1)
        assert node.left == nil
        assert node.right == nil
    end

    def test_should_properly_set_new_node_data
        node = TreeNode.new(123)
        assert node.key == 123
    end

    def test_nodes_should_inclue_comparable
        node1 = TreeNode.new(222)
        node2 = TreeNode.new(111)

        assert (node1 <=> node2) == 1
    end

end
