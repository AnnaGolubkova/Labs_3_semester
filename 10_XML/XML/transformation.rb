require 'nokogiri'
doc = Nokogiri::XML(File.read('palindrom.xml'))
xslt = Nokogiri::XSLT(File.read('transformer.xslt'))
puts xslt.transform(doc)
