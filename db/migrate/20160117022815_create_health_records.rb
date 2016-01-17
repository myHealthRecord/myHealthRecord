class CreateHealthRecords < ActiveRecord::Migration
  def change
    create_table :health_records do |t|
      t.string :title
      t.text :notes
      t.text :hl7string
      t.text :fax

      t.timestamps
    end
  end
end
