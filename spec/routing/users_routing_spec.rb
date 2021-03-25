require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    let(:p) { '/users' }
    let(:c) { 'users#'}

    it 'routes to #index' do
      expect(get: p).to route_to("#{c}index")
    end

    it 'routes to #new' do
      expect(get: "#{p}/new").to route_to("#{c}new")
    end

    it 'routes to #show' do
      expect(get: "#{p}/1").to route_to("#{c}show", id: '1')
    end

    it 'routes to #edit' do
      expect(get: "#{p}/1/edit").to route_to("#{c}edit", id: '1')
    end

    it 'routes to #create' do
      expect(post: p).to route_to("#{c}create")
    end

    it 'routes to #update via PUT' do
      expect(put: "#{p}/1").to route_to("#{c}update", id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: "#{p}/1").to route_to("#{c}update", id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: "#{p}/1").to route_to("#{c}destroy", id: '1')
    end
  end
end
