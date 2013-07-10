module GraphPath
  class Graph
    include Enumerable

    def initialize(*args)
      @edges = []
      @nodes = Hash.new{|h,k| h[k] = [] }

      if args.first.is_a?(Hash)
        args.first.each do |node, dests|
          dests.each do |(dest, cost)|
            add_edge node, dest, (cost || 1)
          end
        end
      else
        args.each do |node|
          @nodes[node] = nil
        end
      end
    end

    def each
      @nodes.each do |node, edges|
        yield node, edges
      end
    end

    def empty?
      @nodes.size == 0
    end

    def any?
      @nodes.size > 0
    end

    def add_edge(from, to, cost)
      edge = Edge.new(from, to, cost)
      @edges << edge
      @nodes[from] << edge
    end

    def each_edges(node)
      edges = @nodes[node]
      if block_given?
        edges.each do |edge|
          yield edge
        end
      else
        edges.each
      end
    end

    def search(start, target, **options)
      searcher = options[:searcher] || GraphPath::Searcher::AStar
      searcher.search(self, start, target)
    end
  end
end
