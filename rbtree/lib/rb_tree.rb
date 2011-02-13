class RBTree
    
    attr :root

    def insert(key, value)
        @root = insert_to_subtree(@root, key, value)
    end

    def visualize_tree
        visualize_node(@root)
    end

    private

    def visualize_node(node)
        return if node.nil?
        p node
        p "<"
        visualize_node(node.left) unless node.left.nil?
        p ">"
        visualize_node(node.right) unless node.right.nil?
    end

    def insert_to_subtree(root, key, value)
        return TreeNode.new(key, value) if root.nil?

        if root.key > key
            root.left = insert_to_subtree(root.left, key, value)
        elsif root.key < key
            root.right = insert_to_subtree(root.right, key, value)
        end

        root
    end

end
