local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Models.ApiArrayResponsePlaceModel);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v7 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local v8 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
local l_Url_0 = v4.RobloxAPI.Url;
local v10 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
local l_collectArray_0 = require(l_script_FirstAncestor_0.Packages.Dash).collectArray;
local v12 = v7(v3.validate);
return function(v13) --[[ Line: 35 ]] --[[ Name: DiscoverPlaces ]]
    -- upvalues: l_Url_0 (copy), v5 (copy), v10 (copy), v12 (copy), l_collectArray_0 (copy), v8 (copy)
    local v14 = {
        limit = 50, 
        SortOrder = "Asc"
    };
    for _, v16 in v13 do
        local v17 = l_Url_0.new().composeUrl(v5.PLACES_SEARCH_URL.Prefix, v5.PLACES_SEARCH_URL.Url(v16), v14);
        v10:parseJson(v10:get(v17)):andThen(function(v18) --[[ Line: 46 ]]
            -- upvalues: v12 (ref), l_collectArray_0 (ref), v8 (ref), v16 (copy)
            local v19 = v12(v18);
            if not v19.data then
                return;
            else
                local v22 = l_collectArray_0(v19.data, function(_, v21) --[[ Line: 52 ]]
                    return {
                        Name = v21.name, 
                        Id = v21.id, 
                        UniverseId = v21.universeId, 
                        Description = v21.description
                    };
                end);
                if #v22 > 1 then
                    v8:upsertItem({
                        Id = v16, 
                        Children = v22
                    });
                end;
                return;
            end;
        end):catch(function(v23) --[[ Line: 67 ]]
            warn((("DiscoverPlaces experienced an error: %*"):format(v23)));
        end);
    end;
end;