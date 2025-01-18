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
local v8 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
return function(v9, v10) --[[ Line: 24 ]] --[[ Name: ChangeUniverseActivity ]]
    -- upvalues: l_Url_0 (copy), v4 (copy), v7 (copy), v8 (copy)
    local v11 = l_Url_0.new();
    local v12 = nil;
    v12 = if v10 == "Private" then v11.composeUrl(v4.ACTIVATE_UNIVERSE.Prefix, v4.ACTIVATE_UNIVERSE.Url(v9)) else v11.composeUrl(v4.DEACTIVATE_UNIVERSE.Prefix, v4.DEACTIVATE_UNIVERSE.Url(v9));
    v7:post(v12, ""):andThen(function() --[[ Line: 36 ]]
        -- upvalues: v8 (ref), v9 (copy), v10 (copy)
        v8:upsertItem({
            Id = v9, 
            PrivacyType = v10 == "Private" and "Public" or "Private"
        });
    end);
end;