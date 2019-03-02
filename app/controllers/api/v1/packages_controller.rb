module Api::V1
  # This is package api.
  class PackagesController < ApplicationController
    def index
      packages = Api::V1::Package.all
      return render body: nil, status: 204 if packages.empty?
      render json: packages
    end

    def create
      package = Api::V1::Package

      return render body: nil, status: 400 if
          package.params_check_create(params[:name],
                                      params[:visible],
                                      params[:position],
                                      params[:exam_level])

      package.update_position_create(params[:position],
                                     params[:exam_level],
                                     params[:name])

      result = package.create_my(params[:name],
                                 params[:exam_level],
                                 params[:description],
                                 params[:visible],
                                 params[:position])
      if result
        render body: nil, location: api_v1_package_url(result.id), status: 201
      else
        render body: nil, status: 409
      end
    end

    def update
      package = Api::V1::Package

      return render body: nil, status: 404 unless package.exists?(id: params[:id])
      return render body: nil, status: 400 if
          package.params_check_update(params[:exam_level],
                                      params[:visible],
                                      params[:position])

      package.update_position_update(params[:position],
                                     params[:exam_level],
                                     params[:id])

      result = package.update_my(params[:name],
                                 params[:exam_level],
                                 params[:description],
                                 params[:visible],
                                 params[:position],
                                 params[:id])
      if result
        render body: nil, status: 204
      else
        render body: nil, status: 409
      end
    end

    def destroy
      package = Api::V1::Package

      return render body: nil?, status: 404 unless
          package.exists?(id: params[:id])
      result = package.find(params[:id]).destroy
      if result
        render body: nil, status: 204
      else
        render body: nil, status: 409
      end
    end
  end
end