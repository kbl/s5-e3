require 'minitest/autorun'

require File.expand_path(File.join(File.dirname(__FILE__), 'tree_node_test'))
require File.expand_path(File.join(File.dirname(__FILE__), 'rb_tree_test'))
require File.expand_path(File.join(File.dirname(__FILE__), 'rb_tree_rotation_test'))
#require File.expand_path(File.join(File.dirname(__FILE__), 'c_rbtree_impl_test'))

MiniTest::Unit.autorun
