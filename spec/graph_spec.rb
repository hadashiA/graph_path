require File.expand_path('../spec_helper', __FILE__)

include GraphPath

describe Graph do
  describe '#initialize' do
    describe 'no edges' do
      subject { Graph.new(1, 2, 3) }

      it { should have(3).items }
    end

    describe 'empty nodes' do
      subject { Graph.new }

      it { should be_empty }
    end

    describe 'many edges and nodes' do
      subject {
        Graph.new(1 => [2, 3],
                  2 => [1, 5],
                  3 => [1, 4],
                  4 => [5, 6],
                  5 => [2, 6],
                  6 => [4, 5])
      }

      it { should have(6).items }
    end

    describe 'many edges and nodes' do
      subject {
        graph = Graph.new(1 => [2, 3])
        graph.each_edges(1)
      }

      it { should have(2).items }
    end
  end
end
