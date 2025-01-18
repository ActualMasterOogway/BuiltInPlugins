local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.Util.TypedPromise);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.TestLoader);
local l_Signal_0 = v3.Util.Signal;
local l_assign_0 = v2.assign;
local v7 = require(l_script_FirstAncestor_0.Src.Util.TypedNetworking);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v11(v9) --[[ Line: 53 ]] --[[ Name: resetRbxAnalyticsService ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_assign_0 (copy)
    local l_jest_0 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals).jest;
    return l_assign_0(v9, {
        GetClientId = l_jest_0.fn(), 
        GetSessionId = l_jest_0.fn()
    });
end;
local function v14(v12) --[[ Line: 63 ]] --[[ Name: resetStartPageManager ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_assign_0 (copy), l_Signal_0 (copy)
    local l_jest_1 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals).jest;
    return l_assign_0(v12, {
        openLink = l_jest_1.fn(), 
        openLocalFile = l_jest_1.fn(), 
        openPlace = l_jest_1.fn(), 
        getStartPageVersionForUser = l_jest_1.fn(), 
        generateTempUrlInContentProvider = l_jest_1.fn(), 
        getDaysSinceFirstUserLogin = l_jest_1.fn(), 
        isTutorialBannerClosed = l_jest_1.fn(), 
        setTutorialBannerClosed = l_jest_1.fn(), 
        isTutorialPopupClosed = l_jest_1.fn(), 
        setTutorialPopupClosed = l_jest_1.fn(), 
        startTutorial = l_jest_1.fn(), 
        removeAPIGameFromRegistry = l_jest_1.fn(), 
        removeLocalFileFromRegistry = l_jest_1.fn(), 
        getRecentAPIGamesFromRegistry = l_jest_1.fn(), 
        getLocalGamesFromRegistry = l_jest_1.fn(), 
        LocalGamesFromRegistryUpdatedSignal = l_Signal_0.new(), 
        RecentApiGamesFromRegistryUpdatedSignal = l_Signal_0.new(), 
        ImageImportedSignal = l_Signal_0.new()
    });
end;
local function v18(v15, v16) --[[ Line: 89 ]] --[[ Name: resetStudioService ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_assign_0 (copy)
    local l_jest_2 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals).jest;
    return l_assign_0(v15, {
        GetUserId = l_jest_2.fn(), 
        HasInternalPermission = l_jest_2.fn(function() --[[ Line: 95 ]]
            -- upvalues: v16 (copy)
            if v16 then
                return true;
            else
                return false;
            end;
        end)
    });
end;
local v21 = {
    GetUserId = function(_) --[[ Line: 102 ]] --[[ Name: GetUserId ]]
        return -1;
    end, 
    HasInternalPermission = function(_) --[[ Line: 105 ]] --[[ Name: HasInternalPermission ]]
        return false;
    end
};
local v22 = {
    IsLoggedIn = true
};
resetStudioUserServiceMock = function(v23, v24) --[[ Line: 115 ]] --[[ Name: resetStudioUserServiceMock ]]
    v23.IsLoggedIn = v24 and true or false;
end;
local v25 = {
    apis = {}
};
v25.new = function() --[[ Line: 123 ]] --[[ Name: new ]]
    -- upvalues: v25 (copy)
    return (setmetatable({}, {
        __index = v25
    }));
end;
v25.parseJson = function(_, v27) --[[ Line: 126 ]] --[[ Name: parseJson ]]
    return v27;
end;
v25.request = function(v28, v29) --[[ Line: 129 ]] --[[ Name: request ]]
    -- upvalues: v1 (copy)
    if v28.apis[v29.Url] then
        local v30 = v28.apis[v29.Url];
        local v31 = if typeof(v30) == "function" then v30(v29.Body) else v30;
        return v1.resolve({
            responseBody = v31, 
            requestOptions = v29
        });
    else
        error((("Unexpected url: %*"):format(v29.Url)));
        return;
    end;
end;
v25.delete = function(v32, v33, v34) --[[ Line: 142 ]] --[[ Name: delete ]]
    return v32:request({
        Url = v33, 
        Method = "DELETE", 
        Headers = v34
    });
end;
v25.get = function(v35, v36, v37) --[[ Line: 149 ]] --[[ Name: get ]]
    return v35:request({
        Url = v36, 
        Method = "GET", 
        Headers = v37
    });
end;
v25.patch = function(v38, v39, v40, v41) --[[ Line: 156 ]] --[[ Name: patch ]]
    return v38:request({
        Url = v39, 
        Method = "PATCH", 
        Headers = v41, 
        Body = v40
    });
end;
v25.post = function(v42, v43, v44, v45) --[[ Line: 164 ]] --[[ Name: post ]]
    return v42:request({
        Url = v43, 
        Method = "POST", 
        Headers = v45, 
        Body = v44
    });
end;
v25.put = function(v46, v47, v48) --[[ Line: 172 ]] --[[ Name: put ]]
    return v46:request({
        Url = v47, 
        Method = "PUT", 
        Headers = v48
    });
end;
local function _(v49, v50) --[[ Line: 181 ]] --[[ Name: resetNetworking ]]
    v49.apis = v50;
end;
local v52 = nil;
v52 = {
    Networking = if v4.isCli() then v25 else v7, 
    RbxAnalyticsService = if v4.isCli() then {} else game:GetService("RbxAnalyticsService"), 
    StartPageManager = if v4.isCli() then {} else game:GetService("StartPageService"), 
    StudioService = if v4.isCli() then v21 else game:GetService("StudioService"), 
    StudioUserService = if v4.isCli() then v22 else game:GetService("StudioUserService"), 
    mock = function(v53, v54, v55) --[[ Line: 205 ]] --[[ Name: mock ]]
        -- upvalues: v11 (copy), v52 (ref), v14 (copy), v18 (copy)
        v11(v52.RbxAnalyticsService);
        v14(v52.StartPageManager);
        v18(v52.StudioService, v54);
        resetStudioUserServiceMock(v52.StudioUserService, v55);
        v52.Networking.apis = v53;
    end
};
return v52;