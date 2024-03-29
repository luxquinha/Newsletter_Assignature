module Assignatures
    module Interactors
        class Create
            include Interactor
            def call
                #It finds the reader and newsletter to know if it's exists:
                find_newsletter
                find_reader
                # Create a new instance of Assignature:
                assignature = Assignature.new(reader_id: context.reader_id, newsletter_id: context.newsletter_id)
                if assignature.save
                    context.assignature = assignature
                    # After add assignature to context, it's call these methods to write the messages to reader and author:
                    # reader_message
                    # author_message
                else
                    context.fail(message: "It wasn't possible to create your assigature, sorry. Verify your datas and try again")
                end
            end

            private
            # It finds these respective entitys:
            def find_newsletter
                @newsletter = Newsletter.find_by(id: context.newsletter_id)
                if @newsletter != nil
                    context.newsletter = @newsletter
                end
            end
            def find_reader
                @reader = Reader.find_by(id: context.reader_id)
                if @reader
                    context.reader = @reader
                end
            end
            # It's write the messages that will be send to author e reader:
            # def reader_message
            #     context.reader_message = true
            #     # "Hello #{context.reader.name}, you've just assign in the newsletter: #{context.newsletter.title}"
            # end
            # def author_message
            #     context.author_message = true
            #     # "Hey #{context.newsletter.author_name}, congratulations, you have a new assigner on newsletter: #{context.newsletter.title}"
            # end
        end
    end
end