local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.UI.Components.UIFolderData);
local v3 = require(v2.DropShadow.style);
return {
    Padding = 5, 
    MaxWidth = 200, 
    ShowDelay = 0.3, 
    Offset = Vector2.new(10, 5), 
    DropShadow = v1.Dictionary.join(v3, {
        Radius = 3
    })
};