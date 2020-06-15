class HomeController < ApplicationController
  def show
    @test = Test.where(id: params[:test_id]).first || Test.new
    render 'show'
  end
end