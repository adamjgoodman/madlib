class CreateMadlibs < ActiveRecord::Migration[6.1]
  def change
    create_table :madlibs do |t|
      t.jsonb :fields, default: {}
      t.text :text
      t.timestamps
    end
  end
end
