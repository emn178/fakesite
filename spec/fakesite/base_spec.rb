RSpec.describe Fakesite::Base do
  let(:uri) { URI.parse('http://test.com/?return_url=http%3A%2F%2Flocalhost%3A3000%2F') }
  let(:base) { 
    instance = Fakesite::Base.new 
    instance.external_uri = uri
    instance
  }
  subject { base }

  describe ".match" do
    it { expect(Fakesite::Base.match(uri)).to eq false }
  end

  describe "#parameters" do
    its(:parameters) { should eq ({}) }
  end

  describe "#redirect_url" do
    context "with return_url" do
      context "with parameters" do
        before { subject.params = {:key => :val} }
        its(:redirect_url) { should eq 'http://localhost:3000/?key=val' }
      end

      context "without parameters" do
        its(:redirect_url) { should eq 'http://localhost:3000/' }
      end
    end

    context "without return_url" do
      let(:uri) { URI.parse('http://test.com/') }
      its(:redirect_url) { should eq '/' }
    end
  end
end
