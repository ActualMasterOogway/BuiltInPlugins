local DevFrameworkRoot = script.Parent.Parent.Parent
local Signal = require(DevFrameworkRoot.Util.Signal)

local MockMouse = require(script.Parent.MockMouse)
local MockPluginToolbar = require(script.Parent.MockPluginToolbar)
local MockPluginComponents = require(script.Parent.MockPluginComponents)

local MockPlugin = {}
MockPlugin.__index = MockPlugin

local function createScreenGui()
	local screen = Instance.new("ScreenGui")
	pcall(function()
		screen.Parent = game.CoreGui
	end)
	screen.Name = "PluginMockGui"
	screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	return screen
end

--[[
	id : string?
	mockedPlugins : {[MockPlugin] : boolean}?
		Optional set for interfacing with other plugins created in a unit test.
		E.g. when calling MockPlugin:Activate(), all other plugins in the mockedPlugins set get deactivated
		For tests that don't need this functionality, leave mockedPlugins as nil
]]
function MockPlugin.new(id, mockedPlugins)
	local self = setmetatable({
		_id = id or "",
		Name = id or "MockPlugin",

		Deactivation = Signal.new(),
		Unloading = Signal.new(),

		_activated = false,
		_activatedWithExclusiveMouse = false,

		_mouse = MockMouse.new(),

		_toolbars = {},

		_mockedSettings = {},

		subWindows = {},
	}, MockPlugin)

	if mockedPlugins then
		self._mockedPlugins = mockedPlugins
		self._mockedPlugins[self] = true
	end

	return self
end

function MockPlugin:Destroy()
	for _, toolbar in pairs(self._toolbars) do
		toolbar:Destroy()
	end
	self._toolbars = {}

	if self._mouse then
		self._mouse:Destroy()
		self._mouse = nil
	end

	if self._mockedPlugins then
		self._mockedPlugins[self] = nil
		self._mockedPlugins = nil
	end
end

function MockPlugin:CreateToolbar(id)
	if self._toolbars[id] then
		return self._toolbars[id]
	end

	local toolbar = MockPluginToolbar.new(self, id)
	self._toolbars[id] = toolbar
	return toolbar
end

function MockPlugin:IsActivated()
	return self._activated
end

function MockPlugin:IsActivatedWithExclusiveMouse()
	return self._activatedWithExclusiveMouse
end

function MockPlugin:Activate(exclusiveMouse)
	if self._mockedPlugins then
		for mockedPlugin, _ in pairs(self._mockedPlugins) do
			if mockedPlugin._activated then
				mockedPlugin:Deactivate()
			end
		end
	end

	self._activated = true
	self._activatedWithExclusiveMouse = if exclusiveMouse then true else false
end

function MockPlugin:CreatePluginAction()
	return {
		Triggered = Signal.new(),
	}
end

function MockPlugin:Deactivate()
	if not self._activated then
		return
	end
	self._activated = false
	self._activatedWithExclusiveMouse = false
	self.Deactivation:Fire()
end

function MockPlugin:GetMouse()
	return self._mouse
end

function MockPlugin:GetSubWindow(index)
	local now = tick()
	local timeout = now + 1
	while not self.subWindows[index] do
		wait()
		if tick() > now + timeout then
			error("Sub-window has not been created")
		end
	end
	return self.subWindows[index]
end

-- selene: allow(unused_variable)
function MockPlugin:CreateDockWidgetPluginGui(_, ...)
	local gui = createScreenGui()
	table.insert(self.subWindows, gui)
	gui.Destroying:Connect(function()
		local index = assert(table.find(self.subWindows, gui), "Couldn't find sub window GUI")
		table.remove(self.subWindows, index)
	end)
	return gui
end

function MockPlugin:CreateQWidgetPluginGui(title, ...)
	return self:CreateDockWidgetPluginGui(title, ...)
end
function MockPlugin:GetSetting(key)
	return self._mockedSettings[key]
end

function MockPlugin:SetSetting(key, value)
	self._mockedSettings[key] = value
end

function MockPlugin:MockSettings(settings)
	self._mockedSettings = settings
end

function MockPlugin:GetUri()
	return {
		DataModel = "Standalone",
		PluginType = "Standalone",
		PluginId = "MockPlugin",
	}
end
function MockPlugin:GetPluginComponent(componentName: string)
	return assert(MockPluginComponents[componentName], `No Plugin Component named {componentName}`)
end

return MockPlugin
