 require 'rails_helper'

RSpec.describe '/users', type: :request do
  
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: Faker::Name.name,
      email: Faker::Internet.unique.email,
      title: Faker::Name.prefix,
      phone: Faker::PhoneNumber.cell_phone,
      status: %w[active inactive].sample
    }
  end

  let(:invalid_attributes) do
    {
      name: 'John Doe',
      email: 24
    }
  end
 
  describe 'GET /index' do
    it 'renders a successful response' do
      User.create! valid_attributes
      get users_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      user = User.create! valid_attributes
      get edit_user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect {
          post users_url, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it 'redirects to the created user' do
        post users_url, params: { user: valid_attributes }
        expect(response).to redirect_to user_url(User.last)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect {
          post users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: Faker::Name.name,
          email: Faker::Internet.unique.email,
          title: Faker::Name.prefix,
          phone: Faker::PhoneNumber.cell_phone,
          status: %w[active inactive].sample
        }
      end

      it 'updates the requested user' do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(user_url(user))
      end

      it 'redirects to the user' do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(user_url(user))
      end
    end

    context 'with invalid parameters' do
      it 'returns error status code' do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect {
        get remove_user_url(user)
      }.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      user = User.create! valid_attributes
      get remove_user_url(user)
      expect(response).to redirect_to(users_url)
    end
  end
end
