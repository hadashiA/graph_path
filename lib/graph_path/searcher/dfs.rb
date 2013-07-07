require 'set'

module GraphPath
  module Searcher
    class Dfs
      def search(graph, target, start)
        edge_stack    = []
        routes        = {}
        visited_nodes = Set.new

        dummy_edge = Edge.new(start, start, 0)
        edge_stack.push(dummy_edge)

        while edge_stack.any?
          edge = edge_stack.pop
          routes[edge.to] = edge.from
          visited << edge.to

          if edge.to == target
            return GraphPath::Result.new(found: true, routes: routes)
          end
        end
      end

      def search_all(graph, start)
      end
    end
  end
end
