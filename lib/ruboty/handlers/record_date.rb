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

      on(
        /recorded (?<date>.+)/,
        name: 'list',
        description: 'get recorded'
      )

      def record(message)
        Ruboty::RecordDate::Actions::RecordDate.new(message).record
      end

      def list(message)
        Ruboty::RecordDate::Actions::RecordDate.new(message).list
      end
    end
  end
end
