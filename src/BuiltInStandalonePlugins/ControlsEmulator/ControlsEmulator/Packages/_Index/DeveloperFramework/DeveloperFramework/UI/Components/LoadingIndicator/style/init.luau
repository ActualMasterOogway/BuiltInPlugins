local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    StartColor = v1.DimmedText, 
    EndColor = v1.DialogMainButtonSelected, 
    Size = UDim2.new(0, 92, 0, 24)
};