module GraphPath
  class Edge
    attr_accessor :cost

    def initialize(from, to, cost)
      @from, @to, @cost = from, to, cost
    end
  end
end
