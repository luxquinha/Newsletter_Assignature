class NewsletterController < ApplicationController
     #It finds the newsletter before the following functions:
     before_action :find_newsletter, only: [:index, :update, :destroy]
     #It renders all the user registered:
     def all 
         if Newsletter.first
             render json: Newsletter.all
         else
             render json: {message: 'Does not exist newsletters registred yet'}
         end
     end
     #It renders a specific newsletter:
     def index
         if @newsletter 
             render json: @newsletter
         else
             render json: {message: "Doesn't exists a newsletter with this index"}
         end
     end
     #It create a new newsletter e save it in database:
     def create
        newsletter = Newsletter.new(newsletter_params)
         if newsletter.save
             render json: newsletter
         else
             render json: {message: "It wasn't possible create the entity"}
         end
     end
     #It update an existent newsletter on database:
     def update
         if @newsletter
            @newsletter.update(newsletter_params)
            render json: @newsletter
         else
            render json: {message: "This entity wasn't found"}
         end
     end
     #It destroy an user from database:
     def destroy
         if @newsletter
             @newsletter.destroy()
             render json: @newsletter
         else
             render json: {message: "This entity wasn't found"}
         end
     end  
     #Privates functions:
     private
     #It Finds the newsletter of id passed on URL:
     def find_newsletter
        @newsletter = Newsletter.find_by(id: params[:id])
     end
     #Specified all acceptable parameters:
     def newsletter_params
         params.permit(:title, :body, :author_id)
     end
end
