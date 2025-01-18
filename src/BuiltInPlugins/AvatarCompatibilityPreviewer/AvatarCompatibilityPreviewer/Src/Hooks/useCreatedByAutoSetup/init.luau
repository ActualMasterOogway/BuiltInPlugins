local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useAttribute);
return function(v4) --[[ Line: 9 ]] --[[ Name: useCreatedByAutoSetup ]]
    -- upvalues: v3 (copy), v1 (copy)
    return not not v3(v4, v1.ATTRIBUTE_CREATED_BY_AUTO_SETUP);
end;