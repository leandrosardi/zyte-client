require_relative '../lib/zyte-client.rb'
require_relative './config.rb'

url = 'https://www.google.com/search?q=Hola+Mundo'
client = ZyteClient.new(key: ZYTE_API_KEY)
html = client.extract(
    url: url,
    options: {
        "sessionContext": [
        {
            "name": "id",
            "value": "2"
        }
        ],
        "sessionContextParameters": {
            "actions": [
            {
                "action": "waitForTimeout",
                "timeout": 5,
                "onError": "return"
            }
            ]
        },            
        "httpResponseBody": true
    }
)
File.open("data/options.html", 'w') { |file| file.write(html) }
puts html