RSpec.describe Archer::SuggestedArticles do
  subject { Archer::SuggestedArticles.new(scenario).run }

  context "#first_scenario" do
    let(:scenario) { load_fixture("first_scenario.json") }

    it "returns homogenous list of token recommendations" do
      expect(subject).to eq([345048])
    end
  end

  context "#second_scenario" do
    let(:scenario) { load_fixture("second_scenario.json") }

    it "returns homogenous list of token recommendations" do
      expect(subject).to eq([790952, 103678, 788138, 802358])
    end
  end

  context "#third_scenario" do
    let(:scenario) { load_fixture("third_scenario.json") }

    it "returns homogenous list of token recommendations" do
      expect(subject).to eq([103678, 790952, 802358, 788138])
    end
  end

  context "#fourth_scenario" do
    let(:scenario) { load_fixture("fourth_scenario.json") }

    it "returns homogenous list of token recommendations" do
      expect(subject).to eq([790952, 103678, 802358, 562873])
    end
  end
end
