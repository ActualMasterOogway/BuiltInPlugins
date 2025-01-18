local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_VIEW_ID_0 = require(l_Parent_0.Src.Util.Constants).VIEW_ID;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.SetView);
local v6 = require(l_Actions_0.SetRBXParameters);
local v7 = require(l_Actions_0.SetTheme);
local v8 = require(l_Actions_0.SetMemStoragePair);
local v9 = require(l_Actions_0.ClearMemStoragePair);
local v10 = require(l_Actions_0.ClearRBXParameters);
local v11 = require(l_Actions_0.ChangeCurrentEventName);
return v1.createReducer({
    ActiveView = l_VIEW_ID_0.RBXEvent, 
    Parameters = {
        Namespace = "UpdateNotificationBadge", 
        Detail = "{\"badgeString\": \"1\"}", 
        DetailType = "NotificationIcon"
    }, 
    ThemeName = "dark", 
    MemStoragePair = {
        Key = "ThemeUpdate", 
        Value = "dark"
    }, 
    CurrentEventName = l_VIEW_ID_0.RBXEvent
}, {
    [v5.name] = function(v12, v13) --[[ Line: 35 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v12, {
            ActiveView = v13.view
        });
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 40 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v14, {
            Parameters = v15.parameters
        });
    end, 
    [v7.name] = function(v16, v17) --[[ Line: 45 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v16, {
            ThemeName = v17.themeName
        });
    end, 
    [v8.name] = function(v18, v19) --[[ Line: 50 ]]
        -- upvalues: v2 (copy)
        local v20 = {
            Key = v19.pair.Key or v18.MemStoragePair.Key, 
            Value = v19.pair.Value or v18.MemStoragePair.Value
        };
        return v2.Dictionary.join(v18, {
            MemStoragePair = v20
        });
    end, 
    [v9.name] = function(v21, _) --[[ Line: 60 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v21, {
            MemStoragePair = {
                Key = "", 
                Value = ""
            }
        });
    end, 
    [v10.name] = function(v23, _) --[[ Line: 68 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v23, {
            Parameters = {
                Detail = "", 
                Namespace = "", 
                DetailType = ""
            }
        });
    end, 
    [v11.name] = function(v25, v26) --[[ Line: 77 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v25, {
            CurrentEventName = v26.name
        });
    end
});