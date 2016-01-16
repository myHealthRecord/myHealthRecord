require 'pry'
require 'ruby-hl7'

class Hl7Parser
  attr_reader :raw_text

  def initialize(raw_text)
    @raw_text = raw_text.gsub "\n", "\r"
  end

  def patient_name
    hl7_object["PID"].patient_name.clean
  end

  def hl7_object
    msg = HL7::Message.new
    msg.parse raw_text
    msg
  end

  def service_id
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