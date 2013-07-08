require 'set'

module GraphPath
  module Searcher
    module Bfs
      module_function

      def search(graph, start, target)
        edge_queue    = []
        routes        = GraphPath::Routes.new(start, target)
        visited_nodes = Set.new

        dummy_edge = Edge.new(start, start, 0)
        edge_queue.push(dummy_edge)

        while edge_queue.any?
          current_edge = edge_queue.shift
          to = current_edge.to
          routes[to] = current_edge.from
          visited_nodes << to

          return routes if to == target

          graph.each_edges(to) do |edge|
            edge_queue.push(edge) unless visited_nodes.include?(edge.to)
          end
        end

        routes
      end
    end
  end
end
