class RBTree

    LEFT = 'left'
    RIGHT = 'right'

    attr :root

    def insert(key, value)
        @root = insert_to_subtree(@root, key, value)
        @root.color_black
    end

    def visualize_tree
        visualize_node(@root)
    end

    def single_rotation(root, subtree)
        opposite_subtree = opposite_subtree(subtree)
        opposite_subtree_assigment = assigment_method_name(opposite_subtree)
        subtree_assigment = assigment_method_name(subtree)

        new_root = root.send(opposite_subtree)
        root.send(opposite_subtree_assigment, new_root.send(subtree))
        new_root.send(subtree_assigment, root)

        colorize_nodes_after_rotation(root, new_root)

        new_root
    end

    def double_rotation(root, subtree)
        opposite_subtree = opposite_subtree(subtree)
        opposite_subtree_assigment = assigment_method_name(opposite_subtree)

        root.send(opposite_subtree_assigment, single_rotation(root.send(opposite_subtree), opposite_subtree))

        single_rotation(root, subtree)
    end

    private

    def colorize_nodes_after_rotation(root, new_root)
        root.color_red
        new_root.color_black
    end

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

        which_subtree = insert_to_subtree_saving_binary_tree_structure(root, key, value)

        rotate_after_insertion(root, which_subtree)
    end

    def insert_to_subtree_saving_binary_tree_structure(root, key, value)
        if root.key > key
            root.left = insert_to_subtree(root.left, key, value)
            return LEFT
        elsif root.key < key
            root.right = insert_to_subtree(root.right, key, value)
            return RIGHT
        end
    end

    def rotate_after_insertion(root, which_subtree)
        opposite_subtree = opposite_subtree(which_subtree)

        begin
            if(root.send(which_subtree).red?)
                if(root.send(opposite_subtree).red?)
                    root.color_red
                    root.left.color_black
                    root.right.color_black
                elsif(root.send(which_subtree).send(which_subtree).red?)
                    root = single_rotation(root, opposite_subtree)
                elsif(root.send(which_subtree).send(opposite_subtree).red?)
                    root = double_rotation(root, opposite_subtree)
                end
            end
        rescue NoMethodError
            # red?, left, right for NilClass
        end

        root
    end

    def on_which_subtree_insert_value(node, key)
        return LEFT if node.key > key
        return RIGHT if node.key < key
    end

    def get_node_subtree(node, subtree_direction)
        node.send(subtree_direction)
    end

    def opposite_subtree(subtree)
        {LEFT => RIGHT, RIGHT => LEFT}[subtree]
    end

    def assigment_method_name(attribute_name)
        "#{attribute_name}="
    end

end
