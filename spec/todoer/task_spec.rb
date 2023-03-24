# frozen_string_literal: true

RSpec.describe Todoer::Task do
  it "armazena o titulo na inicialização" do
    task = Todoer::Task.new(titulo: "Lavar louças")
    expect(task.titulo).to eq "Lavar louças"
  end

  it "garante que tasks com o mesmo conteudo são equivalentes" do
    task = Todoer::Task.new(
      id: 1,
      titulo: "Lavar louças",
      descricao: "Porque precisa"
    )

    expect(task).to eq Todoer::Task.new(
      id: 1,
      titulo: "Lavar louças",
      descricao: "Porque precisa"
    )

    expect(task).to_not eq Todoer::Task.new(
      id: 1,
      titulo: "Lavar roupas",
      descricao: "Porque só sobraram as brancas"
    )
  end
end