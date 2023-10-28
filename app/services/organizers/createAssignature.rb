module Organizers
    class CreateAssignature
        include Interactor::Organizer

        organize Assignatures::Interactors::Create, Assignatures::Interactors::SendAuthorEmail, Assignatures::Interactors::SendReaderEmail 
    end
end