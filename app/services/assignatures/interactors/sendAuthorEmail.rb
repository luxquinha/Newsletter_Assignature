module Assignatures
    module Interactors
        class SendAuthorEmail
            include Interactor
            # It's send the body's message and the email to Send:
            def call
                # Notification::Interactors::Send.call(
                #     body: message
                #     #email: author_email
                # )
                news_author
                context.author_message = true
            end
            private
            def newsletter
                context.newsletter
            end
            def news_author
                context.author = newsletter.author
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