RSpec.describe Fakesite::Base do
  subject { Fakesite::Base.new }

  describe "#match" do
    it { expect(subject.match(nil)).to eq false }
  end

  describe "#parameters" do
    it { expect(subject.parameters(nil)).to eq ({}) }
  end

  describe "#redirect_url" do
    context "with return_url" do
      let(:uri) { URI.parse('http://test.com/?return_url=http%3A%2F%2Flocalhost%3A3000%2F') }

      context "with parameters" do
        it { expect(subject.redirect_url(uri, {:key => :val})).to eq 'http://localhost:3000/?key=val' }
      end

      context "without parameters" do
        it { expect(subject.redirect_url(uri, {})).to eq 'http://localhost:3000/' }
      end
    end

    context "without return_url" do
      let(:uri) { URI.parse('http://test.com/') }
      it { expect(subject.redirect_url(uri, {})).to eq '/' }
    end
  end
end
