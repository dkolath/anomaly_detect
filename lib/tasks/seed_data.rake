require 'elasticsearch'
require 'base64'
require 'csv'

namespace :seed_data do
  desc "Seed initial Data for ES"
  task :pop_es => :environment do
    token = Base64.encode64("elastic:espwd")
    client = Elasticsearch::Client.new(hosts: ['35.192.119.241:9200'], log: true, transport_options: {headers: {Authorization: "Basic #{token}"}})

    CSV.foreach("data/transaction_data.csv") do |row|
      payload = {date: Time.parse(row[0]).to_i, user_id: row[1], lat: row[2], long: row[3], amt: row[4]}
      response = client.index index: 'user_transactions', type: '_doc', body:  payload
      puts response
    end
  end
end