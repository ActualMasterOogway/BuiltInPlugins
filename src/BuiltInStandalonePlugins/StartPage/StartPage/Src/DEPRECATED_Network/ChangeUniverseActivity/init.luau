local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local l_Url_0 = v3.RobloxAPI.Url;
local v7 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
return function(v8, v9, v10) --[[ Line: 22 ]] --[[ Name: ChangeUniverseActivity ]]
    -- upvalues: l_Url_0 (copy), v4 (copy), v7 (copy)
    local v11 = l_Url_0.new();
    local v12 = nil;
    v12 = if v9 == "Private" then v11.composeUrl(v4.ACTIVATE_UNIVERSE.Prefix, v4.ACTIVATE_UNIVERSE.Url(v8)) else v11.composeUrl(v4.DEACTIVATE_UNIVERSE.Prefix, v4.DEACTIVATE_UNIVERSE.Url(v8));
    local v13 = v7:post(v12, "");
    v7:parseJson(v13):andThen(function() --[[ Line: 38 ]]
        -- upvalues: v10 (copy), v8 (copy), v9 (copy)
        v10(function(v14) --[[ Line: 39 ]]
            -- upvalues: v8 (ref), v9 (ref)
            local v15 = table.clone(v14);
            for _, v17 in v15 do
                for _, v19 in v17.pages do
                    for _, v21 in v19 do
                        assert(not v21.IsPlaceholder, "Network data shouldn't be a placeholder");
                        if v21.Id == v8 then
                            v21.PrivacyType = v9 == "Private" and "Public" or "Private";
                        end;
                    end;
                end;
            end;
            return v15;
        end);
    end):catch(function(v22) --[[ Line: 58 ]]
        warn((("ChangeUniverseActivity experienced an error: %*"):format(v22)));
    end);
end;