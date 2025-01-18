local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = {
    Enums = {}
};
local v4 = {
    Insert = "Insert"
};
v3.Enums.EventType = v4;
local v5 = {
    ACTION_INVALID = "ACTION_INVALID", 
    ACTION_DOUBLECLICK = "ACTION_DOUBLECLICK", 
    ACTION_RIGHTCLICK = "ACTION_RIGHTCLICK", 
    ACTION_DRAG = "ACTION_DRAG"
};
v3.Enums.InsertAction = v5;
local v6 = {
    SOURCE_INVALID = "SOURCE_INVALID", 
    SOURCE_BROWSE = "SOURCE_BROWSE", 
    SOURCE_SEARCH = "SOURCE_SEARCH"
};
v3.Enums.InsertSource = v6;
local function v12(v7, v8, v9) --[[ Line: 61 ]] --[[ Name: sendEvent ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v1 (copy)
    if v9 then
        return;
    else
        local v10 = {
            placeId = game.PlaceId, 
            universeId = game.GameId, 
            studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
            clientId = l_RbxAnalyticsService_0:GetClientId()
        };
        local v11 = v1.join(v10, v8);
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "AssetManager", v7, v11);
        return;
    end;
end;
v3.sendInsertEvent = function(v13, v14) --[[ Line: 75 ]]
    -- upvalues: v12 (copy)
    v12("Insert", v13, v14);
end;
return v3;