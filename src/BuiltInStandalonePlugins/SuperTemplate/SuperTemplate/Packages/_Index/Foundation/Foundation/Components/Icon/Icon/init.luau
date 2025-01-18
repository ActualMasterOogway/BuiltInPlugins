local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Image);
local v4 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v6 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v9 = {
    size = v4.Medium
};
return v2.memo(v2.forwardRef(function(v10, v11) --[[ Line: 29 ]] --[[ Name: Icon ]]
    -- upvalues: v6 (copy), v9 (copy), v5 (copy), v2 (copy), v3 (copy), v8 (copy)
    local v12 = v6(v10, v9);
    local v13 = v5();
    local v14 = v13.Semantic.Icon.Size[v12.size];
    local v15 = UDim2.fromOffset(v14, v14);
    local v16 = v12.style or v13.Color.Content.Default;
    return v2.createElement(v3, v8(v12, {
        imageStyle = v16, 
        Image = v12.name, 
        Size = v15, 
        ref = v11, 
        Rotation = v12.Rotation
    }), v12.children);
end));