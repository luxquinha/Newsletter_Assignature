module Notification
    module Interactors
        class Send
            include Interactor
            # It's receive the body's message and the email to send respective message:
            def call
                # context.message_sended = true
            end
        end
    end
end