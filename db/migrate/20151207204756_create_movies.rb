class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synopsis
      t.date :release_date
      t.string :trailer_url

      t.timestamps null: false
    end
  end
end
