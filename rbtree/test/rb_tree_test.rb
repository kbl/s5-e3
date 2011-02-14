require 'minitest/autorun'

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'rb_tree'))

class RBTreeTest < MiniTest::Unit::TestCase

    def test_should_create_valid_binary_search_tree
        tree = build_tree([9, 'a'], [7, 'b'], [11, 'c'], [12, 'd'])
        root = tree.root

        assert_node(root, 9, 'a')
        assert_node(root.left, 7, 'b')
        assert_node(root.right, 11, 'c')
        assert_node(root.right.right, 12, 'd')
    end

    def test_should_properly_make_single_left_rotation
        tree = build_tree([9, 'a'], [7, 'b'], [11, 'c'], [10, 'd'], [12, 'e'])
        root = tree.root

        assert_node(root, 9, 'a')
        assert_node(root.left, 7, 'b')
        assert_node(root.right, 11, 'c')
        assert_node(root.right.left, 10, 'd')
        assert_node(root.right.right, 12, 'e')

        root = tree.single_rotation(tree.root, 'left')

        assert_node(root, 11, 'c')
        assert_node(root.left, 9, 'a')
        assert_node(root.left.left, 7, 'b')
        assert_node(root.left.right, 10, 'd')
        assert_node(root.right, 12, 'e')
    end

    def test_should_properly_make_single_right_rotation
        tree = build_tree([9, 'a'], [7, 'b'], [8, 'c'], [6, 'd'], [11, 'e'], [10, 'f'], [12, 'g'])
        root = tree.root

        assert_node(root, 9, 'a')
        assert_node(root.left, 7, 'b')
        assert_node(root.left.left, 6, 'd')
        assert_node(root.left.right, 8, 'c')
        assert_node(root.right, 11, 'e')
        assert_node(root.right.left, 10, 'f')
        assert_node(root.right.right, 12, 'g')

        root = tree.single_rotation(tree.root, 'right')

        assert_node(root, 7, 'b')
        assert_node(root.left, 6, 'd')
        assert_node(root.right, 9, 'a')
        assert_node(root.right.left, 8, 'c')
        assert_node(root.right.right, 11, 'e')
        assert_node(root.right.right.left, 10, 'f')
        assert_node(root.right.right.right, 12, 'g')
    end

    private

    def assert_node(node, key, value)
        assert node.key == key
        assert node.value == value
    end

    def assert_node_color_red(node)
        assert_equals node.color, 'red'
    end

    def assert_node_color_black(node)
        assert_equals node.color, 'black'
    end

    def build_tree(*entries_to_insert)
        tree = RBTree.new
        entries_to_insert.each { |entry| tree.insert(entry[0], entry[1]) }

        tree
    end

end
