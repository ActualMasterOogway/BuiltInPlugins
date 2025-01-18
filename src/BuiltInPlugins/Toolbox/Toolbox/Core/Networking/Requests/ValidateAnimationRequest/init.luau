local l_Actions_0 = script.Parent.Parent.Parent.Parent.Core.Actions;
local v1 = require(l_Actions_0.ValidateAnimationResult);
return function(v2) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v2 (copy)
        local function v6(v4) --[[ Line: 14 ]] --[[ Name: onSuccess ]]
            -- upvalues: v3 (copy), v1 (ref)
            local v5 = v4 and v4.responseBody and v4.responseBody.assetType == "Animation" or false;
            v3:dispatch(v1(v5));
        end;
        local function v8(_) --[[ Line: 19 ]] --[[ Name: onFail ]]
            -- upvalues: v3 (copy), v1 (ref)
            v3:dispatch(v1(false));
        end;
        return v2.networkInterface:validateAnimation(v2.assetId):andThen(v6, v8);
    end;
end;