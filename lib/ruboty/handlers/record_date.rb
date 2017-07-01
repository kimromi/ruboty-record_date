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

      on(
        /record delete (?<date>.+) (?<time>.+)/,
        name: 'delete',
        description: 'delete record'
      )

      def record(message)
        action(message).record
      end

      def list(message)
        action(message).list
      end

      def delete(message)
        action(message).delete
      end

      private

      def action(message)
        Ruboty::RecordDate::Actions::RecordDate.new(message)
      end
    end
  end
end
