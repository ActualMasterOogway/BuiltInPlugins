local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = game:DefineFastInt("MaxAccessPermissionsCollaborators", 200);
local function _() --[[ Line: 19 ]] --[[ Name: getStudioSession ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    local v5 = nil;
    pcall(function() --[[ Line: 21 ]]
        -- upvalues: v5 (ref), l_RbxAnalyticsService_0 (ref)
        v5 = l_RbxAnalyticsService_0:GetSessionId();
    end);
    return v5;
end;
local function _() --[[ Line: 27 ]] --[[ Name: getStudioId ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    local v7 = nil;
    pcall(function() --[[ Line: 29 ]]
        -- upvalues: v7 (ref), l_RbxAnalyticsService_0 (ref)
        v7 = l_RbxAnalyticsService_0:GetClientId();
    end);
    return v7;
end;
local v15 = {
    print = function(_, _, _) --[[ Line: 38 ]] --[[ Name: print ]]

    end, 
    printTable = function(_, _, _) --[[ Line: 44 ]] --[[ Name: printTable ]]

    end
};
v15.reportCounter = function(v16, v17) --[[ Line: 51 ]] --[[ Name: reportCounter ]]
    -- upvalues: v15 (copy), l_RbxAnalyticsService_0 (copy)
    v15.print("reportCounter", v16, v17 or 1);
    l_RbxAnalyticsService_0:ReportCounter(v16, v17 or 1);
end;
v15.reportStats = function(v18, v19) --[[ Line: 56 ]] --[[ Name: reportStats ]]
    -- upvalues: v15 (copy), l_RbxAnalyticsService_0 (copy)
    v15.print("reportStats", v18, v19);
    l_RbxAnalyticsService_0:ReportStats(v18, v19);
end;
v15.sendEventDeferred = function(v20, v21) --[[ Line: 61 ]] --[[ Name: sendEventDeferred ]]
    -- upvalues: v15 (copy), l_HttpService_0 (copy), v3 (copy), l_RbxAnalyticsService_0 (copy)
    v15.printTable("sendEventDeferred", v20, l_HttpService_0:JSONEncode(v21));
    local l_join_0 = v3.Dictionary.join;
    local l_v21_0 = v21;
    local v24 = {};
    local v25 = nil;
    local v26;
    do
        local l_v25_0 = v25;
        pcall(function() --[[ Line: 29 ]]
            -- upvalues: l_v25_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v25_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v26 = l_v25_0;
    end;
    v24.uid = v26;
    v25 = nil;
    do
        local l_v25_1 = v25;
        pcall(function() --[[ Line: 21 ]]
            -- upvalues: l_v25_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v25_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v26 = l_v25_1;
    end;
    v24.sid = v26;
    v24.pid = game.PlaceId;
    l_join_0 = l_join_0(l_v21_0, v24);
    l_RbxAnalyticsService_0:SendEventDeferred("studio", "gameSettings", v20, l_join_0);
end;
v15.onSettingSaved = function(v29, v30) --[[ Line: 72 ]] --[[ Name: onSettingSaved ]]
    -- upvalues: v15 (copy)
    v15.reportCounter(string.format("GameSettings_SettingSaved_%s", v29));
    if typeof(v30) == "boolean" then
        local v31 = v30 and "Enabled" or "Disabled";
        v15.reportCounter(string.format("GameSettings_Setting%s_%s", v31, v29));
        return;
    else
        if typeof(v30) == "string" then
            v15.reportStats(string.format("GameSettings_StringSettingLength_%s", v29), v30:len());
        end;
        return;
    end;
end;
v15.onPageLoadAttempt = function(v32) --[[ Line: 87 ]] --[[ Name: onPageLoadAttempt ]]
    -- upvalues: v15 (copy)
    v15.reportCounter(string.format("GameSettings_PageLoadAttempt_%s", v32));
end;
v15.onPageLoadSuccess = function(v33, v34) --[[ Line: 91 ]] --[[ Name: onPageLoadSuccess ]]
    -- upvalues: v15 (copy)
    v15.reportCounter(string.format("GameSettings_PageLoadSuccess_%s", v33));
    v15.reportStats(string.format("GameSettings_PageLoadTime_Success_%s", v33), v34);
end;
v15.onPageLoadError = function(v35, v36) --[[ Line: 96 ]] --[[ Name: onPageLoadError ]]
    -- upvalues: v15 (copy)
    v15.reportCounter(string.format("GameSettings_PageLoadError_%s", v35));
    v15.reportStats(string.format("GameSettings_PageLoadTime_Error_%s", v35), v36);
end;
v15.onSaveAttempt = function() --[[ Line: 101 ]] --[[ Name: onSaveAttempt ]]
    -- upvalues: v15 (copy)
    v15.reportCounter("GameSettings_SaveAttempt");
end;
v15.onSaveSuccess = function(v37) --[[ Line: 105 ]] --[[ Name: onSaveSuccess ]]
    -- upvalues: v15 (copy)
    v15.reportCounter("GameSettings_SaveSuccess");
    v15.reportStats("GameSettings_SaveTime_Success", v37);
end;
v15.onSaveError = function(v38) --[[ Line: 110 ]] --[[ Name: onSaveError ]]
    -- upvalues: v15 (copy)
    v15.reportCounter("GameSettings_SaveError");
    v15.reportStats("GameSettings_SaveTime_Error", v38);
end;
v15.onPageSaveError = function(v39) --[[ Line: 115 ]] --[[ Name: onPageSaveError ]]
    -- upvalues: v15 (copy)
    v15.reportCounter(string.format("GameSettings_PageSaveError_%s", v39));
end;
v15.onOpenEvent = function(v40, v41) --[[ Line: 119 ]] --[[ Name: onOpenEvent ]]
    -- upvalues: v15 (copy)
    v15.sendEventDeferred("gameSettingsOpen", {});
    v15.sendEventDeferred("toolOpened", {
        method = 1, 
        uid = v40, 
        gameId = v41
    });
end;
v15.onCloseEvent = function(v42, v43) --[[ Line: 129 ]] --[[ Name: onCloseEvent ]]
    -- upvalues: v15 (copy)
    v15.sendEventDeferred("gameSettingsClose", {
        buttonSelected = v42, 
        timeOpen = string.format("%f", v43)
    });
end;
v15.onTabChangeEvent = function(v44, v45) --[[ Line: 136 ]] --[[ Name: onTabChangeEvent ]]
    -- upvalues: v15 (copy)
    if v44 and v45 then
        v15.sendEventDeferred("gameSettingsTabChange", {
            oldTab = v44, 
            newTab = v45
        });
    end;
end;
v15.numberOfUsers = function(v46, v47) --[[ Line: 145 ]] --[[ Name: numberOfUsers ]]
    -- upvalues: v15 (copy)
    v15.sendEventDeferred(string.format("GameSettings_%s_UserCount", v47), {
        uid = v46, 
        gameId = game.GameId
    });
end;
v15.onPermissionGiven = function(v48, v49, v50) --[[ Line: 152 ]] --[[ Name: onPermissionGiven ]]
    -- upvalues: v15 (copy)
    v15.sendEventDeferred(string.format("GameSettings_%s%sGiven", v49, v50), {
        uid = v48, 
        gameId = game.GameId
    });
end;
v15.onPermissionRemoved = function(v51, v52, v53) --[[ Line: 159 ]] --[[ Name: onPermissionRemoved ]]
    -- upvalues: v15 (copy)
    v15.sendEventDeferred(string.format("GameSettings_%s%sRemoved", v52, v53), {
        uid = v51, 
        gameId = game.GameId
    });
end;
v15.onUserAdded = function() --[[ Line: 166 ]] --[[ Name: onUserAdded ]]
    -- upvalues: v15 (copy)
    v15.reportCounter("GameSettings_AccessPermissions_UserAdded");
end;
v15.onUserRemoved = function() --[[ Line: 170 ]] --[[ Name: onUserRemoved ]]
    -- upvalues: v15 (copy)
    v15.reportCounter("GameSettings_AccessPermissions_UserRemoved");
end;
v15.onGroupAdded = function() --[[ Line: 174 ]] --[[ Name: onGroupAdded ]]
    -- upvalues: v15 (copy)
    v15.reportCounter("GameSettings_AccessPermissions_GroupAdded");
end;
v15.onGroupRemoved = function() --[[ Line: 178 ]] --[[ Name: onGroupRemoved ]]
    -- upvalues: v15 (copy)
    v15.reportCounter("GameSettings_AccessPermissions_GroupRemoved");
end;
v15.onPermissionFailed = function() --[[ Line: 182 ]] --[[ Name: onPermissionFailed ]]
    -- upvalues: v15 (copy)
    v15.reportCounter("GameSettings_AccessPermissions_Failed");
end;
v15.onNumCollaboratorsChanged = function(v54) --[[ Line: 186 ]] --[[ Name: onNumCollaboratorsChanged ]]
    -- upvalues: v4 (copy), v15 (copy)
    for _, v56 in pairs({
        1, 
        0.75, 
        0.5, 
        0.25
    }) do
        if v56 * v4 <= v54 then
            v15.reportCounter("GameSettings_AccessPermissions_NumCollaboratorThreshold_" .. math.floor(v56 * 100));
            break;
        end;
    end;
    v15.sendEventDeferred("GameSettings_AccessPermissions_NumCollaborators", {
        gameId = game.GameId, 
        numCollaborators = v54
    });
end;
v15.onSecuritySettingChange = function(v57, v58) --[[ Line: 206 ]] --[[ Name: onSecuritySettingChange ]]
    -- upvalues: v15 (copy)
    v15.sendEventDeferred("GameSettings_SecuritySettingChange", {
        settingName = v57, 
        settingValue = v58
    });
end;
return v15;