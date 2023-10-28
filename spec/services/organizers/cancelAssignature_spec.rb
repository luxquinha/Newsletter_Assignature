require 'rails_helper'

RSpec.describe (Organizers::CancelAssignature) do
    # Setup:
    let(:reader) { FactoryBot.create(:reader) }
    let(:newsletter) { FactoryBot.create(:newsletter)}
    let(:assignature) { FactoryBot.create(:assignature)}
    let(:result) {described_class.call(
        reader_id: reader.id,
        newsTitle: newsletter.title
    )}
    context "When reader is assigned so" do

        it "Validates the reader's assignature" do
            expect(result.reader).to eq(reader)
            expect(result.newsletter).to eq(newsletter)
        end

        it "Deletes the assignature" do
            expect(Assignature.count).to eq(0)
            expect(result.assignature).to eq(Assignature.first)
        end

        context "When assignature was deleted" do

            it "Finds the newsletter's author" do
                expect(result.author.name).to eq("Lucas Ramos")
            end

            it "Sends a message to author" do
                expect(result.author_message).to be_truthy
            end
        end

    end
end