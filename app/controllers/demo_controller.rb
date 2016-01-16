class DemoController < ApplicationController
  def index
  end

  def legal
  end

  def user_stories
  end

  def hl7
  end

  def parse
    session[:stuff] = params
    @hl7string = params
    render action: :hl7
  end

  def faxes
  end

  def business_model
  end
end
