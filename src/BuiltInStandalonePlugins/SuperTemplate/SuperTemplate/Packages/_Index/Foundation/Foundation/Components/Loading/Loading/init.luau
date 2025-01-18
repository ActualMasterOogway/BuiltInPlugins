local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useClock_0 = require(l_Parent_0.ReactUtils).useClock;
local v4 = require(l_script_FirstAncestor_0.Components.Icon);
local v5 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v7 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v10 = {
    size = v5.Large
};
return v2.memo(v2.forwardRef(function(v11, v12) --[[ Line: 25 ]] --[[ Name: Loading ]]
    -- upvalues: v7 (copy), v10 (copy), l_useClock_0 (copy), v6 (copy), v2 (copy), v4 (copy), v9 (copy)
    local v13 = v7(v11, v10);
    local v14 = l_useClock_0();
    local v15 = v6();
    return v2.createElement(v4, v9(v13, {
        name = "icons/graphic/loadingspinner", 
        size = v13.size, 
        style = v15.DarkMode.Content.Emphasis, 
        Rotation = v14:map(function(v16) --[[ Line: 36 ]]
            return v16 * 360;
        end), 
        ref = v12
    }));
end));