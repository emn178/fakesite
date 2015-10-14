RSpec.describe TestsController, type: :controller do
  describe "#test" do
    before { 
    	allow(Time).to receive(:now).and_return(Time.at(1441197000))
    	get :test 
    }
    it { expect(response).to redirect_to('/fakesite/test?key=fakesite%3A1441197000&url=http%3A%2F%2Ftest.com%2F%3Fkey1%3Dval1') }
  end

  describe "#google" do
    before { get :google }
    it { expect(response).to redirect_to('http://www.google.com/') }
  end
end
