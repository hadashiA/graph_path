module GraphPath
  module Searcher
    module AStar
      module_function

      def search(graph, start, target, &block)
        g_costs = Hash.new{|h,k| h[k] = 0 }
        f_costs = Hash.new{|h,k| h[k] = 0 }

        routes = GraphPath::Routes.new(start, target)
        search_frontier_edges = {}

        queue = [start]

        while queue.any?
          node = queue.min{|a,b| f_costs[a] <=> f_costs[b] }
          queue.delete(node)

          edge = search_frontier_edges[node]
          routes[node] = edge.from if edge

          return routes if node == target

          graph.each_edges(node) do |edge|
            h_cost = block_given? ? block.call(target, edge.to) : 1
            g_cost = g_costs[node] + edge.cost

            if search_frontier_edges[edge.to].nil?
              f_costs[edge.to] = g_cost + h_cost
              g_costs[edge.to] = g_cost

              queue.push(edge.to)
              search_frontier_edges[edge.to] = edge

            elsif g_cost < g_costs[edge.to] && routes[edge.to].nil?
              f_costs[edge.to] = g_cost + h_cost
              g_costs[edge.to] = g_cost
              search_frontier_edges[node.to] = edge
            end
          end
        end

        routes
      end
    end
  end
end
