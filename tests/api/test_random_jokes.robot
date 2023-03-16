*** Settings ***
Documentation    Test Cases for the free jokes REST-API
Library    ../../libraries/JsonSchema.py
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL} =    https://official-joke-api.appspot.com
&{PROXIES}  =    https=http://localhost:3128
# &{HEADERS} =    accept=text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9

*** Test Cases ***
Random Joke Test
    [Documentation]   Get a random joke
    Create Session    RandJokes  ${BASE_URL}
    ${response}     get on session  RandJokes  /random_joke  proxies=&{PROXIES}  # headers=&{HEADERS}
    should be equal as integers    ${response.status_code}  200
    validate json    ${response.json()}    ./resources/joke_schema.json
    log to console    ${response.json()}

Get Joke By Id Test
    Create Session    RandJokes  ${BASE_URL}
    ${response} =     get on session  RandJokes  /jokes/23  proxies=&{PROXIES}  # headers=&{HEADERS}
    should be equal as integers    ${response.status_code}  200
    validate json    ${response.json()}    ./resources/joke_schema.json
    log to console    ${response.json()}

Get Joke By Type Test
    Create Session    RandJokes  ${BASE_URL}
    ${response} =     get on session  RandJokes  jokes/programming/random  proxies=&{PROXIES}  # headers=&{HEADERS}
    should be equal as integers    ${response.status_code}  200
    validate json    ${response.json()}    ./resources/joke_schema.json
    log to console    ${response.json()}