require 'minitest/autorun'

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'rb_tree'))

class RBTreeTest < MiniTest::Unit::TestCase

    def test_should_create_valid_binary_search_tree
        tree = build_tree(9, 7, 11, 12)

        root = tree.root

        assert_node_data(root, 9)
        assert_node_data(root.left, 7)
        assert_node_data(root.right, 11)
        assert_node_data(root.right.right, 12)
    end

    private

    def assert_node_data(node, data)
        assert node.node_data == data
    end

    def build_tree(*insert_to_tree)
        tree = RBTree.new
        insert_to_tree.each { |element| tree.insert(element) }

        tree
    end

end
