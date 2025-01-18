local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local l_webKeys_0 = require(l_Parent_0.Core.Util.Permissions.Constants).webKeys;
return function(v4, v5) --[[ Line: 8 ]]
    -- upvalues: l_webKeys_0 (copy), v1 (copy), v2 (copy)
    return function(v6) --[[ Line: 9 ]]
        -- upvalues: l_webKeys_0 (ref), v4 (copy), v5 (copy), v1 (ref), v2 (ref)
        local v7 = {
            [l_webKeys_0.SubjectType] = l_webKeys_0.All, 
            [l_webKeys_0.SubjectId] = "", 
            [l_webKeys_0.Action] = l_webKeys_0.UseAction
        };
        return v4:grantAssetPermissions(v5, v7):andThen(function() --[[ Line: 15 ]]

        end, function(v8) --[[ Line: 15 ]]
            -- upvalues: v1 (ref), v6 (copy), v2 (ref)
            if v1.shouldDebugWarnings() then
                warn("Patch make asset public unsuccessful");
            end;
            v6:dispatch(v2(v8));
        end);
    end;
end;