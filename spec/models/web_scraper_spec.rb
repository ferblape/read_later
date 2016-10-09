require 'rails_helper'

RSpec.describe WebScraper, type: :model do
  describe '.scrape' do
    let(:url) { "http://example.com/panamam-papers.html" }

    it 'should scrape an url and return a Summary object' do
      stub_request(:get, url).
        to_return(:status => 200, :body => File.read(File.expand_path('../../fixtures/post.html', __FILE__)), :headers => {})

      summary = subject.scrape(url)

      expect(summary).to be_kind_of(Summary)
      expect(summary.title).to eq('Giant Leak of Offshore Financial Records Exposes Global Array of Crime and Corruption')
      expect(summary.url).to eq('http://example.com/panamam-papers.html')
      expect(summary.body).to include('A massive leak of documents exposes')
    end
  end
end
