class TransactionsController < ApplicationController

  def suspicious
    render  json: {transactions: [{user_id: 2424, city: 'Los Angeles', state: 'CA', description: 'Starbucks Coffee', amt: 6.77, ts: Time.now},{user_id: 2424, city: 'Los Angeles', state: 'CA', description: 'Best Buy', amt: 623.77, ts: Time.now}]}
  end
end