taskListMars = ['Hire Flight Crew', 'Develop Space Vault', 'Train Flight Crew', 'Venus Consultation', 'Satellite Construct', 'Earth Relations']
progress = ['64%', '34%', '75%', '90%', '50%', '20%']

task_list = Hash.new

taskListMars.each_with_index do |task, index|
  task_list[task] = { label: task, value: progress[index]}
  send_event('taskview', { items: task_list.values })
end


#-------------
docs = ['VenusPortfolio.docx - Review - Bailey', 'RocketBudget.docx - Signoff - Rath', 'VaultCodes.docx - Signoff - Adam', 'RocketLogs.txt - Signoff - Colin']
dates = ['2015/08/16', '2015/11/13', '2015/12/31', '2015/11/31']

docs_counts = Hash.new

docs.each_with_index do |doc, index|
  docs_counts[doc] = { label: doc, value: dates[index]}
  send_event('docreviews', { items: docs_counts.values })
end
