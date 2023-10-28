module Assignatures
    module Interactors
        class Delete
            include Interactor

            def call
                find_newsletter
                find_reader
                if @assignature
                    context.assignature = @assignature
                    @assignature.destroy()
                else
                    context.errorMessage = true
                end
            end

            private
            def find_assingature
                @assignature = Assignature.find_by(reader_id: context.reader_id, newsletter_id: @news.id)
            end
            def find_newsletter
                @news = Newsletter.find_by(title: context.newsTitle)
                if @news
                    context.newsletter = @news
                end
            end
            def find_reader
                @reader = Reader.find_by(id: context.reader_id)
                if @reader
                    context.reader = @reader
                end
            end
        end
    end
end