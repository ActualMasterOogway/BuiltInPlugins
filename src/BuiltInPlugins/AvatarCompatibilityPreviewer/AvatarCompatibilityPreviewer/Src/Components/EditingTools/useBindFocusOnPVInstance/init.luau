local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.DraggerFramework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_BoundingBox_0 = v2.Utility.BoundingBox;
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v6) --[[ Line: 13 ]] --[[ Name: useBindFocusOnPVInstance ]]
    -- upvalues: v3 (copy), l_Selection_0 (copy), v5 (copy), l_BoundingBox_0 (copy)
    v3.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: l_Selection_0 (ref), v5 (ref), l_BoundingBox_0 (ref), v6 (copy)
        local v9 = l_Selection_0:AddFocusCallback(v5.FOCUS_CALLBACK_PRIORITIES.Dummy, function() --[[ Line: 15 ]]
            -- upvalues: l_BoundingBox_0 (ref), v6 (ref)
            local v7, v8 = l_BoundingBox_0.fromObjects({
                v6
            });
            return v7 - v8 * 0.5, v7 + v8 * 0.5;
        end);
        return function() --[[ Line: 20 ]]
            -- upvalues: v9 (copy)
            v9:Disconnect();
        end;
    end, {
        v6
    });
end;