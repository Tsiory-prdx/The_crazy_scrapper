require 'nokogiri'
require 'open-uri'

# fonction de récuperation des email dans la page
def get_townhall_email(url)
  document = Nokogiri::HTML(open(url))
  
  email = document.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
  
  return email.text

end

# fonction pour de la récupération des liens
def get_townhall_links
  link = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

  puts "Scraping..."
  links = link.xpath('/html/body/table//a[@class="lientxt"]')
  
  return links
end

#Fonction pour la génération du tableau de résultat final et les hash pour les resultat
def generate_town_email
  base_url = "https://www.annuaire-des-mairies.com"
  result_final = []

  # imposé des limites cause des caractére trop long
  limit = 5 
  i = 0
  
  #  tableau contenant les Hash contenant les données
  get_townhall_links.each do |link|

    if i > limit
      break
    end

    #  Hash contenant les données
    hash = Hash.new
    hash[link.text] = get_townhall_email(link['href'].sub(/^./, base_url))
    result_final << hash

    print "."
    i += 1
  end

  puts ""
  puts "=== RESULT ==="
  return result_final

end


