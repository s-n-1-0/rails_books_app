class HelloController < ApplicationController
  def index
    render json:{hello: "a"}
  end
end
