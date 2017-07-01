require 'time'
require 'securerandom'

module Ruboty
  module RecordDate
    module Actions
      class RecordDate < Ruboty::Actions::Base
        NAMESPACE = 'recode-date'

        def record
          id = add(body)
          message.reply("Recorded! id: #{id} body: #{body}")
        end

        def list
          date = date_string(message[:date])
          message.reply("Invalid date `#{date}`") and return unless date

          if recorded[date]
            message.reply(recorded[date].map{|id, body| "(#{id}) #{body}"})
          else
            message.reply("Not recorded in #{target}")
          end
        end

        def delete
          date = date_string(message[:date])
          message.reply("Invalid date `#{date}`") and return unless date
          message.reply("No record in #{date}") and return unless recorded[date]

          if recorded[date].delete(message[:id])
            message.reply("#{message[:id]} deleted.")
          else
            message.reply("Not exists id `#{message[:id]}`")
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
          id = SecureRandom.hex(3)
          recorded[today] ||= {}
          recorded[today][id] = body
          id
        end

        def today
          date_string(Date.today.to_s)
        end

        def date_string(date)
          Date.parse(date).to_s.gsub(/-/, '/') rescue false
        end
      end
    end
  end
end
