local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util);
local v3 = require(l_Parent_0.Parent.Cryo);
local l_deepCopy_0 = v2.deepCopy;
local v5 = require(l_Parent_0.UI.Components.RoundBox);
local v6 = require(l_Parent_0.UI.Components.UIFolderData);
local v7 = l_deepCopy_0((require(v6.RoundBox.style)));
return {
    Background = v5, 
    Foreground = v5, 
    BackgroundStyle = v3.Dictionary.join(v7, {
        Color = v1.Button
    }), 
    ForegroundStyle = v3.Dictionary.join(v7, {
        Color = v1.DialogMainButtonSelected
    })
};