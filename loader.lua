if game.PlaceId == 106931261124996 then
   print("lucky block battlegrounds")
   loadstring(game:HttpGet('https://github.com/TristyMP4/bloxxer/raw/refs/heads/main/luckyblockbattlegrounds.lua'))()
elseif game.PlaceId == 286090429 then
   print("arsenal")
   loadstring(game:HttpGet('https://github.com/TristyMP4/bloxxer/raw/refs/heads/main/arsenal.lua'))()
elseif game.PlaceId == 292439477 then
   print("phantom forces")
   loadstring(game:HttpGet('https://github.com/TristyMP4/bloxxer/raw/refs/heads/main/phantomforces.lua'))()
elseif game.PlaceId == 17625359962 then
   print("rivals")
   loadstring(game:HttpGet('https://github.com/TristyMP4/bloxxer/raw/refs/heads/main/rivals.lua'))()
else
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TristyMP4/bloxxer/refs/heads/main/universal.lua"))()
   print("universal")
end


