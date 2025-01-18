local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Clients.ActivityHistoryClient);
local _ = require(l_Parent_0.Src.Clients.MockActivityHistoryClient);
local v4 = require(l_Parent_0.Src.Contexts.ActivityHistoryProvider);
local v5 = require(l_Parent_0.Src.Components.ActivityHistoryMain);
local _ = require(l_Parent_0.Src.Components.StylingExamples);
local v7 = require(l_Parent_0.Src.Hooks.useCollaborators);
local v8 = require(l_Parent_0.Src.Hooks.usePlaceAndUniverseId);
local l_COLLAB6856FixAHPublish_0 = game:GetFastFlag("COLLAB6856FixAHPublish");
return function(v10) --[[ Line: 17 ]] --[[ Name: App ]]
    -- upvalues: v8 (copy), v1 (copy), v2 (copy), l_COLLAB6856FixAHPublish_0 (copy), v7 (copy), v4 (copy), v5 (copy)
    local _, v12 = v8(v10.plugin);
    local v13 = v12 ~= 0;
    local function v19(v14, v15) --[[ Line: 21 ]] --[[ Name: useConnectToDataModelSessionEffect ]]
        -- upvalues: v10 (copy), v1 (ref)
        local l_MultipleDocumentInterfaceInstance_0 = v10.plugin.MultipleDocumentInterfaceInstance;
        v1.useEffect(function() --[[ Line: 23 ]]
            -- upvalues: l_MultipleDocumentInterfaceInstance_0 (copy), v14 (copy), v15 (copy)
            local v17 = l_MultipleDocumentInterfaceInstance_0.DataModelSessionStarted:Connect(v14);
            local v18 = l_MultipleDocumentInterfaceInstance_0.DataModelSessionEnded:Connect(v15);
            return function() --[[ Line: 26 ]]
                -- upvalues: v17 (copy), v18 (copy)
                v17:Disconnect();
                v18:Disconnect();
            end;
        end, {
            v14, 
            v15
        });
    end;
    local l_GuiService_0 = game:GetService("GuiService");
    local l_StudioPublishService_0 = game:GetService("StudioPublishService");
    local v23 = {
        activityHistoryClient = v2, 
        showSaveOrPublishPlaceToRobloxFn = function() --[[ Line: 38 ]] --[[ Name: showSaveOrPublishPlaceToRobloxFn ]]
            -- upvalues: l_COLLAB6856FixAHPublish_0 (ref), v10 (copy), l_StudioPublishService_0 (copy)
            if l_COLLAB6856FixAHPublish_0 then
                v10.plugin:Invoke("publishgame");
                return;
            else
                l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, false, Enum.StudioCloseMode.None);
                return;
            end;
        end, 
        useCollaborators = v7, 
        DEPRECATED_usePlaceAndUniverseId = v8, 
        usePlaceAndUniverseId = function() --[[ Line: 47 ]] --[[ Name: usePlaceAndUniverseId ]]
            -- upvalues: v8 (ref), v10 (copy)
            return v8(v10.plugin);
        end, 
        useConnectToDataModelSessionEffect = v19, 
        openBrowserLink = function(v22) --[[ Line: 51 ]] --[[ Name: openBrowserLink ]]
            -- upvalues: l_GuiService_0 (copy)
            l_GuiService_0:OpenBrowserWindow(v22);
        end, 
        contextType = "real context", 
        getActivityHistoryManager = function() --[[ Line: 55 ]] --[[ Name: getActivityHistoryManager ]]
            -- upvalues: v10 (copy)
            return (v10.plugin:GetPluginComponent("ActivityHistoryManager"));
        end
    };
    return v1.createElement(v4, v23, {
        ActivityHistoryMain = v1.createElement(v5, {
            plugin = v10.plugin, 
            isPublishedGame = v13
        })
    });
end;