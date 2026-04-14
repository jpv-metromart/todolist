# require 'dry-types'

# Global module Types with all custom types. No need to use Dry.Types everywhere else,
#   Which forces consistent type definitions across the app.
# Doesn't apply to foldered namespaces like task/task_input.rb, 
#   which needs to use Types::TaskInput for clarity
module Types
  include Dry.Types()

  Priority = String.enum('low', 'medium', 'high', 'urgent')
  Status = String.enum('pending', 'in_progress', 'completed')
  Email = String.constrained(format: URI::MailTo::EMAIL_REGEXP)
end

