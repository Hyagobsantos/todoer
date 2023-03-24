require "net/http"
require "json"

module Todoer
  class Client
    def show(id)
      hash = request "/tasks/#{id}"
      task_from hash
    end

    def list
      list = request "/tasks"
      list.map { |h| task_from h }
    end

    private
    def request(path)
      uri = URI(Todoer.configuration.todos_host) + path
      headers = { Accept: "application/json"}
      response = Net::HTTP.get_response(uri, headers)
      JSON.parse(response.body)
    end

    def task_from(hash)
      Task.new(hash.transform_keys { |k| k.to_sym })
    end
  end
end