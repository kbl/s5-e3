require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'rb_tree'))

def build_tree(*entries_to_insert)
    tree = RBTree.new
    entries_to_insert.each { |entry| tree.insert(entry[0], entry[1]) }

    tree
end

def assert_node(node, key, value)
    assert node.key == key, "#{node.key} != #{key}"
    assert node.value == value, "#{node.value} != #{value}"
end

def assert_node_color_red(node)
    assert_equals node.color, 'red'
end

def assert_node_color_black(node)
    assert_equals node.color, 'black'
end
