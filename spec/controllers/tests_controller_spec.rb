RSpec.describe TestsController, type: :controller do
	describe "#test" do
  	before { get :test }
    it { expect(response).to redirect_to('/fakesite/test?url=http%3A%2F%2Ftest.com%2F%3Fkey1%3Dval1') }
  end

	describe "#google" do
  	before { get :google }
    it { expect(response).to redirect_to('http://www.google.com/') }
  end
end
