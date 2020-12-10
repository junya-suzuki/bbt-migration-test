task log: :environment do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Rails.logger.level = Logger::DEBUG
end
