class HealthRecordController < ApplicationController
  def last_ten
    @last_ten_records = HealthRecord.last(10).map(&:title)
    respond_to do |format|
      format.json {render json: @last_ten_records}
    end
  end
end
