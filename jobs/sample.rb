current_valuation = 0
current_karma = 0

send_event('task1',   { value: 75 })
send_event('task2',   { value: 33 })

SCHEDULER.every '2s' do
  last_karma     = current_karma
  current_karma     = rand(200000)

  send_event('karma', { current: current_karma, last: last_karma })
end
