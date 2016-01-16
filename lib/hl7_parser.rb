require 'pry'
require 'ruby-hl7'

class Hl7Parser
  attr_accessor :raw_text

  def initialize(raw_text)
    @raw_text = raw_text.gsub "\n", "\r"
  end


  def patient_name
    hl7_object["PID"].patient_name.gsub("^", " ").strip
  end

  def hl7_object
    msg = HL7::Message.new
    msg.parse raw_text
    msg
  end

  def service_id
    hl7_object["OBR"].universal_service_id.gsub("^", " ").strip
  end

  def find_line(line_type)
    parsed_text.select{|line| line.first == line_type }.first
  end


end
