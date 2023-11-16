class Atividade < ApplicationRecord
	validates :nome, :data, presence: true
end
