local l_Actions_0 = script.Parent.Parent.Parent.Parent.Core.Actions;
local v1 = require(l_Actions_0.SetAssetConfigThumbnailStatus);
local v2 = require(l_Actions_0.NetworkError);
return function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (copy), v4 (copy)
        local function v7(v6) --[[ Line: 10 ]]
            -- upvalues: v5 (copy), v2 (ref)
            v5:dispatch(v2(v6));
        end;
        local function v10(v8) --[[ Line: 14 ]]
            -- upvalues: v5 (copy), v1 (ref)
            local l_responseBody_0 = v8.responseBody;
            v5:dispatch(v1(l_responseBody_0.data[1].state));
        end;
        v3:getThumbnailStatus(v4):andThen(v10, v7);
    end;
end;