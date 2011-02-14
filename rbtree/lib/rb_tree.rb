class RBTree

    LEFT = 'left'
    RIGHT = 'right'

    attr :root

    def insert(key, value)
        @root = insert_to_subtree(@root, key, value)
    end

    def visualize_tree
        visualize_node(@root)
    end

    def single_rotation(root, child)
        sibling = sibling_method_name(child)
        sibling_assigment = assigment_method_name(sibling)
        child_assigment = assigment_method_name(child)

        rotation_root = root.send(sibling)
        root.send(sibling_assigment, rotation_root.send(child))
        rotation_root.send(child_assigment, root)

        root.color_red
        rotation_root.color_black

        rotation_root
    end

    def double_rotation(root, child)
        sibling = sibling_method_name(child)
        sibling_assigment = assigment_method_name(sibling)

        root.send(sibling_assigment, single_rotation(root.send(sibling), sibling))

        single_rotation(root, child)
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

    def sibling_method_name(child)
        {LEFT => RIGHT, RIGHT => LEFT}[child]
    end

    def assigment_method_name(attribute_name)
        "#{attribute_name}="
    end

end
