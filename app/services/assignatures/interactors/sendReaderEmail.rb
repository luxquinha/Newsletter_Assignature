module Assignatures
    module Interactors
        class SendReaderEmail
            include Interactor
            # It's send the body's message and the email to Send:
            def call
                # Notification::Interactors::Send.call(
                #     body: message,
                #     email: context.reader.email
                # )
                context.reader_message = true
            end
            private
            def newsletter
                context.newsletter
            end
            def message
                context.reader_message
            end
            def reader_email
                context.reader.email
            end
        end
    end
end