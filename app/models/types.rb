require 'dry-types'

module Types
  include Dry.Types()

  Priority = String.enum('low', 'medium', 'high', 'urgent')
  Status = String.enum('pending', 'in_progress', 'completed')
  Email = String.constrained(format: URI::MailTo::EMAIL_REGEXP)
end

