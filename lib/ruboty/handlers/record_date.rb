require "ruboty/record_date/actions/record_date"

module Ruboty
  module Handlers
    class RecordDate < Base
      on(
        /record-date/,
        name: 'record',
        description: 'record date',
        all: true
      )

      def record(message)
        Ruboty::RecordDate::Actions::RecordDate.new(message).record
      end
    end
  end
end
