-- DEVIATION: Undefined flags that break production build for contractors
-- Please periodically check and remove
game:DefineFastFlag("UpdateUITabLuaRibbon", false)

local types = require(script.types)

export type DebugFlags = types.DebugFlags

return {
	ModuleLoader = require(script.ModuleLoader),
	getDebugFlags = require(script.getDebugFlags),
	hasInternalPermission = require(script.hasInternalPermission),
	isCli = require(script.isCli),
	launch = require(script.launch),
}
