local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.UIFolderData);
local v2 = require(v1.RangeSlider.style);
return require(l_Parent_0.Util).deepCopy(v2);