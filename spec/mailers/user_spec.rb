require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe '.deliver_summary' do
    let(:summary) { Summary.new('Title', 'Body', 'http://example.com') }
    let(:mail) { UserMailer.deliver_summary(email: 'fernando@example.com', summary: summary) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Read later email for article "Title"')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql(['fernando@example.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['noreply@example.com'])
    end

    it 'assigns @title' do
      expect(mail.body.encoded).to match(summary.title)
    end

    it 'assigns @url' do
      expect(mail.body.encoded).to match(summary.url)
    end

    it 'assigns @body' do
      expect(mail.body.encoded).to match(summary.body)
    end
  end
end
