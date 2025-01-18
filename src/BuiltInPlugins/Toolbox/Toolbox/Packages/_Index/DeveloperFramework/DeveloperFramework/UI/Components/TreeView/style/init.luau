local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_deepCopy_0 = require(l_Parent_0.Util).deepCopy;
local v2 = require(l_Parent_0.UI.Components.UIFolderData);
local v3 = require(v2.Pane.style);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v5 = l_deepCopy_0(v3);
return l_join_0({
    Padding = 2, 
    RowHeight = 24
}, v5);