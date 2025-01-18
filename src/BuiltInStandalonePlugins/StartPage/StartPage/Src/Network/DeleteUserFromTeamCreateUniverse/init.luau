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
local v8 = {
    ["Content-Type"] = "application/json"
};
local l_HttpService_0 = game:GetService("HttpService");
local v10 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
return function(v11, v12) --[[ Line: 30 ]] --[[ Name: DeleteUserFromTeamCreateUniverse ]]
    -- upvalues: l_Url_0 (copy), v4 (copy), v7 (copy), v8 (copy), l_HttpService_0 (copy), v10 (copy)
    local v13 = l_Url_0.new();
    local v14 = {
        userId = v12
    };
    local v15 = v13.composeUrl(v4.TEAMCREATE_MEMBERSHIPS.Prefix, v4.TEAMCREATE_MEMBERSHIPS.Url(v11));
    v7:request({
        Method = "DELETE", 
        Url = v15, 
        Headers = v8, 
        Body = l_HttpService_0:JSONEncode(v14)
    }):andThen(function() --[[ Line: 42 ]]
        -- upvalues: v10 (ref), v11 (copy)
        v10:deleteItem((tostring(v11)));
    end);
end;