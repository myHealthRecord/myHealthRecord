require 'pry'
require 'ruby-hl7'

class Hl7Parser
  attr_reader :raw_text

  def initialize(raw_text)
    @raw_text = raw_text
                  .gsub("\n", "\r")
                  .gsub("\r\r", "\r")
    validate
  end

  def validate
    hl7_object
  end

  def patient_name
    return if @error
    begin
      hl7_object["PID"].patient_name.clean
    rescue
      hl7_object["PID"].first.patient_name.clean
    end
  end

  def hl7_object
    begin
      msg = HL7::Message.new
      msg.parse raw_text
      return msg unless raw_text.nil?
      @error = "Error"
    rescue NoMethodError 
      @error = "Error"
    rescue
      @error = "Error"
    end
  end

  def service_id
    return if @error
    hl7_object["OBR"].universal_service_id.clean
  end

  def find_line(line_type)
    parsed_text.select{|line| line.first == line_type }.first
  end
end

class String
  def clean
    self.gsub("^", " ").strip
  end
end

class NilClass
  def + arg
    "" + arg
  end
  def to_s
    ""
  end
  def to_str
    ""
  end
end

