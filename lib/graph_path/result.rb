module GraphPath
  class Result
    attr_accessor :found, :routes, :paths

    def initialize(found: nil, routes: {}, paths: [])
      @found, @routes, @paths = found, routes, paths
    end

    def found?
      @found
    end
  end
end
