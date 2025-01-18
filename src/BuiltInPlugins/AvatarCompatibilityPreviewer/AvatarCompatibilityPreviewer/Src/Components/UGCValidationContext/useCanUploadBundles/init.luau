local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useAssertNeverChanges);
return function(v4) --[[ Line: 11 ]] --[[ Name: useCanUploadBundles ]]
    -- upvalues: v3 (copy), v1 (copy)
    v3(v4);
    local v5, v6 = v1.useState(nil);
    local v7 = v1.useRef(false);
    return v5, (v1.useCallback(function() --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v6 (copy), v4 (copy)
        if v7.current then
            return;
        else
            v7.current = true;
            task.spawn(function() --[[ Line: 26 ]]
                -- upvalues: v6 (ref), v4 (ref)
                v6(v4());
            end);
            return;
        end;
    end, {}));
end;