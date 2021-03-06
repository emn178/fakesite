RSpec.describe Fakesite::FakesitesController, type: :controller do
  before(:each) { @routes = Fakesite::Engine.routes }
  subject { response }
  let(:user) { 
    User.create! :email => "emn178@gmail.com", :password => "1234qwer" if User.all.size == 0 
    User.first
  }

  describe "#show" do
    before { allow(Time).to receive(:now).and_return(Time.at(1441197000)) }

    context "with user" do
      before { 
        sign_in user
        get :show, :id => :test, :url => 'http://test.com/?key1=val1&return_url=http%3A%2F%2Flocalhost%3A3000%2F' 
      }
      it { should have_http_status(:ok) }
      it { expect(assigns(:id)).to eq("test") }
      it { expect(assigns(:fakesite).parameters).to eq({:test_key1 => :value1, :test_key2 => :value2}) }
      it { expect(assigns(:fakesite).user).not_to eq(nil) }
    end

    context "without user" do
      before { get :show, :id => :test, :url => 'http://test.com/?key1=val1&return_url=http%3A%2F%2Flocalhost%3A3000%2F' }
      it { should have_http_status(:ok) }
      it { expect(assigns(:fakesite).user).to eq(nil) }
    end
  end

  describe "#redirect" do
    before {
      sign_in user
      get :show, :id => :test, :url => 'http://test.com/?key1=val1&return_url=http%3A%2F%2Flocalhost%3A3000%2F'
      serialization = assigns(:fakesite).serialize
      post :redirect, :id => :test, :url => 'http://test.com/?key1=val1&return_url=http%3A%2F%2Flocalhost%3A3000%2F', :p => {:test_key1 => 'value1'}, :serialization => serialization
    }
    it { expect(response).to redirect_to('http://localhost:3000/?return=1&test_key1=value1') }
    it { expect(assigns(:fakesite).user).not_to eq(nil) }
  end
end
