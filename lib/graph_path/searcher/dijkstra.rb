module GraphPath
  module Searcher
    module Dijkstra
      module_function

      def search(graph, start, target)
        total_costs = Hash.new{|h,k| h[k] = 0 }

        routes = GraphPath::Routes.new(start, target)
        search_frontier_edges = {}

        queue = [start]

        while queue.any?
          node = queue.min{|a,b| total_costs[a] <=> total_costs[b] }
          queue.delete(node)

          edge = search_frontier_edges[node]
          routes[node] = edge.from if edge

          return routes if node == target

          graph.each_edges(node) do |edge|
            new_cost = total_costs[node] + edge.cost
            if search_frontier_edges[edge.to].nil?
              total_costs[edge.to] = new_cost
              queue.push(edge.to)
              search_frontier_edges[edge.to] = edge

            elsif new_cost < total_costs[edge.to] && routes[edge.to].nil?
              total_costs[edge.to] = new_cost
              search_frontier_edges[edge.to] = edge
            end
          end
        end

        routes
      end
    end
  end
end
