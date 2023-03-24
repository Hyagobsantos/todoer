RSpec.describe Todoer::Client do
  subject(:client) { Todoer::Client.new }

  describe "#show" do
    it "busca Task por id" do
      VCR.use_cassette("task_01") do
        task = client.show(1)
        expect(task).to eq Todoer::Task.new(
          id: 1,
          titulo: "Limpar a Casas",
          descricao: "dentro do horario"
        )
      end
    end
  end

  describe "#list" do
    it "lista todas as Tasks" do
      VCR.use_cassette("task_list") do
        list = client.list
        expect(list).to eq [
          Todoer::Task.new(
            id: 1,
            titulo: "Limpar a Casas",
            descricao: "dentro do horario"
          ),
          Todoer::Task.new(
            id: 2,
            titulo: "limpar a mesa",
            descricao: "hoje ou semana que vem"
          )
        ]
      end
    end
  end
end