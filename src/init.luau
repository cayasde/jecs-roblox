local jecs = require("@self/upstream")

local exports = {}

for key, value in jecs do
	exports[key] = value
end

return exports :: typeof(jecs)
