--!strict
local Framework = script.Parent.Parent.Parent
local Types = require(Framework.Types)
type StudioUri = Types.StudioUri

local Panels = {}
function Panels:SetAttachmentAsync(_uri: StudioUri, _target: StudioUri) end

function Panels:SetSizeAsync(_uri: StudioUri, _size: Vector2) end

local Widgets = {}
function Widgets:RegisterAsync(_widgets: { { Uri: StudioUri, Widget: Instance } }) end

function Widgets:DeregisterAsync(_uris: { StudioUri }) end

return {
	Panels = Panels,
	Widgets = Widgets,
}
