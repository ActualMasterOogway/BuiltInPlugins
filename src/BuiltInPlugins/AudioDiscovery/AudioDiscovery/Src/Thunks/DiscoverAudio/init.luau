local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.UpdateLocations);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Util.findAllAssetIds);
local l_Dash_0 = v2.Dash;
local l_map_0 = l_Dash_0.map;
local l_forEach_0 = l_Dash_0.forEach;
return function() --[[ Line: 14 ]]
    -- upvalues: v3 (copy), l_map_0 (copy), l_forEach_0 (copy), v1 (copy)
    return function(v7, v8) --[[ Line: 15 ]]
        -- upvalues: v3 (ref), l_map_0 (ref), l_forEach_0 (ref), v1 (ref)
        local v9 = {};
        for v10, v11 in pairs(v3()) do
            v8.SoundAssetChecker:addAssetId(v10);
            v9[v10] = l_map_0(v11, function(v12) --[[ Line: 20 ]]
                return {
                    Instance = v12, 
                    Path = v12:GetFullName()
                };
            end);
        end;
        local l_Rows_0 = v7:getState().Audio.Rows;
        l_forEach_0(l_Rows_0, function(v14) --[[ Line: 30 ]]
            -- upvalues: v9 (copy), v8 (copy)
            if not v9[v14.Id] then
                v9[v14.Id] = {};
                v8.SoundAssetChecker:resolved(v14.Id);
            end;
        end);
        v8.SoundAssetChecker:flush();
        v7:dispatch(v1(v9));
    end;
end;