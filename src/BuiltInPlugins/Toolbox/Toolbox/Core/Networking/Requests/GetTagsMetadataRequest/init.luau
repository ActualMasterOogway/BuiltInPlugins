local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.SetTagsMetadata);
local v2 = require(l_Parent_0.Core.Util.DebugFlags);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (copy)
        local function v9(v5) --[[ Line: 9 ]]
            -- upvalues: v4 (copy), v1 (ref)
            local v6 = v5.responseBody and v5.responseBody.isItemTagsFeatureEnabled == true;
            local v7 = v5.responseBody and v5.responseBody.enabledAssetTypes or {};
            local v8 = v5.responseBody and v5.responseBody.maximumItemTagsPerItem or 0;
            v4:dispatch(v1(v6, v7, v8));
        end;
        local function v11(_) --[[ Line: 17 ]]
            -- upvalues: v2 (ref)
            if v2.shouldDebugWarnings() then
                warn("Lua toolbox: Could not get tags metadata");
            end;
        end;
        return v3:getTagsMetadata():andThen(v9, v11);
    end;
end;