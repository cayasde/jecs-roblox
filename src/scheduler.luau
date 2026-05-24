local RunService = game:GetService("RunService")

export type SystemContext = {
	dt: number,
}

export type System = (ctx: SystemContext) -> ()

export type Schedule = {
	Heartbeat: { System }?,
	PreSimulation: { System }?,
	PostSimulation: { System }?,
	PreAnimation: { System }?,
	Stepped: { System }?,
	PreRender: { System }?,
	RenderStepped: { System }?,
}

const runservice_signals = {
	Heartbeat = RunService.Heartbeat,
	PreSimulation = RunService.PreSimulation,
	PostSimulation = RunService.PostSimulation,
	PreAnimation = RunService.PreAnimation,
	Stepped = RunService.Stepped,
	PreRender = RunService.PreRender,
	RenderStepped = RunService.RenderStepped,
} :: { [string]: RBXScriptSignal }

const function query_execution_systems(systems: { System }, dt: number)
	local ctx: SystemContext = {
		dt = dt,
	}

	for _, system in systems do
		system(ctx)
	end
end

const function start(schedule: Schedule)
	for phase, systems in schedule :: { [string]: { System } } do
		local signal = runservice_signals[phase]

		if not signal then
			continue
		end

		signal:Connect(function(dt: number)
			query_execution_systems(systems, dt)
		end)
	end
end

return {
	start = start,
}
