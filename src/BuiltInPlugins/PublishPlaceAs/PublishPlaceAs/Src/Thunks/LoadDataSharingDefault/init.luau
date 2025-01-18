local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.AddChange);
local v2 = require(l_Parent_0.Src.Actions.AddErrors);
local v3 = require(l_Parent_0.Src.Network.Requests.ApiFetchUniverseOptOut);
local v4 = require(l_Parent_0.Src.Network.Requests.ApiFetchDataSharingEnabledForUniverse);
local v5 = require(l_Parent_0.Src.Types.DataSharingFetchState);
local v6 = require(l_Parent_0.Packages.Cryo);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
return function() --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), v2 (copy), v3 (copy), l_Promise_0 (copy), v4 (copy)
    return function(v8) --[[ Line: 15 ]]
        -- upvalues: v1 (ref), v5 (ref), v6 (ref), v2 (ref), v3 (ref), l_Promise_0 (ref), v4 (ref)
        v8:dispatch(v1("dataSharingDefault", v5.LOADING));
        v8:dispatch(v1("dataSharingEnabled", v6.None));
        v8:dispatch(v2({
            dataSharingDefault = "Loading"
        }));
        v3():andThen(function(v9, v10) --[[ Line: 24 ]]
            -- upvalues: l_Promise_0 (ref), v8 (copy), v1 (ref), v5 (ref), v4 (ref)
            if not v10 then
                return l_Promise_0.reject();
            elseif game.GameId == 0 then
                local l_isOptOut_0 = v9[1].isOptOut;
                v8:dispatch(v1("dataSharingDefault", v5.FINISHED));
                v8:dispatch(v1("dataSharingEnabled", not l_isOptOut_0));
                return;
            else
                return v4(game.GameId):andThen(function(v12) --[[ Line: 36 ]]
                    -- upvalues: v8 (ref), v1 (ref), v5 (ref)
                    v8:dispatch(v1("dataSharingDefault", v5.FINISHED));
                    v8:dispatch(v1("dataSharingEnabled", v12));
                end);
            end;
        end):catch(function(_) --[[ Line: 40 ]]
            -- upvalues: v8 (copy), v1 (ref), v5 (ref)
            v8:dispatch(v1("dataSharingDefault", v5.ERROR));
        end);
    end;
end;