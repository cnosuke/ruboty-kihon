require 'rest-client'
require 'nokogiri'

module Ruboty
  module Kihon
    class Client
      def self.greeting
        d = Nokogiri::HTML.parse(RestClient.get('https://kurashi-no-kihon.com/'))
        c = %w(title content editor).map{|attr| d.css(".greeting .#{attr}").text }
        body =<<EOB
#{c[0].split(/\n/).map{|e| '　　　　'+e }.join("\n")}

#{c[1].tap{|e| break e.gsub(/\n/,'').scan(/.{13}/).push(e[e.size-(e.size%13)+1 ... -1]) }.join("\n")}

　　　　#{c[2]}

EOB
        return body
      end
    end
  end
end
