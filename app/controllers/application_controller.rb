class ApplicationController < ActionController::API
  include Rails::Pagination
  include ::ActionController::Serialization
  respond_to :json
end
