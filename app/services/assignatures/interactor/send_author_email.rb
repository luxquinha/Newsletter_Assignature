module Assignatures
    module Interactor
        class SendAuthorEmail
            include Interactor

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