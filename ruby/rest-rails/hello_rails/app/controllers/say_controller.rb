class SayController < ApplicationController
  def hello
    @hello = Hello.new
    if params[:user]
      render :json => @hello.to_json(params[:user])
    else
      render :json => @hello.to_json("Rails")
    end
  end
end
