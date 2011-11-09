task :cron => :environment do
  puts "Fetching new data..."
  Candidate.fetch_data
  puts "done."
end

task :fetch_facebook => :environment do
  puts "Fetching new Facebook Posts..."
  Candidate.fetch_fb_posts
  puts " done."
end

task :fetch_tweets => :environment do
  puts "Fetching new Tweets..."
  Candidate.fetch_tweets
  puts " done."
end

task :fetch_news => :environment do
  puts "Fetching new news articles..."
  Candidate.fetch_articles
  puts " done."
end
