require 'nokogiri'
require 'open-uri'


def take_info(url)
  page = Nokogiri::HTML(open(url))
  
  result = Hash.new

  # recuperer les données
  name = page.xpath('/html/body/div[1]/div[3]/div/div/div/section[1]/div/article/div[2]/h1')
  name_array = name.text.split(' ')
  email = page.xpath('/html/body/div[1]/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')

  # générer du Hash pour les données
  result['first_name'] = name_array[1]
  result['last_name'] = name_array[2]
  result['email'] = email.text

  return result

end


def take_links
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  
  # récupérer les liens
  links = page.xpath('//*[@id="deputes-list"]//li/a')
  
  return links

end

def depute_info_s_generator
  base_url = 'http://www2.assemblee-nationale.fr'
  retour = []

  # récupérater les données dans un tableau
  take_links.each do |link|
    
    url = base_url + link['href']
    retour << take_info(url)

    i += 1
  end

  
  return retour

end

