local Foundation = script:FindFirstAncestor("Foundation")
local Packages = Foundation.Parent
local React = require(Packages.React)

local getGeneratedRules = require(Foundation.Utility.getGeneratedRules)
local Theme = require(Foundation.Enums.Theme)
local Device = require(Foundation.Enums.Device)
type Theme = Theme.Theme
type Device = Device.Device

local function useGeneratedRules(theme: Theme, device: Device, colorUpdate: boolean)
	return React.useMemo(function(): any
		return getGeneratedRules(theme, device, colorUpdate)
	end, { theme :: any, device, colorUpdate })
end

return useGeneratedRules
