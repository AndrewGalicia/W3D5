

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

end
