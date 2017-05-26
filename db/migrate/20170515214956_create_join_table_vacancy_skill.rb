class CreateJoinTableVacancySkill < ActiveRecord::Migration
  def change
    create_join_table :vacancies, :skills do |t|
      t.foreign_key :vacancies, on_delete: :cascade
      t.foreign_key :skills, on_delete: :cascade
      t.index %i[skill_id vacancy_id], unique: true
    end
  end
end
