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
local v9 = {
    ["Content-Type"] = "application/json"
};
local l_HttpService_0 = game:GetService("HttpService");
return function(v11, v12) --[[ Line: 29 ]] --[[ Name: ChangeArchiveConfiguration ]]
    -- upvalues: l_Url_0 (copy), v4 (copy), v7 (copy), l_HttpService_0 (copy), v9 (copy), v8 (copy)
    local v13 = l_Url_0.new().composeUrl(v4.UNIVERSE_CONFIGURATION.Prefix, v4.UNIVERSE_CONFIGURATION.Url(v11));
    local v14 = {
        isArchived = v12
    };
    local v15 = v7:patch(v13, l_HttpService_0:JSONEncode(v14), v9);
    v7:parseJson(v15):andThen(function() --[[ Line: 38 ]]
        -- upvalues: v8 (ref), v11 (copy)
        v8:deleteItem((tostring(v11)));
    end):catch(function(v16) --[[ Line: 41 ]]
        warn((("ChargeArchiveConfiguration experienced an error: %*"):format(v16)));
    end);
end;