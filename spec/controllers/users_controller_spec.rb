require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    
    before(:each) do 
      user = FactoryBot.create(:user)
    end
    
    
    context "with valid params" do 
      it "should create a user and redirect to sign in page" do 
        post :create, params: { user: { username: 'bob', password: 'password' }}
        expect(User.last.username).to eq('bob')
        expect(response).to redirect_to(new_session_url)
      end 
    end
    
    context "with invalid params" do 
      it "should not create a user and render new page" do
        post :create, params: { user: { username: 'bob', password: 'passw' }} 
        expect(flash[:errors]).to be_present
        expect(response).to render_template(:new)
        expect(User.last.username).not_to eq('bob')
      end 

    end  
  end
end
