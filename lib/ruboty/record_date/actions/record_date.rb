require 'time'

module Ruboty
  module RecordDate
    module Actions
      class RecordDate < Ruboty::Actions::Base
        NAMESPACE = 'recode-date'

        def record
          time = add(body)
          message.reply("Recorded! time: #{time} body: #{body}")
        end

        def list
          date = date_string(message[:date])
          message.reply("Invalid date `#{date}`") and return unless date

          if recorded[date]
            message.reply(recorded[date].map{|time, body| "(#{time}) #{body}"})
          else
            message.reply("Not recorded in #{date}")
          end
        end

        def delete
          date = date_string(message[:date])
          message.reply("Invalid date `#{date}`") and return unless date
          message.reply("No record in #{date}") and return unless recorded[date]

          if body = recorded[date][message[:time]]
            recorded[date].delete(message[:time])
            message.reply("#{body} deleted.")
          else
            message.reply("Not exists time `#{message[:time]}`")
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
          time = Time.now.strftime('%T:%3N')
          recorded[today] ||= {}
          recorded[today][time] = body
          time
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
