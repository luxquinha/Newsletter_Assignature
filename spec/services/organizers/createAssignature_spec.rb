require 'rails_helper'

RSpec.describe (Organizers::CreateAssignature) do
    # Setup:
    let(:author) {Author.create(name: "Leonardo")}
    let(:reader) {Reader.create(name: "Lucas")}
    let(:newsletter) {Newsletter.create(title: "NPC", author: author)}
    context "When a reader assign a newsletter" do
        # Processamento:    
       let!(:result) {described_class.call(
            reader_id: reader.id,
            newsletter_id: newsletter.id
            )}
        
        # Expectativa => Criar uma nova assignature
        it "Should create a new assignature" do
            expect(Assignature.count).to eq(1)
            expect(Assignature.first.reader_id).to eq(reader.id)
        end
        
        # Expectativa => Enviar uma mensagem para o author
        it "Should send a message to author" do
            expect(result.author_message).to eq(true)
        end
        
        # Expectativa => Enviar uma mensagem pro reader
        it "Should send a message to reader" do
            expect(result.reader_message).to eq(true)
        end
    end
end