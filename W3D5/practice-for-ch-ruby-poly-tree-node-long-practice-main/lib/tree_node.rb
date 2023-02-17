

class PolyTreeNode

    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []

    end

    def parent=(new_parent)
        if @parent
          @parent.children.delete(self)
        end

        @parent = new_parent

        if @parent != nil
            new_parent.children.push(self)
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "not a child" if !children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
      return self if self.value == target_value

      self.children.each do |child|
        result = child.dfs(target_value)
        return result unless result.nil?
      end
      nil
    end

    def bfs(target_value)
      
    end

end
