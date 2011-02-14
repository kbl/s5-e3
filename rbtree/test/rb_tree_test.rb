require 'minitest/autorun'

require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

class RBTreeTest < MiniTest::Unit::TestCase

    def test_should_create_valid_binary_search_tree
        tree = build_tree([9, 'a'], [7, 'b'], [11, 'c'], [12, 'd'])
        root = tree.root

        assert_node(root, 9, 'a')
        assert_node(root.left, 7, 'b')
        assert_node(root.right, 11, 'c')
        assert_node(root.right.right, 12, 'd')
    end

end
