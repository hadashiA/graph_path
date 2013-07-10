require File.expand_path('../spec_helper', __FILE__)

include GraphPath

describe Searcher::Dijkstra do
  describe '.search' do
    subject { Searcher::Dijkstra.search(graph, start, target) }

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

    describe 'コストがバラバラな場合' do
      let(:graph) {
        Graph.new(1 => [[5, 2.9], [6, 1.0]],
                  2 => [[3, 3.1]],
                  3 => [[5, 0.8]],
                  4 => [[3, 3.7]],
                  5 => [[2, 1.9], [6, 3.0]],
                  6 => [[4, 1.1]]
                  )
      }

      let(:start) { 1 }
      let(:target){ 3 }

      it { should be_found }

      its(:path) { should eq([1,6,4,3]) }
    end
  end
end
