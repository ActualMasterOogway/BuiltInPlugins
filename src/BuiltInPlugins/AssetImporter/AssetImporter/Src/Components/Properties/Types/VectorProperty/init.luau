local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
return function(v6) --[[ Line: 11 ]] --[[ Name: VectorProperty ]]
    -- upvalues: v2 (copy), l_TextLabel_0 (copy), l_TextInput_0 (copy)
    local l_Value_0 = v6.Value;
    local v8 = ("%.2f, %.2f, %.2f"):format(l_Value_0.X, l_Value_0.Y, l_Value_0.Z);
    if v6.Editable ~= nil and not v6.Editable then
        return v2.createElement(l_TextLabel_0, {
            LayoutOrder = v6.LayoutOrder, 
            Size = UDim2.new(0, 0, v6.Size.Y.Scale, v6.Size.Y.Offset), 
            AutomaticSize = Enum.AutomaticSize.X, 
            Text = v8, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
    else
        return v2.createElement(l_TextInput_0, {
            Disabled = true, 
            LayoutOrder = v6.LayoutOrder, 
            Size = v6.Size, 
            Text = v8
        });
    end;
end;