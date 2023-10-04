class AssignatureController < ApplicationController
     #It finds the assignature before the following functions:
     before_action :find_assignature, only: [:destroy, :index, :update]
     #It renders all the user registered:
     def all 
         if Assignature.first
             render json: Assignature.all
         else
             render json: 'Does not exist assignatures registred yet'
         end
     end
     #It renders a specific assignature:
     def index
        if @assignature
            render json: @assignature
        else
            render json: "Not found. Please, verify your entries datas"
        end
     end
     #It create a new assignature e save it in database:
     def create
         assigature = Organizers::CreateAssignature.call(reader_id: params[:reader_id], newsletter_id: params[:newsletter_id])
         if assigature.sucess?
            render json: assignature
         else
            render json: {message: assigature.message}
         end
     end
     #It update an existent assignature on database:
     def update
         if @assignature
             @assignature.update(assignature_params)
             render json: @assignature, status: :ok
         else
             render json: "This entity wasn't found"
         end
     end
     #It destroy an user from database:
     def destroy
         if @assignature
            @assignature.destroy()
            render json: @assignature
         else
             render json: "This entity wasn't found"
         end
     end  
     #Privates functions:
     private
     #It Finds the assignature of id passed on URL:
     def find_assignature
        @assignature = Assignature.find_by(id: params[:id])
     end
     #Specified all acceptable parameters:
     def assignature_params
         params.permit(:author_id, :newsletter_id)
     end
end
