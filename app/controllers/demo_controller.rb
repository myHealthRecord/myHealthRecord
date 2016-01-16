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
    @result = to_s (@hl7string["demo"]["text"])
    render action: :hl7
  end

  def to_s (text)
    Hl7Parser.new(text).patient_name
  end

  def faxes
  end

  def business_model
  end

end

