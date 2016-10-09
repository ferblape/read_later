require 'open-uri'

class WebScraper

  def scrape(url)
    document = Nokogiri.HTML(open(url))
    Summary.new get_title(document), get_body(document), url
  end

  private

  def get_title(document)
    document.search('//h1[@itemprop="name headline"]').first.text.strip
  rescue
    ""
  end

  def get_body(document)
    paragraphs = document.search('//div[@itemprop="articleBody"]').first.text.split("\n").map do |div|
      div.strip if div.present?
    end.compact

    paragraphs.join("\n\n")
  rescue
    ""
  end

end
