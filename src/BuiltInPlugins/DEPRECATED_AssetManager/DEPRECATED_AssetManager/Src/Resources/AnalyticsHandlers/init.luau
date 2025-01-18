local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Dash);
local v3 = require(l_Parent_0.Src.Util.DebugFlags);
local l_join_0 = v2.join;
local l_AssetManagerUseEventIngest_0 = game:GetFastFlag("AssetManagerUseEventIngest");
local v6 = l_AssetManagerUseEventIngest_0 and "Asset Manager" or "Asset Manager";
return function(v7) --[[ Line: 18 ]]
    -- upvalues: l_join_0 (copy), v3 (copy), v6 (copy), l_HttpService_0 (copy), l_AssetManagerUseEventIngest_0 (copy)
    local function v11(v8, v9) --[[ Line: 19 ]] --[[ Name: sendEvent ]]
        -- upvalues: l_join_0 (ref), v7 (copy), v3 (ref), v6 (ref), l_HttpService_0 (ref)
        local v10 = v9 or {};
        v10 = l_join_0({
            studioSid = v7:GetSessionId(), 
            clientId = v7:GetClientId(), 
            placeId = game.PlaceId
        }, v10);
        if v3.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format(v6, tostring(v8), l_HttpService_0:JSONEncode(v10)));
        end;
        v7:SendEventDeferred("studio", v6, v8, v10);
    end;
    local function _(v12, v13) --[[ Line: 41 ]] --[[ Name: reportCounter ]]
        -- upvalues: v3 (ref), v6 (ref), v7 (copy)
        v13 = v13 or 1;
        if v3.LogAnalytics() then
            print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring(v12), (tostring(v13))));
        end;
        v7:ReportCounter(v12, v13);
    end;
    return {
        openFolder = function(v15) --[[ Line: 56 ]] --[[ Name: openFolder ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11(v15);
                local v16 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerFolderOpen"), (tostring(v16))));
                end;
                v7:ReportCounter("AssetManagerFolderOpen", v16);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", v15);
                v7:ReportCounter("AssetManagerFolderOpen", 1);
                return;
            end;
        end, 
        clickContextMenuItem = function() --[[ Line: 66 ]] --[[ Name: clickContextMenuItem ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11("Context Menu Item Click");
                local v17 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerContextMenuItemClick"), (tostring(v17))));
                end;
                v7:ReportCounter("AssetManagerContextMenuItemClick", v17);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", "Context Menu Item Click");
                v7:ReportCounter("AssetManagerContextMenuItemClick", 1);
                return;
            end;
        end, 
        massUpdateFromAssetManager = function() --[[ Line: 76 ]] --[[ Name: massUpdateFromAssetManager ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                local v18 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("MassUpdateFromAssetManager"), (tostring(v18))));
                end;
                v7:ReportCounter("MassUpdateFromAssetManager", v18);
                return;
            else
                v7:ReportCounter("MassUpdateFromAssetManager", 1);
                return;
            end;
        end, 
        clickBulkImportButton = function() --[[ Line: 84 ]] --[[ Name: clickBulkImportButton ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11("Bulk Import Button Click");
                local v19 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerBulkImportButtonClick"), (tostring(v19))));
                end;
                v7:ReportCounter("AssetManagerBulkImportButtonClick", v19);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", "Bulk Import Button Click");
                v7:ReportCounter("AssetManagerBulkImportButtonClick", 1);
                return;
            end;
        end, 
        search = function() --[[ Line: 94 ]] --[[ Name: search ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11("Search");
                local v20 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerSearch"), (tostring(v20))));
                end;
                v7:ReportCounter("AssetManagerSearch", v20);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", "Search");
                v7:ReportCounter("AssetManagerSearch", 1);
                return;
            end;
        end, 
        insertAfterSearch = function() --[[ Line: 104 ]] --[[ Name: insertAfterSearch ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11("Insert After Search");
                local v21 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerInsertAfterSearch"), (tostring(v21))));
                end;
                v7:ReportCounter("AssetManagerInsertAfterSearch", v21);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", "Insert After Search");
                v7:ReportCounter("AssetManagerInsertAfterSearch", 1);
                return;
            end;
        end, 
        doubleClickInsert = function() --[[ Line: 114 ]] --[[ Name: doubleClickInsert ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11("Double Click Insert");
                local v22 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerDoubleClickInsert"), (tostring(v22))));
                end;
                v7:ReportCounter("AssetManagerDoubleClickInsert", v22);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", "Double Click Insert");
                v7:ReportCounter("AssetManagerDoubleClickInsert", 1);
                return;
            end;
        end, 
        dragInsert = function() --[[ Line: 124 ]] --[[ Name: dragInsert ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11("Drag Insert");
                local v23 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerDragInsert"), (tostring(v23))));
                end;
                v7:ReportCounter("AssetManagerDragInsert", v23);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", "Drag Insert");
                v7:ReportCounter("AssetManagerDragInsert", 1);
                return;
            end;
        end, 
        cancelDragInsert = function() --[[ Line: 134 ]] --[[ Name: cancelDragInsert ]]
            -- upvalues: v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            v11("CancelDragInsert");
            local v24 = nil or 1;
            if v3.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerCancelDragInsert"), (tostring(v24))));
            end;
            v7:ReportCounter("AssetManagerCancelDragInsert", v24);
        end, 
        AssetPreviewPlaySound = function() --[[ Line: 139 ]] --[[ Name: AssetPreviewPlaySound ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11("Asset Preview Play Sound");
                local v25 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerAssetPreviewPlaySound"), (tostring(v25))));
                end;
                v7:ReportCounter("AssetManagerAssetPreviewPlaySound", v25);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", "Asset Preview Play Sound");
                v7:ReportCounter("AssetManagerAssetPreviewPlaySound", 1);
                return;
            end;
        end, 
        AssetPreviewPauseSound = function() --[[ Line: 148 ]] --[[ Name: AssetPreviewPauseSound ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11("Asset Preview Pause Sound");
                local v26 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerAssetPreviewPauseSound"), (tostring(v26))));
                end;
                v7:ReportCounter("AssetManagerAssetPreviewPauseSound", v26);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", "Asset Preview Pause Sound");
                v7:ReportCounter("AssetManagerAssetPreviewPauseSound", 1);
                return;
            end;
        end, 
        AssetPreviewPlayVideo = function() --[[ Line: 157 ]] --[[ Name: AssetPreviewPlayVideo ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11("Asset Preview Play Video");
                local v27 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerAssetPreviewPlayVideo"), (tostring(v27))));
                end;
                v7:ReportCounter("AssetManagerAssetPreviewPlayVideo", v27);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", "Asset Preview Play Video");
                v7:ReportCounter("AssetManagerAssetPreviewPlayVideo", 1);
                return;
            end;
        end, 
        AssetPreviewPauseVideo = function() --[[ Line: 167 ]] --[[ Name: AssetPreviewPauseVideo ]]
            -- upvalues: l_AssetManagerUseEventIngest_0 (ref), v11 (copy), v3 (ref), v6 (ref), v7 (copy)
            if l_AssetManagerUseEventIngest_0 then
                v11("Asset Preview Pause Video");
                local v28 = nil or 1;
                if v3.LogAnalytics() then
                    print(("%s ReportCounter counterName=%s count=%s"):format(v6, tostring("AssetManagerAssetPreviewPauseVideo"), (tostring(v28))));
                end;
                v7:ReportCounter("AssetManagerAssetPreviewPauseVideo", v28);
                return;
            else
                v7:TrackEvent("Action", "Asset Manager", "Asset Preview Pause Video");
                v7:ReportCounter("AssetManagerAssetPreviewPauseVideo", 1);
                return;
            end;
        end
    };
end;