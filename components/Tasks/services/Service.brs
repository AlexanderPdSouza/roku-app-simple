sub init()
    m.top.functionName = "getContent"
end sub

sub getContent()
    url = "https://pokeapi.co/api/v2/pokemon?limit=25"
    request = CreateObject("roUrlTransfer")
    request.SetUrl(url)
    response = request.GetToString()
    json = ParseJson(response)
    m.top.response = json
end sub