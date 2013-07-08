module GraphPath
  class Routes
    attr_reader :start, :target

    def initialize(start, target)
      @start, @target = start, target
      @routes = {}
    end

    def [](to)
      @routes[to]
    end

    def []=(to, from)
      @routes[to] = from
    end

    def path
      return @path if @path

      nd = target
      @path = [nd]
      while nd != start
        nd = @routes[nd]
        if nd.nil?
          @found = false
          return @path
        else
          @path.unshift(nd)
        end
      end

      @found = true
      @path
    end

    def found?
      path
      @found
    end
  end
end
