buzzwords = ['Hire Flight Crew', 'Develop Space Vault', 'Train Flight Crew', 'Venus Consultation', 'Satellite Construction', 'Earth Relations']
buzzword_counts = Hash.new({ value: 0 })

SCHEDULER.every '2s' do
  random_buzzword = buzzwords.sample
  buzzword_counts[random_buzzword] = { label: random_buzzword, value: (buzzword_counts[random_buzzword][:value] + 1) % 30 }

  send_event('taskview', { items: buzzword_counts.values })
end

docs = ['VenusPortfolio.docx - Review - Bailey', 'RocketBudget.docx - Signoff - Rath', 'VaultCodes.docx - Signoff - Adam', 'RocketLogs.txt - Signoff - Colin']
docs_counts = Hash.new({ value: 0 })

=begin
SCHEDULER.every '30s' do
  random_doc = docs.sample
  docs_counts[random_doc] = { label: random_doc, value: (docs_counts[random_doc][:value] + 1) % 10 }

  send_event('docreviews', { items: docs_counts.values })
end
=end

docs.each do |x|
  docs_counts[x] = { label: x, value: (docs_counts[x][:value] + 1) % 10 }
  send_event('docreviews', { items: docs_counts.values })
end
