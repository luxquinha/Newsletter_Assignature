module Assignatures
    module Interactor
        class SendAuthorEmail
            include Interactor
            # It's send the body's message and the email to Send:
            def call
                Notification::Send.call(
                    body: message
                    #email: author_email
                )
            end
            private
            def newsletter
                context.newsletter
            end
            def message
                context.author_message
            end
            # def author_email
            #     context.author.email
            # end
        end
    end
end