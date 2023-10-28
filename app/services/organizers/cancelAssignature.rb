module Organizers
    class CancelAssignature
        include Interactor::Organizer

        organize Assignatures::Interactors::Delete, Assignatures::Interactors::SendAuthorEmail
    end
end
    