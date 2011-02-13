class RBTree
    
    attr :root

    def insert(data_to_insert)
        @root = insert_to_subtree(@root, data_to_insert)
    end

    private

    def insert_to_subtree(root, data_to_insert)
        return TreeNode.new(data_to_insert) if root.nil?

        if root.node_data > data_to_insert
            root.left = insert_to_subtree(root.left, data_to_insert)
        elsif root.node_data < data_to_insert
            root.right = insert_to_subtree(root.right, data_to_insert)
        end

        root
    end

end
