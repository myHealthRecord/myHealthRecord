class DemoController < ApplicationController
  def index
  end

  def legal
  end

  def user_stories
  end

  def hl7
    if session[:last_ten]
      @last_ten_titles = session[:last_ten].map{|id|
        (HealthRecord.find id).title
      }
    end
  end

  def parse
    @hl7string = params
    @hl7string_text = @hl7string["demo"]["text"]
    session[:hl7string] = @hl7string_text
    @result = to_s @hl7string_text
    @summary = summary @hl7string_text
    render action: :hl7
  end

  def save
    @healthrecord = HealthRecord.create(
      save_params
    )
    flash[:success] = true
    session[:last_ten] = HealthRecord.last(10).map(&:id)
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

  private

    def save_params
      params.require(:demo).permit(:hl7string, :notes, :title)
    end

end

