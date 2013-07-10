require File.expand_path('../spec_helper', __FILE__)

include GraphPath

describe Searcher::AStar do
  describe '.search' do
    describe 'ヒューリスティック関数がない場合' do
      subject { Searcher::AStar.search(graph, start, target){|graph, target, node| 1 } }

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
