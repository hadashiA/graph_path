require 'set'

module GraphPath
  module Searcher
    module Dfs
      module_function

      def search(graph, start, target)
        edge_stack    = []
        routes        = GraphPath::Routes.new(start, target)
        visited_nodes = Set.new

        dummy_edge = Edge.new(start, start, 0)
        edge_stack.push(dummy_edge)

        while edge_stack.any?
          current_edge = edge_stack.pop
          to = current_edge.to
          routes[to] = current_edge.from
          visited_nodes << to

          return routes if to == target

          graph.each_edges(to) do |edge|
            edge_stack.push(edge) unless visited_nodes.include?(edge.to)
          end
        end

        routes
      end
    end
  end
end
