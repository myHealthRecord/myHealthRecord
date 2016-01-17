require_relative '../lib/hl7_parser'

RSpec.describe Hl7Parser do
  it 'is a class' do
    expect(Hl7Parser).to be_a Class
  end

  subject { Hl7Parser.new(sample_text) }

  let(:sample_text) { 
'MSH|^~\&|EPIC|EPICCARE|EXTERNAL APP|EXTERNAL FAC|200602021420|319|MDM^T02|42|P|2.3.1||
EVN|T02|200602021420|||LSKOTT^SCOTT^LINDSIE
PID|1||117513^^^EPICCARE^HRN||JONES^EMILY^ANNE^^^||19700428|F||HISP/LAT|120 SUMMER ST^^MADISON^WI^53700^USA||(608)222-2222|(608)777-7777|ENGLISH|SINGLE|BAPTIST|17872|777-77-8888|1212111250107 WI^WI|||GREEN BAY, WI|||||||N
PV1|1|O|MODEL SYSTEM||||LSKOTT^SKOTT^LINDSIE||||||||||||17872
TXA|1|OV|TX|200602021420|LSKOTT^SKOTT^LINDSIE|200602021420|||
LSKOTT^SKOTT^LINDSIE |||^^EPICOV17872|^^||||AU||AV|||
LSKOTT^SKOTT^LINDSIE ^^^^^^PRN^^^^^^200602021420|
OBX|1|TX|85502^ODI Visit Rich Report|1|{\E\rtf1\E\sste1...||||||F|
OBR|1|||80061^LIPID PROFILE^CPT-4||20070911||||||||||'
}

  describe '#name' do
    subject { super().patient_name }
    it 'should return the patient_s name' do
      expect(subject).to eq "JONES EMILY ANNE"
    end
  end

  describe '#service_id' do
    subject { super().service_id }
    it {should eq "80061 LIPID PROFILE CPT-4"}
  end

end
