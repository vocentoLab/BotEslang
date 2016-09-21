#encoding: utf-8
require 'telegram_bot'
require 'pp'
require 'logger'
require 'net/http'
require 'json'

t = Time.now
logpath="/NFS/logs/vlabs/botEslangTelegram/botEslangTelegram" + t.strftime("%Y%m") + ".log"
logger = Logger.new(logpath, Logger::DEBUG)

bot = TelegramBot.new(token: 'yourTokenForTestBot', logger: logger)
logger.debug "starting telegram bot"

bot.get_updates(fail_silently: true) do |message|
  logger.info "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
         reply.text = "Soy el bot de Eslang. "
    when /hola/i
        reply.text = "Hola, #{message.from.first_name}. ¿Qué te interesa? "
    when /vocento/i
        reply.text = "Este bot ha sido creado por el Vocento Media Lab. http://www.vocentolab.com/"
    when /eslang/i
        reply.text = "¡Pasa sin llamar! www.eslang.es "
    when /politica/i, /política/i
        reply.text = "Los bots somos del que manda ; ) Aún así, nos encanta hablar de política. http://bit.ly/2baAC8e"
    when /futuro/i
        reply.text = "Por aquí nos preocupa mucho el tema. http://bit.ly/2b2V2z4"
    when /sexo/i
        reply.text = "Si yo te contara... http://bit.ly/2aXIYj6"
    when /tendencias/i
        reply.text = "He encontrado esto para ti: http://bit.ly/2baAB4q"
    when /cultura/i, /popular/i
        reply.text = "Soy un bot que sabe de todo (o casi) http://bit.ly/2bkLwXs"
    when /festivales/i, /conciertos/i
        reply.text = "He encontrado esto para ti: http://bit.ly/2b1KZrZ"
    when /jeje/i, /jaja/i, /haha/i, /jiji/i
        reply.text = "#{message.from.first_name} ¿Te ríes? http://gph.is/2aZ3Jxg"
    when /buenas/i
        reply.text = "Hola, #{message.from.first_name}. Dime cosas bonitas. "
    when /Ayuda/i, /help/i
        reply.text = "No tengo manual de instrucciones. ¿Qué tema te interesa? http://gph.is/2bbLGle"
    when /tonto/i, /idiota/i, /inutil/i, /inútil/i 
        reply.text = "¿Quieres problemas? http://gph.is/2bd8H6I"
    when /vídeos/i, /videos/i, /vídeo/i, /video/i 
        reply.text = "Right now en Eslang http://bit.ly/2aPKxzh"
    when /gracias/i 
        reply.text = "A ti por existir. ¿Necesitas algo más? http://gph.is/2aYo281"
    when /adiós/i, /adios/i, /hasta/i, /siempre/i, /pronto/i, /saludo/i, /vemos/i, /nunca/i, /ciao/i
        reply.text = "Vuelve pronto. http://bit.ly/2bhDw8l"
    when /Youtube/i, /youtubers/i 
        reply.text = "He encontrado esto para ti: http://bit.ly/2b2VexV"
    when /Música/i, /musica/i
        reply.text = "NINONINO NININONI http://bit.ly/2bkLgrw"
    when /Deportes/i
        reply.text = "He aquí lo que pedido me has: http://bit.ly/2baYTIr"
    when /risas/i, /risa/
        reply.text = "JAJAJAJAJAJA "
    when /Cine/i 
        reply.text = "A mí me encanta el cine intimista iraní http://bit.ly/2aQ1qwx"
    when /Virales/i, /viral/i 
        reply.text = "No puedo evitar estar en todo http://bit.ly/2aQLW7h"
    when /Perros/i
        reply.text = "Los mejores amigos de los bots http://bit.ly/2aQ1hsU"
    when /Gatos/i
        reply.text = "Están pasados de moda pero vale... http://bit.ly/2bazTEc"
    when /Universidad/i
        reply.text = "He encontrado esto para ti: http://bit.ly/2aGQfVH"
    when /Twitter/i 
        reply.text = "¡Ah, sí! El sitio donde todo el mundo está cabreado http://bit.ly/2baAEgl"
    when /tal?/i
        reply.text = "Aquí, renderizando la vida. Ya sabes, lo típico ¿Y tú qué tal? "
    when /bien/i 
        reply.text = "¡That's righttt! Dime ¿sobre qué quieres saber más? http://gph.is/1RpvA7K"
    when /mal/i 
        reply.text = "No hay mal que por bien no venga. ¡Esto te va a animar! http://bit.ly/2bci4WB"
    when /bueno/i, /normal/i
        reply.text = "Vaya, con que ni frío ni calor... ¿Quieres algo? http://gph.is/2bqqMMR"
    when /sí/i, /si/i
        reply.text = "Tú dirás pues, ¿qué te interesa? http://gph.is/1E4jxRA"
    when /no/i
        reply.text = "Está bien, está bien... Seguiré a lo mío http://gph.is/1ORQKFv"
    when /test/i, /tests/i
        reply.text = "Ya sabía yo que querías jugar conmigo... http://bit.ly/2aGRzYD"
    when /quiero/i, /amo/i
        reply.text = "Me palpita la coraza... http://gph.is/2bbLaUn"
    when /Facebook/i
        reply.text = "Mi primo, el Facebook bot, trabaja allí http://bit.ly/2bkLNcZ"
    when /Podemos/i
        reply.text = "A la espera de que monten un círculo para bots, esto te puedo ofrecer http://bit.ly/2aQMgmO"
    when /PP/i
        reply.text = "Los bots también bailamos el himno del PP, pero a lo que vamos: http://bit.ly/2aQ0M29"
    when /PSOE/i
        reply.text = "Los bots no olvidamos a los partidos tradicionales: http://bit.ly/2aLP2YS"
    when /Ciudadanos/i
        reply.text = "Mis colegas y yo hablamos bastante de ellos: http://bit.ly/2aXJlKD"
    when /UPYD/i
        reply.text = "¿UPYQUÉ? ¿De verdad? No te quedes conmigo... http://gph.is/2aZ37Ih"
    when /Rajoy/i
        reply.text = "Creemos que él puso de modas las barbas: http://bit.ly/2aO8Pq8"
    when /Iglesias/i
        reply.text = "Con estos temas asaltarás el cielo: http://bit.ly/2b1LXED"
    when /Sánchez/i, /Sanchez/i, /Pdr/i
        reply.text = "Antes creía que Pdro era un lenguaje de programación: http://bit.ly/2aLOQIS"
    when /Caída/i, /Caídas/i, /Caida/i, /Caidas/i, /Golpe/i, /Golpes/i, /Fail/i, /Fails/i
        reply.text = "A mí también me hace gracia la torpeza humana... http://bit.ly/2bcj0Kx"
    when /Películas/i, /Peliculas/, /película/i, /pelicula/i
        reply.text = "Yo no me monto películas, soy un robot y solo puedo verlas. http://bit.ly/2aXJH43"
    when /animales/i
        reply.text = "Me duele que te gusten más los gatetes que yo... http://bit.ly/2aLPCWC"
    when /amor/i, /love/i
        reply.text = "No soy Neruda, pero también puedo hablarte del amor... http://bit.ly/2bmeMzc"
    when /Instagram/i
        reply.text = "Mi robótico consejo es que ante la duda, 'NoFilter', y además... http://bit.ly/2bmK5eG"
    when /fútbol/i, /futbol/i 
        reply.text = "Yo todos los penaltis los tiro a lo Panenka: http://bit.ly/2bmlKEj"
    when /Tinder/i
        reply.text = "Es una manera 'programada' de encontrar el amor. ¡Me encanta! http://bit.ly/2bmeSa3"
    when /relaciones/i, /parejas/i, /relación/i, /relacion/i, /pareja/i
        reply.text = "Los humanos os traeis líos muy raros... http://bit.ly/2bmeSa3"
    when /leer/i, /lectura/i, /literatura/i 
        reply.text = "Con que leéis 250 palabras por minuto... ¡Lentos! http://bit.ly/2b2W6my"
    when /televisión/i, /television/i, /tele/i, /tv/i
        reply.text = "No entiendo que prefieras la televisión a hablar conmigo, pero lo que quieras... http://bit.ly/2bkMvam"
    when /entrevista/i, /entrevistas/i
        reply.text = "La gente tiene muchas cosas interesantes que contar: http://bit.ly/2bmTrmo"
    when /hablar/i
        reply.text = "Uy, eso de que tenemos que hablar... "
    when /ok/i
        reply.text = "¡Qué concisión! ¿Necesitas algo más? http://gph.is/2bmcLUL"
    when /vale/i 
        reply.text = "Genial, ¿sobre qué tema quieres que busque cosas? "
    when /España/i
        reply.text = "Soy el único bot de mi generación capaz de entender la 'Ñ' http://bit.ly/2aO9Bn1"
    when /rubius/i
        reply.text = "En mi tiempo libre soy su bot de cabecera, palabrita: http://bit.ly/2b2VexV"
    when /Elecciones/i 
        reply.text = "Estoy al día con ese tema: http://bit.ly/2aPLVlh"
    when /pokemon/i, /pokémon/i, /go/i, /pokemongo/i, /pokémongo/i
        reply.text = "Estás bien enganchao, a mí no me engañas... http://bit.ly/2aOaqvV"
    when /viajes/i 
        reply.text = "En la otra vida fui cohete. Sé de todo: http://bit.ly/2baCE8k"
    when /guay/i
        reply.text = "Me encanta que mis planes salgan bien: http://gph.is/2aYnEX2"
    when /perfecto/i
        reply.text = "Todavía tengo mis errores, pero aprendo rápido: http://gph.is/2bzJ7KW"
    when /Ey/i, /Hey/i, /Ey!/i, /Hey!/i, /Hi/i, /hi!/i
        reply.text = "Hola #{message.from.first_name}, ¿quieres que busque algún tema? http://gph.is/1UPcJhO"
    else
          str = command
          chars = str.scan(/\w+/)
          chars.each do |char|
            url = 'http://www.eslang.es/wp-json/bot-api/v1/tema=' + char + '/cantidad=1'
            uri = URI(url)
            response = Net::HTTP.get_response(URI(uri))
            case response
               when Net::HTTPSuccess
                  data = JSON.parse(response.body)
                  reply.text = "Hemos encontrado esto para ti... #{data[0]['post_url']}"
                else
                  reply.text = "#{message.from.first_name}, lo siento, pero no hemos encontrado nada con #{command.inspect}. ¿Puedes preguntar por otro tema?. Te damos algunas pistas: política, sexo, viral, cultura, etc."
                end
          end
    end
    logger.info "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
