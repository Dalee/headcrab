class CreateJoinTableResumeSkill < ActiveRecord::Migration
  def change
    create_join_table :resumes, :skills do |t|
      t.foreign_key :resumes, on_delete: :cascade
      t.foreign_key :skills, on_delete: :cascade
      t.index %i[skill_id resume_id], unique: true
    end
  end
end
