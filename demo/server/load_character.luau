local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local jecs = require(ReplicatedStorage.jecs)

local PlayerAdded = jecs.collect(Players.PlayerAdded)

return function()
	local player = PlayerAdded()

	if not player then
		return
	end

	task.spawn(player.LoadCharacterAsync, player)
end
