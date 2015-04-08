class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :teache
      t.text :place
      t.text :time
      t.text :credit

      t.timestamps null: false
    end
  end
end
