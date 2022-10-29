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
