class CreateAtividades < ActiveRecord::Migration[7.1]
  def change
    create_table :atividades do |t|
      t.string :nome
      t.date :data
      t.time :hora_inicio
      t.time :hora_final
      t.string :status

      t.timestamps
    end
  end
end
