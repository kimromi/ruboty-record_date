module Ruboty
  module RecordDate
    module Actions
      class RecordDate < Ruboty::Actions::Base
        NAMESPACE = 'recoded-date'

        def record
          p message.robot.brain.data[NAMESPACE]
        end
      end
    end
  end
end
