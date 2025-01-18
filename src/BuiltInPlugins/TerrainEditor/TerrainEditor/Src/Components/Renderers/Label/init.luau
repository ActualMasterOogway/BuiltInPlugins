local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_TextLabel_0 = v1.UI.TextLabel;
return function(v4) --[[ Line: 17 ]] --[[ Name: LabelRenderer ]]
    -- upvalues: v2 (copy), l_TextLabel_0 (copy)
    local l_Schema_0 = v4.Schema;
    return v2.createElement(l_TextLabel_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        Text = l_Schema_0.Text
    });
end;