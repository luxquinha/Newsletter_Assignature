module Notification
    module Interactor
        class Send
            include Interactor
            # It's receive the body's message and the email to send respective message:
            def call
                puts context.message
            end
        end
    end
end