API_URL = 'https://reqres.in'.freeze
API_PATHS = [
  '/api/unknown',
  '/api/products'
].freeze

def request_api(path, params = {})
  @connection ||= Faraday.new(API_URL, { headers: { 'Content-Type' => 'application/json' } }) do |conn|
    conn.adapter Faraday.default_adapter
  end

  response = @connection.send(:get, path) do |req|
    req.params = params
  end

  raise 'API is not responding.' unless response.success?

  JSON.parse(response.body)
end

namespace :import do
  task :products do |_task, _args|
    API_PATHS.each do |path|
      next_page = true
      page = 1

      while next_page
        response = request_api(path, { page: page, per_page: 100 })

        if response['total_pages'] <= page
          next_page = false
        else
          page += 1
        end
        products = []

        response['data'].each do |record|
          products << Product.new(
            id: record['id'],
            name: record['name'],
            year: record['year'],
            color: record['color'],
            pantone_value: record['pantone_value']
          )
        end
        Product.import(products, on_duplicate_key_ignore: true)
      end
    end
  end
end
