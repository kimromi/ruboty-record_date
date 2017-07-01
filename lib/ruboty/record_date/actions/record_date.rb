require 'time'
require 'securerandom'

module Ruboty
  module RecordDate
    module Actions
      class RecordDate < Ruboty::Actions::Base
        NAMESPACE = 'recode-date'

        def record
          add(body)
          message.reply("Recorded #{today} - #{body}")
        end

        def list
          target = begin
            Date.parse(message[:date].strip).to_s.gsub(/-/, '/')
          rescue ArgumentError
            message.reply("Invalid date `#{message[:date].strip}`")
            return
          end

          if recorded[target]
            message.reply(recorded[target].map{|id, body| "(#{id}) #{body}"})
          else
            message.reply("Not recorded in #{target}")
          end
        end

        private

        def recorded
          message.robot.brain.data[NAMESPACE] ||= {}
        end

        def body
          message.body.gsub(/#{message.match_data}/, '').strip
        end

        def add(body)
          recorded[today] ||= {}
          recorded[today][SecureRandom.hex(3)] = body
        end

        def today
          Date.today.to_s.gsub(/-/, '/')
        end
      end
    end
  end
end
