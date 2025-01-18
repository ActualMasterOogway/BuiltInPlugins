local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Models.ApiArrayResponsePlaceModel);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v7 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local l_Url_0 = v4.RobloxAPI.Url;
local v9 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
local l_collectArray_0 = require(l_script_FirstAncestor_0.Src.Util.TypedDash).collectArray;
return function(v11) --[[ Line: 35 ]] --[[ Name: DiscoverPlaces ]]
    -- upvalues: l_Url_0 (copy), v5 (copy), v9 (copy), v7 (copy), v3 (copy), l_collectArray_0 (copy)
    local v12 = {
        limit = 50, 
        SortOrder = "Asc"
    };
    for _, v14 in v11.gameIds do
        local v15 = l_Url_0.new().composeUrl(v5.PLACES_SEARCH_URL.Prefix, v5.PLACES_SEARCH_URL.Url(v14), v12);
        local v16 = v9:get(v15);
        v9:parseJson(v16):andThen(v7(v3.validate)):andThen(function(v17) --[[ Line: 48 ]]
            -- upvalues: l_collectArray_0 (ref)
            if not v17.data then
                return {};
            else
                return l_collectArray_0(v17.data, function(_, v19) --[[ Line: 53 ]]
                    return {
                        Name = v19.name, 
                        Id = v19.id, 
                        UniverseId = v19.universeId, 
                        Description = v19.description
                    };
                end);
            end;
        end):andThen(function(v20) --[[ Line: 62 ]]
            -- upvalues: v11 (copy), v14 (copy)
            v11.setter(function(v21) --[[ Line: 63 ]]
                -- upvalues: v14 (ref), v20 (copy)
                for _, v23 in v21 do
                    assert(not v23.IsPlaceholder, "Data returned from network should not be a placeholder sentinel value");
                    if v23.Id == v14 and #v20 > 1 then
                        v23.Children = v20;
                    end;
                end;
                return v21;
            end);
        end):catch(function(v24) --[[ Line: 77 ]]
            warn((("DiscoverPlaces experienced an error: %*"):format(v24)));
        end);
    end;
    return v11;
end;