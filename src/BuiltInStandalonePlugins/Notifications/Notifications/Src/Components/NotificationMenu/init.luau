local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Dash);
local l_reduce_0 = v3.reduce;
local l_map_0 = v3.map;
local v6 = v2.RobloxAPI.Url.new();
local l_Localization_0 = v2.ContextServices.Localization;
local l_CaptureFocus_0 = v2.UI.CaptureFocus;
local l_GuiService_0 = game:GetService("GuiService");
local l_TextService_0 = game:GetService("TextService");
local v11 = require(l_Parent_0.Src.Contexts.NotificationsContext);
local v12 = require(l_Parent_0.Src.Contexts.AnalyticsContext);
local v13 = require(l_Parent_0.Src.Components.NotificationMenu.constants);
local v14 = v6.composeUrl(v6.CREATOR_HUB_URL, "settings/notifications");
return function(v15) --[[ Line: 26 ]] --[[ Name: NotificationMenu ]]
    -- upvalues: l_Localization_0 (copy), v12 (copy), v1 (copy), v11 (copy), l_map_0 (copy), v13 (copy), l_reduce_0 (copy), l_TextService_0 (copy), l_GuiService_0 (copy), v14 (copy), l_CaptureFocus_0 (copy)
    local v16 = l_Localization_0:use();
    local v17 = v12:use();
    local v18 = v1.useContext(v11);
    local v20 = v1.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: l_map_0 (ref), v13 (ref), v16 (copy)
        return l_map_0(v13.MENU_OPTIONS, function(v19) --[[ Line: 32 ]]
            -- upvalues: v16 (ref)
            return v16:getText("Header", v19);
        end);
    end, {
        v16
    });
    local v23 = v1.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: l_reduce_0 (ref), v13 (ref), l_TextService_0 (ref), v16 (copy)
        return l_reduce_0(v13.MENU_OPTIONS, function(v21, v22) --[[ Line: 42 ]]
            -- upvalues: l_TextService_0 (ref), v16 (ref), v13 (ref)
            return (math.max(v21, l_TextService_0:GetTextSize(v16:getText("Header", v22), v13.TEXT_SIZE, v13.TEXT_FONT, Vector2.new(1e999, 1e999)).X + v13.TEXT_WIDTH_PADDING));
        end, 0);
    end, v20);
    local v24 = v1.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v23 (copy), v13 (ref)
        return v23 - v13.BORDER_SIZE * 2;
    end, {
        v23
    });
    local v28 = v1.useCallback(function(_, _, _) --[[ Line: 58 ]]
        -- upvalues: v15 (copy)
        v15.OnDropdownMenuFocusLost();
    end, {
        v15.OnDropdownMenuFocusLost
    });
    local v29 = v1.useCallback(function() --[[ Line: 62 ]]
        -- upvalues: v18 (copy), v15 (copy), v17 (copy)
        v18.markAllNotificationsRead();
        v15.OnDropdownMenuFocusLost();
        v18.notificationClient.markAllNotificationsRead();
        v17.eventHandlers.markAllAsRead();
    end, {
        v15.OnDropdownMenuFocusLost, 
        v17, 
        v18.notificationClient
    });
    local v30 = v1.useCallback(function() --[[ Line: 69 ]]
        -- upvalues: l_GuiService_0 (ref), v14 (ref), v15 (copy), v17 (copy)
        l_GuiService_0:OpenBrowserWindow(v14);
        v15.OnDropdownMenuFocusLost();
        v17.eventHandlers.settingsButtonClicked();
    end, {
        v15.OnDropdownMenuFocusLost, 
        v17
    });
    local v32 = v1.useCallback(function(v31) --[[ Line: 75 ]]
        -- upvalues: v29 (copy), v30 (copy)
        if v31 == "MarkAllAsRead" then
            return v29;
        elseif v31 == "Settings" then
            return v30;
        else
            return function() --[[ Line: 82 ]]
                -- upvalues: v31 (copy)
                warn("Unknown notification menu option: ", v31);
            end;
        end;
    end, {
        v30, 
        v29
    });
    return v1.createElement(l_CaptureFocus_0, {
        OnFocusLost = v28
    }, {
        v1.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, -14, 0, 38), 
            Size = UDim2.new(0, v23, 0, v13.TOTAL_MENU_HEIGHT), 
            [v1.Tag] = "Component-NotificationMenu"
        }, {
            v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, v13.BORDER_SIZE, 0, v13.BORDER_SIZE), 
                Size = UDim2.new(0, v24, 0, v13.INNER_MENU_HEIGHT), 
                [v1.Tag] = "Component-NotificationMenuInner"
            }, l_map_0(v13.MENU_OPTIONS, function(v33, v34) --[[ Line: 113 ]]
                -- upvalues: v1 (ref), v24 (copy), v13 (ref), v16 (copy), v32 (copy)
                return v1.createElement("TextButton", {
                    LayoutOrder = v34, 
                    AutoButtonColor = false, 
                    Size = UDim2.new(0, v24, 0, v13.BUTTON_HEIGHT), 
                    Text = v16:getText("Header", v33), 
                    [v1.Event.MouseButton1Click] = v32(v33), 
                    [v1.Tag] = "Component-NotificationMenuOptionButton"
                });
            end))
        })
    });
end;