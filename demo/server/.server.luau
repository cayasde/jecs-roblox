local ReplicatedStorage = game:GetService("ReplicatedStorage")

local jecs = require(ReplicatedStorage.jecs)

jecs.scheduler.start({
	Heartbeat = {
		require("./load_character"),
	},
})
