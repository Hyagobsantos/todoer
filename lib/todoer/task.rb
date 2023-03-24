# frozen_string_literal: true

module Todoer
  class Task
    attr_reader :titulo, :id, :descricao

    def initialize(props = {})
      @titulo = props[:titulo]
    end

    def ==(outra_task)
      return false if self.class != outra_task.class

      id == outra_task.id &&
        titulo == outra_task.titulo &&
        descricao == outra_task.descricao
    end
  end
end
