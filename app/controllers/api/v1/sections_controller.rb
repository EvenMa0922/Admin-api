module Api::V1
  class SectionsController < ApplicationController
    def show
      @sections = Api::V1::Section.find(params[:id])
      unless @sections.present?
        return render body: nil, status: 404
      end
      render json: @sections
    end
  end
end