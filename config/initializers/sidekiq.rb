Sidekiq.configure_server do |config|
  config.redis = { url: URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379/0" ).to_s }
  schedule_file = "config/schedule.yml"
  if File.exists?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url:  URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379/0" ).to_s }
end