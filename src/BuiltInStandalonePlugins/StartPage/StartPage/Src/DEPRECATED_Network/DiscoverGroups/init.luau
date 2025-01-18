local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Models.ApiArrayResponseGroupModel);
local v5 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v7 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local l_Url_0 = v2.RobloxAPI.Url;
local v9 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
local l_collectArray_0 = require(l_script_FirstAncestor_0.Src.Util.TypedDash).collectArray;
return function(v11) --[[ Line: 30 ]] --[[ Name: DiscoverGroups ]]
    -- upvalues: l_Url_0 (copy), v5 (copy), v9 (copy), v7 (copy), v4 (copy), l_collectArray_0 (copy)
    local v12 = l_Url_0.new().composeUrl(v5.GROUPS_SEARCH_URL.Prefix, v5.GROUPS_SEARCH_URL.Url());
    local v13 = v9:get(v12);
    v9:parseJson(v13):andThen(v7(v4.validate)):andThen(function(v14) --[[ Line: 37 ]]
        -- upvalues: v11 (copy), l_collectArray_0 (ref)
        if not v14.data then
            return;
        else
            v11(function(_) --[[ Line: 42 ]]
                -- upvalues: l_collectArray_0 (ref), v14 (copy)
                return l_collectArray_0(v14.data, function(_, v17) --[[ Line: 44 ]]
                    return {
                        DropdownLabel = v17.name, 
                        Key = v17.id, 
                        Query = {
                            creatorTargetId = v17.id
                        }
                    };
                end);
            end);
            return;
        end;
    end):catch(function(v18) --[[ Line: 55 ]]
        warn((("DiscoverGroups experienced an error: %*"):format(v18)));
    end);
end;