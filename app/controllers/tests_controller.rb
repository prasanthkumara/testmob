class TestsController < ApplicationController
  def show
    @test = current_user.tests.find(params[:id]) || Test.new
  end

  def new
    @test = Test.new
    render 'show'
  end

  def index
    @tests = current_user.tests
  end

  def create
    @test = current_user.tests.create test_params
    TestRunner.perform_later(@test.id)
  end

  def update
    @test = current_user.tests.find(params[:id])
    @test.update test_params
    TestRunner.perform_later(@test.id)
  end

  protected

  def test_params
    params.require(:test).permit(:code, :spec)
  end
end