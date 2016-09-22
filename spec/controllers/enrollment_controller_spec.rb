require 'rails_helper'

RSpec.describe EnrollmentController, type: :controller do

  describe "GET #assign_owner_role" do
    it "returns http success" do
      get :assign_owner_role
      expect(response).to have_http_status(:success)
    end
  end

end
