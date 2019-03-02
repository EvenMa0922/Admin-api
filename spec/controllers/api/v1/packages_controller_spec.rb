describe Api::V1::PackagesController do
  before do
    @package = FactoryGirl.create(:api_v1_package)
  end

  describe 'index' do
    context 'When user want to list all packages' do
      it 'Returns all packages' do
        get :index

        resp = JSON.parse(response.body)

        expect(resp.first['name']).to eq @package.name
        expect(resp.first['exam_level']).to eq @package.exam_level
        expect(resp.first['visible']).to eq @package.visible
        expect(resp.first['slug']).to eq @package.slug
        expect(resp.first['image_url']).to eq 'AWS_CDN_' + @package.slug + '.jpg'
      end
    end
  end

  describe 'create' do
    context 'When name is empty' do
      it 'Returns empty body and 400 HTTP status' do
        post :create, :params => {
            name: '',
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
        expect(response.headers['Location']).to be_nil
      end
    end

    context 'When there is no name' do
      it 'Returns empty body and 400 HTTP status' do
        post :create, :params => {
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
        expect(response.headers['Location']).to be_nil
      end
    end

    context 'When the visible is not true or false' do
      it 'Returns empty body and 400 HTTP status' do
        post :create, :params => {
            name: 'Abe',
            description: 'Hello world',
            visible: 'T',
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
        expect(response.headers['Location']).to be_nil
      end
    end

    context 'When exam_level is empty' do
      it 'Returns empty body and 400 HTTP status' do
        post :create, :params => {
            name: 'Test',
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: ''
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
        expect(response.headers['Location']).to be_nil
      end
    end

    context 'When there is no exam level' do
      it 'Returns empty body and 400 HTTP status' do
        post :create, :params => {
            name: 'Test',
            description: 'Hello world',
            visible: false,
            position: 6
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
        expect(response.headers['Location']).to be_nil
      end
    end

    context 'When the exam level is not "step-1" nor "step-2"' do
      it 'Returns empty body and 400 HTTP status' do
        post :create, :params => {
            name: 'Test',
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-3'
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
        expect(response.headers['Location']).to be_nil
      end
    end

    context 'When the position exists but it is not an integer ' do
      it 'Returns empty body and 400 HTTP status' do
        post :create, :params => {
            name: 'Test',
            description: 'Hello world',
            visible: false,
            position: 6.1,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
        expect(response.headers['Location']).to be_nil
      end
    end

    context 'When the position exists and it is an integer, but it is smaller that 0' do
      it 'Returns empty body and 400 HTTP status' do
        post :create, :params => {
            name: 'Test',
            description: 'Hello world',
            visible: false,
            position: -2,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
        expect(response.headers['Location']).to be_nil
      end
    end

    context 'When new package is created correctly' do
      it 'Returns empty body and 201 HTTP status' do
        post :create, params: {
            name: '4455',
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 201
        expect(response.body).to be_blank
        expect(response.headers['Location'].length).to be > 0
      end
    end

    context 'When new package is created correctly' do
      it 'Returns empty body and 201 HTTP status' do
        post :create, params: {
            name: '7788',
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 201
        expect(response.body).to be_blank
        expect(response.headers['Location'].length).to be > 0
      end
    end

    context 'When new package is created correctly but fail to return result' do
      it 'Returns empty body and 409 HTTP status' do
        allow(Api::V1::Package).to receive(:create).and_return(false)

        post :create, params: {
            name: 'abe',
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 409
        expect(response.body).to be_blank
        expect(response.headers['Location']).to be_nil
      end
    end
  end

  describe 'update' do
    context 'When package is found and update successfully but attribute name is missing' do
      it 'Returns empty body and 204 HTTP status' do
        put :update, params: {
            id: @package.id,
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 204
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and update successfully but attribute description is missing' do
      it 'Returns empty body and 204 HTTP status' do
        put :update, params: {
            id: @package.id,
            name: 'Test',
            visible: false,
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 204
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and update successfully but attribute visible is missing' do
      it 'Returns empty body and 204 HTTP status' do
        put :update, params: {
            id: @package.id,
            name: 'Test',
            description: 'Hello world',
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 204
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and update successfully but attribute visible is not true or false' do
      it 'Returns empty body and 400 HTTP status' do
        put :update, params: {
            id: @package.id,
            name: 'Test',
            description: 'Hello world',
            visible: 'Ture',
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and update successfully but attribute position is missing' do
      it 'Returns empty body and 204 HTTP status' do
        put :update, params: {
            id: @package.id,
            name: 'Test',
            description: 'Hello world',
            visible: false,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 204
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and update successfully but attribute position is not integer' do
      it 'Returns empty body and 400 HTTP status' do
        put :update, params: {
            id: @package.id,
            name: 'Test',
            description: 'Hello world',
            position: 1.01,
            visible: false,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and update successfully but attribute position is not positive' do
      it 'Returns empty body and 400 HTTP status' do
        put :update, params: {
            id: @package.id,
            name: 'Test',
            description: 'Hello world',
            visible: false,
            position: -2,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and update successfully but attribute exam level is missing' do
      it 'Returns empty body and 204 HTTP status' do
        put :update, params: {
            id: @package.id,
            name: 'Test',
            description: 'Hello world',
            visible: false,
            position: 6
        }, as: :json

        expect(response.status).to eq 204
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and update successfully but attribute exam level is not "step-1" or "step-2" ' do
      it 'Returns empty body and 400 HTTP status' do
        put :update, params: {
            id: @package.id,
            name: 'Test',
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-3'
        }, as: :json

        expect(response.status).to eq 400
        expect(response.body).to be_blank
      end
    end

    context 'When package is not found' do
      it 'Returns empty body and 404 HTTP status' do
        put :update, params: {
            id: '123',
            name: 'Abe',
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 404
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and update successfully' do
      it 'Returns empty body and 204 HTTP status' do
        put :update, params: {
            id: @package.id,
            name: 'Abe',
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 204
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and update successfully but something goes wrong' do
      it 'Returns empty body and 409 HTTP status' do
        allow_any_instance_of(Api::V1::Package).to receive(:update).and_return(false)

        put :update, params: {
            id: @package.id,
            name: 'Abe',
            description: 'Hello world',
            visible: false,
            position: 6,
            exam_level: 'step-2'
        }, as: :json

        expect(response.status).to eq 409
        expect(response.body).to be_blank
      end
    end
  end


  describe 'destroy' do
    context 'When package is not found' do
      it 'Returns empty boday and 404 HTTP status' do
        delete :destroy, params: {id: 'ff9297fd-faf3-48f4-972b-8dbbc08908cd1'}, as: :json

        expect(response.status).to eq 404
        expect(response.body).to be_blank
      end
    end

    context 'When package is found but an error occur while deleting' do
      it 'Returns empty body and 409 HTTP status' do
        allow_any_instance_of(Api::V1::Package).to receive(:destroy).and_return(false)

        delete :destroy, params: {id: @package.id}, as: :json

        expect(response.status).to eq 409
        expect(response.body).to be_blank
      end
    end

    context 'When package is found and deleted successfully' do
      it 'Returns empty boday and 204 HTTP status' do
        delete :destroy, params: {id: @package.id}, as: :json

        expect(response.status).to eq 204
        expect(response.body).to be_blank
      end
    end
  end
end