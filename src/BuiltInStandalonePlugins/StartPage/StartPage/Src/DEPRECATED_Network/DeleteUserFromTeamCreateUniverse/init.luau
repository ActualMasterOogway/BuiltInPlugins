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
local v10 = require(l_script_FirstAncestor_0.Src.Util.RemoveHandlerFromNetworkData);
return function(v11, v12, v13) --[[ Line: 30 ]] --[[ Name: DeleteUserFromTeamCreateUniverse ]]
    -- upvalues: l_Url_0 (copy), v4 (copy), v7 (copy), v8 (copy), l_HttpService_0 (copy), v10 (copy)
    local v14 = l_Url_0.new();
    local v15 = {
        userId = v12
    };
    local v16 = v14.composeUrl(v4.TEAMCREATE_MEMBERSHIPS.Prefix, v4.TEAMCREATE_MEMBERSHIPS.Url(v11));
    local v17 = v7:request({
        Method = "DELETE", 
        Url = v16, 
        Headers = v8, 
        Body = l_HttpService_0:JSONEncode(v15)
    });
    v7:parseJson(v17):andThen(function() --[[ Line: 49 ]]
        -- upvalues: v13 (copy), v10 (ref), v11 (copy)
        v13(function(v18) --[[ Line: 50 ]]
            -- upvalues: v10 (ref), v11 (ref)
            return v10(v18, function(v19) --[[ Line: 51 ]]
                -- upvalues: v11 (ref)
                assert(not v19.IsPlaceholder, "Network data should not be a placeholder");
                return v19.Id == v11;
            end);
        end);
    end):catch(function(v20) --[[ Line: 57 ]]
        warn((("DeleteUserFromTeamCreateUniverse experienced an error: %*"):format(v20)));
    end);
end;