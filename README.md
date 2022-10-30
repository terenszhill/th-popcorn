# th-popcorn
popcorn maker script for qbcore


**[qb]/qb-smallresources/server/consumables.lua**
```
QBCore.Functions.CreateUseableItem("popcorn", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)
```
**[qb]/qb-smallresources/config.lua**
```
["popcorn"] = math.random(35, 54),
```
The popcorn.ogg put in **[standalone]\interact-sound\client\html\sounds** folder

**[qb]/qb-core/shared/items.lua**
```
	-- Popcorn

	['popcorncsomag'] 			     = {['name'] = 'popcorncsomag', 				['label'] = 'Popcorn Csomag', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'popcorncsomag.png', 		['unique'] = true, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Pattogtatni való Kuki'},
	['popcorn'] 					 = {['name'] = 'popcorn', 			 	  	  	['label'] = 'Popcorn', 	                ['weight'] = 200, 		['type'] = 'item', 		['image'] = 'popcorn.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Pattogtatott finom nasi'},
```
