task :cron => :environment do
  puts "Fetching new data..."
  Candidate.fetch_data
  puts "done."
end
