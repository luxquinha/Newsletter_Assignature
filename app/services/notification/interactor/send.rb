module Notification
    module Interactor
        class Send
            include Interactor
            def call
                puts context.message
            end
        end
    end
end