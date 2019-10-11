require 'nokogiri'
require 'open-uri'

# methode de récuperation des email
def townhall_s_email(url)
  page = Nokogiri::HTML(open(url))
  
  email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
  
  return email.text

end

# methode de récupération des liens
def townhall_s_links
  page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

  links = page.xpath('/html/body/table//a[@class="lientxt"]')
  
  return links
end

# methode de génération du tableau de résultat final
def generate_town_email
  url = "https://www.annuaire-des-mairies.com"
  retour = []

  # génération du tableau contenant les Hash contenant les données
  townhall_s_links.each do |link|
    
    # génération du Hash contenant les données
    hash = Hash.new
    hash[link.text] = townhall_s_email(link['href'].sub(/^./, url))
    retour << hash

    i += 1
  end

  return retour

end
