local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetPlaceInfo);
local v2 = require(l_Parent_0.Src.Actions.SetChoosePlaceQueryState);
local v3 = require(l_Parent_0.Src.Actions.SetSelectedGame);
local v4 = require(l_Parent_0.Src.Network.Requests.ApiFetchPlacesByUniverseId);
local v5 = require(l_Parent_0.Src.Resources.Constants);
local _ = game:GetService("RbxAnalyticsService");
local v7 = nil;
local v8 = {};
return function(v9, v10) --[[ Line: 14 ]]
    -- upvalues: v7 (ref), v3 (copy), v2 (copy), v5 (copy), v4 (copy), v8 (copy), v1 (copy)
    return function(v11) --[[ Line: 15 ]]
        -- upvalues: v10 (copy), v7 (ref), v9 (copy), v3 (ref), v2 (ref), v5 (ref), v4 (ref), v8 (ref), v1 (ref)
        if v10 ~= v7 or not v10 then
            v7 = v10;
            assert(type(v9.name) == "string", "LoadExistingPlaces.parentGame must have a string name");
            assert(type(v9.universeId) == "number", "LoadExistingPlaces.parentGame must have a number universeId");
            v11:dispatch(v3(v9));
            if not v10 then
                v11:dispatch(v2(v5.QUERY_STATE.QUERY_STATE_QUERYING));
            end;
            v4({
                universeId = v9.universeId
            }, {
                cursor = v10
            }):andThen(function(v12) --[[ Line: 33 ]]
                -- upvalues: v9 (ref), v8 (ref), v11 (copy), v1 (ref)
                v12.parentGame = v9;
                for v13 = 1, #v12.places do
                    v8[#v8 + 1] = v12.places[v13];
                end;
                v12.places = v8;
                v11:dispatch(v1(v12));
            end, function(_) --[[ Line: 41 ]]
                -- upvalues: v11 (copy), v2 (ref), v5 (ref)
                v11:dispatch(v2(v5.QUERY_STATE.QUERY_STATE_FAILED));
            end);
        end;
    end;
end;