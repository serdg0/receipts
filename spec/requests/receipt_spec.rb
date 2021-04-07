require 'rails_helper'

RSpec.describe "Receipts", type: :request do
  describe "root" do
    it "redirects to sign_in when a a user haven't log in" do
      get "/"
      expect(response).to redirect_to("/users/sign_in")  
    end
  end
end
