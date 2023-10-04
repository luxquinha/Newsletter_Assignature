module Organizers
    class CreateAssignature
        include Interactor::Organizer

        organize Assignatures::Interactor::Create, Assignatures::Interactor::SendAuthorEmail, Assignatures::Interactor::SendReaderEmail 
    end
end