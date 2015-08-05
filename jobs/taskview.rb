buzzwords = ['Hire Flight Crew', 'Develop Space Vault', 'Train Flight Crew', 'Venus Consultation', 'Satellite Construct', 'Earth Relations']
dates = ['64%', '34%', '75%', '90%', '50%', '20%']

=begin
buzzword_counts = Hash.new({ value: 0 })

SCHEDULER.every '2s' do
  random_buzzword = buzzwords.sample
  buzzword_counts[random_buzzword] = { label: random_buzzword, value: (buzzword_counts[random_buzzword][:value] + 1) % 30 }

  send_event('taskview', { items: buzzword_counts.values })
end
=end
buzzword_counts = Hash.new

buzzwords.each_with_index do |y, j|
  buzzword_counts[y] = { label: y, value: dates[j]}
  send_event('taskview', { items: buzzword_counts.values })
end


#-------------
docs = ['VenusPortfolio.docx - Review - Bailey', 'RocketBudget.docx - Signoff - Rath', 'VaultCodes.docx - Signoff - Adam', 'RocketLogs.txt - Signoff - Colin']
dates = ['2015/08/16', '2015/11/13', '2015/12/31', '2015/11/31']

docs_counts = Hash.new

docs.each_with_index do |x, i|
  #docs_counts[x] = { label: x, value: (docs_counts[x][:value] + 1) % 10 }
  docs_counts[x] = { label: x, value: dates[i]}
  send_event('docreviews', { items: docs_counts.values })
end
