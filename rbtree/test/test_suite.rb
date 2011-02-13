require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'
require 'test/tree_node_test'
require 'test/rb_tree_test'

class TestSuite

    def self.suite
        suite = Test::Unit::TestSuite.new
        suite << TreeNodeTest.suite
        suite << RBTreeTest.suite
    end

end

Test::Unit::UI::Console::TestRunner.run(TestSuite)
