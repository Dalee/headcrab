class HeadController < ApplicationController
  def index
    render component: 'HomePage'
  end
end
