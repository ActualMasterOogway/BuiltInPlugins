local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Models.ApiArrayResponseUniverseModel);
local v4 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v6 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local v7 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
local l_collectArray_0 = require(l_script_FirstAncestor_0.Packages.Dash).collectArray;
local v9 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
return function(v10) --[[ Line: 29 ]] --[[ Name: DiscoverUniverseData ]]
    -- upvalues: l_collectArray_0 (copy), v4 (copy), v7 (copy), v6 (copy), v3 (copy), v9 (copy)
    if #v10 == 0 then
        return;
    else
        local v13 = {
            ids = l_collectArray_0(v10, function(_, v12) --[[ Line: 34 ]]
                return v12.Id;
            end)
        };
        local v14 = v4.UNIVERSE_DATA.Prefix .. v4.UNIVERSE_DATA.Url() .. "?";
        for _, v16 in v13.ids do
            v14 = v14 .. "ids=" .. v16 .. "&";
        end;
        local v17 = v7:get(v14);
        return v7:parseJson(v17):andThen(v6(v3.validate)):andThen(function(v18) --[[ Line: 50 ]]
            -- upvalues: l_collectArray_0 (ref), v9 (ref)
            local v21 = l_collectArray_0(v18.data, function(_, v20) --[[ Line: 53 ]]
                return {
                    Id = v20.id, 
                    Name = v20.name, 
                    Description = v20.description, 
                    IsArchived = v20.isArchived, 
                    RootPlaceId = v20.rootPlaceId, 
                    PrivacyType = v20.privacyType, 
                    CreatorType = v20.creatorType, 
                    CreatorTargetId = v20.creatorTargetId, 
                    CreatorName = v20.creatorName, 
                    Created = v20.created, 
                    Updated = v20.updated
                };
            end);
            v9:upsertItems(v21);
        end):catch(function(v22) --[[ Line: 71 ]]
            warn((("DiscoverTeamCreateStatus experienced an error: %*"):format(v22)));
        end);
    end;
end;