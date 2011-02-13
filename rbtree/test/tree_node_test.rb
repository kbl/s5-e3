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

end
