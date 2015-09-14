require "ruboty/kihon/client"

module Ruboty
  module Handlers
    class Kihon < Base
      on /(kihon|kurashi-no-kihon)( me)?/, name: 'kihon', description: 'Show greeting from kurashi-no-kihon'

      def kihon(message = {})
        b = ::Ruboty::Kihon::Client.greeting
        message.reply(b)
      rescue
        message.reply('Unknow error.')
      end
    end
  end
end
