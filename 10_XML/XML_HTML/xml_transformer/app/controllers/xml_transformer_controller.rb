require 'nokogiri'
require 'open-uri' 

class XmlTransformerController < ApplicationController
  def input
  end

def answer
    page = Nokogiri::XML(open("http://localhost:3000/factorial/view.xml?v1=#{params[:v1]}"))
    xslt = Nokogiri::XSLT(File.read('public/transformer.xslt'))
    xslt_href = Nokogiri::XML::ProcessingInstruction.new(page, 'xml-stylesheet', 'type="text/xsl" href="../transformer.xslt"')

    request.format = params[:format].to_sym
    respond_to do |format|
      format.html { render html: xslt.transform(page).to_s.html_safe }
      format.xml do
        page.at('hash').add_previous_sibling xslt_href
        render xml: page
      end
    end
  end
end
