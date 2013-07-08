module GraphPath
  class Edge
    attr_accessor :from, :to, :cost

    def initialize(from, to, cost = 1)
      @from, @to, @cost = from, to, cost
    end
  end
end
