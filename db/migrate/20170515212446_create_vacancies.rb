class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.timestamp :expires_at
      t.integer :salary
      t.text :contact_info

      t.timestamps null: false
    end
    add_index :vacancies, :expires_at
    add_index :vacancies, :salary
  end
end
