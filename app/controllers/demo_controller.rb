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
    @summary = summary (@hl7string["demo"]["text"])
    render action: :hl7
  end

  def summary hl7string
    Hl7Parser.new(hl7string)
  end

  def to_s (text)
    summary(text).patient_name + " | " + summary(text).service_id
  end

  def faxes
  end

  def business_model
  end

end

