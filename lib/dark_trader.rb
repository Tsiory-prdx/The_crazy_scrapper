require 'nokogiri'
require 'open-uri'


def crypto_scrapper
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  # récupération des données du tableau
  table_rows = page.xpath('//table[@id="currencies-all"]/tbody/tr')
  crypto_symbol = page.xpath('//table[@id="currencies-all"]/tbody/tr/td[3]')
  crypto_price = page.xpath('//table[@id="currencies-all"]/tbody/tr/td[5]/a')

  retour = []

  # génération du Hash
  table_rows.length.times do |i|
    result = Hash.new
    result[crypto_symbol[i].text] = crypto_price[i]['data-usd'].to_f.round(2)
    #insertion dans un tableau
    retour << result
  end

  return retour

end
