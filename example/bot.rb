#encoding: utf-8
require 'telegram_bot'
require 'pp'
require 'logger'

logger = Logger.new("/NFS/logs/vlabs/botEslangTelegram/botEslangTelegram.log", Logger::DEBUG)

bot = TelegramBot.new(token: 'yourTokenForTestBot', logger: logger)
logger.debug "starting telegram bot"

bot.get_updates(fail_silently: true) do |message|
  logger.info "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "Soy el Bot de Eslang."
    when /hola/i
      reply.text = "Hola, #{message.from.first_name}. Dinos un tema que te interese."
    when /vocento/i
      reply.text = "Somos los creadores del bot, te recomiendo visitar nuestra web www.vocentomedialab.com"
    when /eslang/i
      reply.text = "Si no conoces slang, te recomiendo visitar www.eslang.es, es un portal para autenticos millenials"
    when /politica/i, /política/i
      reply.text = "Hemos econtrado esto para ti: http://www.eslang.es/politica/?ns_campaign=WA_MS&ns_mchannel=TL&ns_source=BS&ns_linkname=category&ns_fee=0"
    when /futuro/i
      reply.text = "Hemos econtrado esto para ti: http://www.eslang.es/empleo-universidad/?ns_campaign=WA_MS&ns_mchannel=TL&ns_source=BS&ns_linkname=category&ns_fee=0"  
    when /sexo/i
      reply.text = "Hemos econtrado esto para ti: http://www.eslang.es/sexo/?ns_campaign=WA_MS&ns_mchannel=TL&ns_source=BS&ns_linkname=category&ns_fee=0"  
    when /tendencias/i
      reply.text = "Hemos econtrado esto para ti: http://www.eslang.es/tendencias/?ns_campaign=WA_MS&ns_mchannel=TL&ns_source=BS&ns_linkname=category&ns_fee=0"  
    when /cultura/i, /popular/i
      reply.text = "Hemos econtrado esto para ti: http://www.eslang.es/sin-categoria/sin-titulo_-d.html?ns_campaign=WA_MS&ns_mchannel=TL&ns_source=BS&ns_linkname=category&ns_fee=0"         
    when /viral/i
      reply.text = "Hemos econtrado esto para ti: http://www.eslang.es/viral/?ns_campaign=WA_MS&ns_mchannel=TL&ns_source=BS&ns_linkname=category&ns_fee=0"         
    when /festivales/i, /conciertos/i
      reply.text = "Hemos econtrado esto para ti: http://www.eslang.es/guia-de-festivales-2016?ns_campaign=WA_MS&ns_mchannel=TL&ns_source=BS&ns_linkname=detalle&ns_fee=0"     
    when /cine/i, /peliculas/i, /musica/i
      reply.text = "Hemos econtrado esto para ti: http://www.eslang.es/tag/cine/?ns_campaign=WA_MS&ns_mchannel=TL&ns_source=BS&ns_linkname=tag&ns_fee=0"   
    when /jeje/i, /jaja/i, /haha/i
      reply.text = "#{message.from.first_name} soy un bot divertido. No te cortes, dime temas que te interesan. http://giphy.com/gifs/wall-e-j0ADYtzavC2xW"   
    when /comite/i, /comité/i
      reply.text = "Vaya fiesta, ¿no? ¿Les has hablado de mí?"     
    when /estoy/i, /ello/i
      reply.text = "¿Y qué dice Iñaki? ¿Muerte a los robots??"   
    when /creador/i, /padre/i
       reply.text = "Miguel Ángel Villar Gutiérrez es el padre del Bot http://vocentomedialab.com/images/about/man2.jpg"
    else
      reply.text = "#{message.from.first_name}, lo siento, pero no hemos encontrado nada con #{command.inspect}. ¿Puedes preguntar por otro tema?. Te damos algunas pistas: política, sexo, viral, cultura, etc."
    end

    logger.info "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
