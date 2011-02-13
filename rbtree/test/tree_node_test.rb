require 'lib/tree_node'
require 'test/unit'

class TreeNodeTest < Test::Unit::TestCase

    def test_tree_node_should_be_red_by_default
        node_color = TreeNode.new.color
        assert 'red' == node_color
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

    def test_should_return_true_for_filled_node
        node = TreeNode.new(false)
        assert node.filled?
    end

    def test_should_return_false_for_empty_node
        node = TreeNode.new
        assert (not node.filled?)
    end

    def TODO_test_shoul_be_possible_to_compare_nodes_with_other_comparable
        node = TreeNode.new(123)

        assert (node <=> 123) == 0
    end

end
