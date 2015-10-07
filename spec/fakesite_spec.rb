RSpec.describe Fakesite do
  describe ".match" do
    subject { Fakesite.match(url) }
    context "with test.com" do
      let(:url) { "http://test.com/" }
      it { should eq :test }
    end

    context "with not test.com" do
      let(:url) { "http://other.com/" }
      it { should eq false }
    end
  end

  describe ".find" do
    context "when found" do
      subject { Fakesite.find(:test) }
      its(:id) { should eq :test }
    end

    context "when not found" do
      subject { Fakesite.find(:not_found) }
      it { should eq nil }
    end
  end
end
