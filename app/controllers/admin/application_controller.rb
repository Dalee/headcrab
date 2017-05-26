module Admin
  class ApplicationController < ::ApplicationController
    layout 'admin'

    http_basic_authenticate_with name: 'app', password: 'error'
  end
end
