RSpec.describe OmniAuth::Strategy do
  include OmniAuth::Strategy
  subject { response[1]["Location"] }
  let(:response) { redirect url }

  describe "#redirect" do

    context "when test.com" do
      let(:url) { 'http://test.com/?return_url=http%3A%2F%2Flocalhost%3A3000%2F'} 
      it { should eq '/fakesite/test?url=http%3A%2F%2Ftest.com%2F%3Freturn_url%3Dhttp%253A%252F%252Flocalhost%253A3000%252F' }
    end

    context "when www.google.com" do
      let(:url) { 'http://www.google.com/'} 
      it { should eq 'http://www.google.com/' }
    end
  end
end
