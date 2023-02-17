

class PolyTreeNode

    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    
    end

    def parent=(new_parent)
        @parent = new_parent
        if !new_parent.children.include?(self)
            new_parent.children.push(self)
        end
    end
  
end