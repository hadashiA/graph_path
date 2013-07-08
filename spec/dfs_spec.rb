require File.expand_path('../spec_helper', __FILE__)

include GraphPath

describe Searcher::Dfs do
  describe '.search' do
    subject { Searcher::Dfs.search(graph, start, target) }

    describe '経路がある場合' do
      let(:graph) {
        Graph.new(1 => [2, 3],
                  2 => [1, 5],
                  3 => [1, 4],
                  4 => [5, 6],
                  5 => [2, 6],
                  6 => [4, 5])
      }

      let(:start)  { 5 }
      let(:target) { 1 }

      it { should be_found }

      its(:path) { should eq([5, 2, 1]) }
    end
  end
end
