require 'lib/tree_node'
require 'test/unit'

class TreeNodeTest < Test::Unit::TestCase

    def test_tree_node_should_have_default_black_color_property
        node_color = TreeNode.new.color
        assert 'black' == node_color
    end

    def test_new_node_childs_should_be_nils
        node = TreeNode.new
        assert node.left == nil
        assert node.right == nil
    end

    def test_should_properly_set_new_node_data
        node = TreeNode.new(123)
        assert node.node_data == 123
    end

    def test_nodes_should_inclue_comparable
        node1 = TreeNode.new(222)
        node2 = TreeNode.new(111)

        assert (node1 <=> node2) == 1
    end

end
