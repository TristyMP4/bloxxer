if game.PlaceId == 662417684 then
   print("lucky block battlegrounds")
   loadstring(game:HttpGet('https://github.com/TristyMP4/bloxxer/raw/refs/heads/main/luckyblockbattlegrounds.lua'))()
elseif game.PlaceId == 286090429 then
   print("arsenal")
   loadstring(game:HttpGet('https://github.com/TristyMP4/bloxxer/raw/refs/heads/main/arsenal.lua'))()
else
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TristyMP4/bloxxer/refs/heads/main/universal.lua"))()
end
