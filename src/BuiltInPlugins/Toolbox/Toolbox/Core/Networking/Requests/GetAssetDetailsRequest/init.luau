local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.SetAssetConfigData);
local v3 = require(l_Parent_0.Core.Util.firstToUpper);
local v4 = require(l_Parent_0.Core.Actions.NetworkError);
local v5 = require(l_Actions_0.UpdateAssetConfigData);
return function(v6, v7, v8) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy), v2 (copy)
    return function(v9) --[[ Line: 10 ]]
        -- upvalues: v4 (ref), v7 (copy), v3 (ref), v8 (copy), v5 (ref), v2 (ref), v6 (copy)
        local function v11(v10) --[[ Line: 11 ]]
            -- upvalues: v9 (copy), v4 (ref)
            v9:dispatch(v4(v10));
        end;
        local function v17(v12) --[[ Line: 15 ]]
            -- upvalues: v7 (ref), v3 (ref), v8 (ref), v9 (copy), v5 (ref), v2 (ref)
            local l_responseBody_0 = v12.responseBody;
            if l_responseBody_0 and #l_responseBody_0 > 0 and l_responseBody_0[1].assetId == v7 then
                local v14 = {};
                for v15, v16 in pairs(l_responseBody_0[1]) do
                    v14[v3(v15)] = v16;
                end;
                if v8 then
                    v9:dispatch(v5(v14));
                    return;
                else
                    v9:dispatch(v2(v14));
                end;
            end;
        end;
        v6:getAssetCreationDetails({
            v7
        }):andThen(v17, v11);
    end;
end;