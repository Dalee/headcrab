class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :name
      t.text :contact_info
      t.boolean :job_search_status
      t.integer :expected_salary

      t.timestamps null: false
    end
    add_index :resumes, :expected_salary
  end
end
