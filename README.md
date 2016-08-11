## Feature

This Bot are design for Eslang.es

## Code Example

* You can see an example of CODE

Examples:  

 message.reply do |reply|
    case command
    when /start/i
      reply.text = "Soy el Bot de Eslang."
    when /hola/i
      reply.text = "Hola, #{message.from.first_name}. Dinos un tema que te interese."
    else
      reply.text = "#{message.from.first_name}, lo siento, pero no hemos encontrado nada con #{command.inspect}. ¿Puedes preguntar por otro tema?. Te damos algunas pistas: política, sexo, viral, cultura, etc."
    end


## Motivation

We hope this will serve as code to help accelerate the development of chatbots for broadcast media.

## Installation

Run -bundle install- to install the necessary ruby gems for use this bot. You will see the list in the Gemfie file.

Steps:
* cloned repository
* bundle install
* execute "ruby /example/bot.rb" in the command line

Or talk directly https://telegram.me/EslangBot :)

Examples:

ruby /example/bot.rb

## Contributors

* Miguel Ángel Villar Gutiérrez (mavillar@vocento.com).
* Read this post for more information: https://medium.com/@VocentoLab/los-bots-han-llegado-para-quedarse-214448cbc442#

## License

In progress by https://vocentolab.com


