module Assignatures
    module Interactor
        class SendReaderEmail
            include Interactor

            def call
                Notification::Send.call(
                    body: message,
                    email: context.reader.email
                )
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