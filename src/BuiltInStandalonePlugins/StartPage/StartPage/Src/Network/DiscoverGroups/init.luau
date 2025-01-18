local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local v2 = game:DefineFastFlag("StartPageSortGroups", false);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Models.ApiArrayResponseGroupModel);
local v6 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v8 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local l_Url_0 = v3.RobloxAPI.Url;
local v10 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
local l_collectArray_0 = require(l_script_FirstAncestor_0.Packages.Dash).collectArray;
local v12 = v8(v5.validate);
return function(v13) --[[ Line: 33 ]] --[[ Name: DiscoverGroups ]]
    -- upvalues: l_Url_0 (copy), v6 (copy), v10 (copy), v12 (copy), v2 (copy), l_collectArray_0 (copy)
    local v14 = l_Url_0.new().composeUrl(v6.GROUPS_SEARCH_URL.Prefix, v6.GROUPS_SEARCH_URL.Url());
    local v15 = v10:get(v14);
    v10:parseJson(v15):andThen(function(v16) --[[ Line: 39 ]]
        -- upvalues: v12 (ref), v2 (ref), l_collectArray_0 (ref), v13 (copy)
        local v17 = v12(v16);
        if not v17.data then
            return;
        elseif v2 then
            local v20 = l_collectArray_0(v17.data, function(_, v19) --[[ Line: 47 ]]
                return {
                    DropdownLabel = v19.name, 
                    Key = v19.id, 
                    Query = {
                        creatorTargetId = v19.id
                    }
                };
            end);
            table.sort(v20, function(v21, v22) --[[ Line: 56 ]]
                return v21.DropdownLabel < v22.DropdownLabel;
            end);
            v13(v20);
            return;
        else
            v13(function(_) --[[ Line: 61 ]]
                -- upvalues: l_collectArray_0 (ref), v17 (copy)
                return l_collectArray_0(v17.data, function(_, v25) --[[ Line: 63 ]]
                    return {
                        DropdownLabel = v25.name, 
                        Key = v25.id, 
                        Query = {
                            creatorTargetId = v25.id
                        }
                    };
                end);
            end);
            return;
        end;
    end):catch(function(v26) --[[ Line: 75 ]]
        warn((("DiscoverGroups experienced an error: %*"):format(v26)));
    end);
end;