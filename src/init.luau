local jecs = require("@self/upstream")
local scheduler = require("@self/scheduler")
local collect = require("@self/collect")

export type Archetype = jecs.Archetype
export type QueryInner = jecs.QueryInner
export type Entity<T = nil> = jecs.Entity<T>
export type Id<T = any> = jecs.Id<T>
export type Pair<First = any, Second = any> = jecs.Pair<First, Second>
export type Component<T = any> = jecs.Component<T>
export type Id2<First, Second = nil> = jecs.Id2<First, Second>
export type Item<T...> = jecs.Item<T...>
export type Iter<T...> = jecs.Iter<T...>
export type Cached_Query_Iter<T...> = jecs.Cached_Query_Iter<T...>
export type Cached_Query<T...> = jecs.Cached_Query<T...>
export type Query<T...> = jecs.Query<T...>
export type Observer = jecs.Observer
export type observer = jecs.observer
export type World = jecs.World
export type Record = jecs.Record
export type ComponentRecord = jecs.ComponentRecord
export type ComponentIndex = jecs.ComponentIndex
export type Archetypes = jecs.Archetypes
export type EntityIndex = jecs.EntityIndex

export type SystemContext = scheduler.SystemContext
export type System = scheduler.System
export type Schedule = scheduler.Schedule

local exports = {}
exports.scheduler = scheduler
exports.collect = collect

for key, value in jecs do
	exports[key] = value
end

return exports :: typeof(jecs) & {
	scheduler: typeof(scheduler),
	collect: typeof(collect),
}
