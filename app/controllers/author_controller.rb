class AuthorController < ApplicationController
    #It finds the author before the following functions:
    before_action :find_author, only: [:index, :update, :destroy]
    #It renders all the user registered:
    def all 
        if Author.first
            render json: Author.all
        else
            render json: {message: 'Não há nenhum autor cadastrado'}
        end
    end
    #It renders a specific author:
    def index
        if @author 
            render json: @author
        else
            render json: {message: "Doesn't exists an author with this index"}
        end
    end
    #It create a new author e save it in database:
    def create
        author = Author.new(author_params)
        if author.save
            render json: author
        else
            render json: {message: "It wasn't possible create the entity"}
        end
    end
    #It update an existent user on database:
    def update
        if @author
            @author.update(author_params)
            render json: @author
        else
            render json: {message: "This entity wasn't found"}
        end
    end
    #It destroy an user from database:
    def destroy
        if @author.destroy
            render json: @author
        else
            render json: {message: "The author wasn't found, verify your entries"}
        end
    end  
    #Privates functions:
    private
    #It Finds the author of id passed on URL:
    def find_author
        @author = Author.find_by(id: params[:id])
        # render json: author
        # if author
        #     @author = author
        # end
    end
    #Specified all acceptable parameters:
    def author_params
        params.permit(:name, :birth_date)
    end
end
