class ReaderController < ApplicationController
     #It finds the reader before the following functions:
     before_action :find_reader, only: [:index, :update, :destroy]
     #It renders all the user registered:
     def all 
         if Reader.first
             render json: Reader.all
         else
             render json: {message: 'Does not exist readers registred yet'}
         end
     end
     #It renders a specific reader:
     def index
         if @reader 
            render json: @reader
         else
             render json: {message: "Doesn't exists an reader with this index"}
         end
     end
     #It create a new reader e save it in database:
     def create
         reader = Reader.new(reader_params)
         if reader.save
             render json: reader
         else
             render json: {message: "It wasn't possible create the entity"}
         end
     end
     #It update an existent reader on database:
     def update
         if @reader
            @reader.update(reader_params)
            render json: @reader
         else
             render json: {message: "This entity wasn't found"}
         end
     end
     #It destroy an user from database:
     def destroy
         if @reader
            @reader.destroy()
            render json: @reader
         else
             render json: {message: "This entity wasn't found"}
         end
     end  
     #Privates functions:
     private
     #It Finds the reader of id passed on URL:
     def find_reader
        @reader = Reader.find(params[:id])
     end
     #Specified all acceptable parameters:
     def reader_params
         params.permit(:name, :email)
     end
end
