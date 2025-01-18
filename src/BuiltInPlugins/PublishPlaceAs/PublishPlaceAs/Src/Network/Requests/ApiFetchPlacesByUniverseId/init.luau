local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v3 = require(l_Parent_0.Src.Network.Models.PlaceToPublish);
local v4 = require(l_Parent_0.Src.Network.Http);
return function(v5, v6) --[[ Line: 12 ]]
    -- upvalues: l_Promise_0 (copy), v4 (copy), l_HttpService_0 (copy), v3 (copy)
    local l_universeId_0 = v5.universeId;
    if not l_universeId_0 then
        return l_Promise_0.reject("NO UNIVERSE ID - ApiFetchPlacesByGameId");
    else
        local v8 = v6.limit or 10;
        local v9 = v6.sortOrder or "Asc";
        local l_cursor_0 = v6.cursor;
        local v11 = {
            Url = v4.BuildRobloxUrl("develop", "v1/universes/%d/places", l_universeId_0), 
            Method = "GET", 
            Params = {
                sortOrder = v9, 
                limit = v8, 
                cursor = l_cursor_0
            }
        };
        return v4.Request(v11):andThen(function(v12) --[[ Line: 29 ]]
            -- upvalues: l_HttpService_0 (ref), v3 (ref)
            local v13 = l_HttpService_0:JSONDecode(v12);
            local v14 = {};
            if v13.previousPageCursor then
                v14.previousPageCursor = v13.previousPageCursor;
            end;
            if v13.nextPageCursor then
                v14.nextPageCursor = v13.nextPageCursor;
            end;
            v14.places = {};
            for _, v16 in pairs(v13.data) do
                local v17, v18 = v3.fromJsonData(v16);
                if v17 then
                    table.insert(v14.places, v18);
                else
                    error("Parsing error for ApiFetchPlacesByUniverseId: " .. v18);
                end;
            end;
            return v14;
        end);
    end;
end;