local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v3) --[[ Line: 6 ]] --[[ Name: BasicPropertyView ]]
    -- upvalues: v1 (copy)
    return v1.createElement("TextBox", {
        [v1.Tag] = "Text-Emphasis", 
        Text = tostring(v3.info.parts.value.value), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        TextEditable = false, 
        ClearTextOnFocus = false
    });
end;