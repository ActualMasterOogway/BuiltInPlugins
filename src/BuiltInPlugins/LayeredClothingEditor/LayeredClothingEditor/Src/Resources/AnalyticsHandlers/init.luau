local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_PreviewConstants_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared.PreviewConstants;
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local l_StudioService_0 = game:GetService("StudioService");
local function v14(v6) --[[ Line: 13 ]] --[[ Name: getIdFromUrl ]]
    if not v6 then
        return;
    else
        for _, v8 in {
            "id://", 
            "[Ii][Dd]="
        } do
            local v9, v10 = string.find(v6, v8);
            if v9 then
                local v11, v12 = string.find(v6, "%d+", v10 + 1);
                v9 = v11;
                v10 = v12;
                if v9 and v10 then
                    v11 = v6:sub(v9, v10);
                    local v13;
                    v12, v13 = pcall(function() --[[ Line: 34 ]]
                        -- upvalues: v11 (copy)
                        return (tonumber(v11));
                    end);
                    if v12 then
                        return v13;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
return function(v15) --[[ Line: 44 ]]
    -- upvalues: v3 (copy), v1 (copy), l_StudioService_0 (copy), l_PreviewConstants_0 (copy), v4 (copy), v14 (copy)
    local l_ANALYTICS_CONSTANTS_0 = v3.ANALYTICS_CONSTANTS;
    local function v20(v17, v18) --[[ Line: 46 ]] --[[ Name: sendEvent ]]
        -- upvalues: v1 (ref), v15 (copy), l_StudioService_0 (ref)
        local v19 = v18 or {};
        v19 = v1.Dictionary.join({
            studioSid = v15:GetSessionId(), 
            clientId = v15:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v19);
        v15:SendEventDeferred("studio", "accessoryFittingTool", v17, v19);
    end;
    local v21 = {
        [v3.SCREENS.Select] = "exitSelect", 
        [v3.SCREENS.AssetType] = "exitAssetType", 
        [v3.SCREENS.Edit] = "exitEdit"
    };
    local v22 = {
        Default = {
            [l_PreviewConstants_0.TABS_KEYS.Animations] = "defaultPreviewAnimSelected", 
            [l_PreviewConstants_0.TABS_KEYS.Avatars] = "defaultPreviewAvatarSelected", 
            [l_PreviewConstants_0.TABS_KEYS.Clothing] = "defaultPreviewClothingSelected"
        }, 
        Custom = {
            [l_PreviewConstants_0.TABS_KEYS.Animations] = "customPreviewAnimSelected", 
            [l_PreviewConstants_0.TABS_KEYS.Avatars] = "customPreviewAvatarSelected", 
            [l_PreviewConstants_0.TABS_KEYS.Clothing] = "customPreviewClothingSelected"
        }
    };
    local function _() --[[ Line: 78 ]]
        -- upvalues: v4 (ref), v20 (copy)
        if v4.TotalLayers > 0 or v4.TotalAvatars > 1 then
            v20("previewUsed", {
                layerCount = v4.TotalLayers, 
                avatarCount = v4.TotalAvatars
            });
        end;
    end;
    local function _() --[[ Line: 87 ]]
        -- upvalues: v4 (ref), v20 (copy), v15 (copy)
        if v4.CageEdits > 0 then
            v20("cageEdited", {
                count = v4.CageEdits
            });
            v15:ReportCounter("AccessoryFittingToolCageEdited", v4.CageEdits);
        end;
    end;
    return {
        FirstAction = function(v25) --[[ Line: 97 ]] --[[ Name: FirstAction ]]
            -- upvalues: v4 (ref), v20 (copy)
            if v4.FirstAction then
                v20("firstAction", {
                    actionId = v25
                });
            end;
        end, 
        CreateAccessory = function(v26) --[[ Line: 104 ]] --[[ Name: CreateAccessory ]]
            -- upvalues: v20 (copy), v15 (copy)
            v20("createAccessory", {
                count = v26
            });
            v15:ReportCounter("CreateAccessory", v26);
        end, 
        PluginOpened = function() --[[ Line: 110 ]] --[[ Name: PluginOpened ]]
            -- upvalues: v20 (copy), v15 (copy)
            v20("opened");
            v15:ReportCounter("AccessoryFittingToolOpened", 1);
        end, 
        LayeredAccessoryPublished = function(v27) --[[ Line: 114 ]] --[[ Name: LayeredAccessoryPublished ]]
            -- upvalues: v20 (copy), v4 (ref), l_ANALYTICS_CONSTANTS_0 (copy), v14 (ref), v15 (copy)
            v20("publishedLC", {
                cageEdited = if v4.CageEdits > 0 then l_ANALYTICS_CONSTANTS_0.CAGE_EDITING.Edited else l_ANALYTICS_CONSTANTS_0.CAGE_EDITING.Unedited, 
                meshId = v14(v27)
            });
            v15:ReportCounter("AccessoryFittingToolPublishedLC", 1);
        end, 
        RigidAccessoryPublished = function(v28) --[[ Line: 123 ]] --[[ Name: RigidAccessoryPublished ]]
            -- upvalues: v20 (copy), v14 (ref), v15 (copy)
            v20("publishedAcc", {
                meshId = v14(v28)
            });
            v15:ReportCounter("AccessoryFittingToolPublishedAcc", 1);
        end, 
        LayeredAccessorySelected = function() --[[ Line: 129 ]] --[[ Name: LayeredAccessorySelected ]]
            -- upvalues: v20 (copy), v15 (copy)
            v20("selectedLC");
            v15:ReportCounter("AccessoryFittingToolSelectedLC", 1);
        end, 
        RigidAccessorySelected = function() --[[ Line: 133 ]] --[[ Name: RigidAccessorySelected ]]
            -- upvalues: v20 (copy), v15 (copy)
            v20("selectedAcc");
            v15:ReportCounter("AccessoryFittingToolSelectedAcc", 1);
        end, 
        CenterAvatarToCamera = function() --[[ Line: 137 ]] --[[ Name: CenterAvatarToCamera ]]
            -- upvalues: v20 (copy), v15 (copy)
            v20("centerAvatarToCamera");
            v15:ReportCounter("AccessoryFittingToolCenterAvatarToCamera", 1);
        end, 
        ZoomToAvatar = function() --[[ Line: 141 ]] --[[ Name: ZoomToAvatar ]]
            -- upvalues: v20 (copy), v15 (copy)
            v20("zoomToAvatar");
            v15:ReportCounter("AccessoryFittingToolZoomToAvatar", 1);
        end, 
        AutoSkinningToggled = function(v29) --[[ Line: 145 ]] --[[ Name: AutoSkinningToggled ]]
            -- upvalues: v20 (copy), v15 (copy)
            v20("autoSkinningToggled", {
                enabled = v29
            });
            v15:ReportCounter("AccessoryFittingToolAutoSkinningToggled", 1);
        end, 
        FalloffSliderAdjusted = function(_) --[[ Line: 151 ]] --[[ Name: FalloffSliderAdjusted ]]
            -- upvalues: v20 (copy), v15 (copy)
            v20("falloffAdjusted");
            v15:ReportCounter("AccessoryFittingToolFalloffAdjusted", 1);
        end, 
        PreviewAssetSelected = function(v31, v32, v33, v34) --[[ Line: 155 ]] --[[ Name: PreviewAssetSelected ]]
            -- upvalues: v22 (copy), v20 (copy), l_ANALYTICS_CONSTANTS_0 (copy)
            local v35 = (if v31 then v22.Custom else v22.Default)[v32];
            if v35 then
                v20(v35, {
                    method = if v34 then l_ANALYTICS_CONSTANTS_0.PREVIEW_SELECT_METHOD.Thumbnail else l_ANALYTICS_CONSTANTS_0.PREVIEW_SELECT_METHOD.Workspace, 
                    assetId = if not v31 then v33 else nil
                });
            end;
        end, 
        ExitScreen = function() --[[ Line: 167 ]] --[[ Name: ExitScreen ]]
            -- upvalues: v4 (ref), v21 (copy), v20 (copy), l_ANALYTICS_CONSTANTS_0 (copy)
            local l_HasPublished_0 = v4.HasPublished;
            local l_CurrentScreen_0 = v4.CurrentScreen;
            local l_RigidFlow_0 = v4.RigidFlow;
            local v39 = math.abs(os.time() - v4.StartTime);
            local v40 = v21[l_CurrentScreen_0];
            if v40 then
                v20(v40, {
                    flow = if l_RigidFlow_0 then l_ANALYTICS_CONSTANTS_0.FLOW.Rigid else l_ANALYTICS_CONSTANTS_0.FLOW.Layered, 
                    didGenerate = if l_HasPublished_0 then l_ANALYTICS_CONSTANTS_0.PUBLISHING.Published else l_ANALYTICS_CONSTANTS_0.PUBLISHING.Unpublished, 
                    timeInSeconds = v39
                });
            end;
        end, 
        SessionEnded = function(v41) --[[ Line: 185 ]] --[[ Name: SessionEnded ]]
            -- upvalues: v4 (ref), v20 (copy), v15 (copy)
            if v4.TotalLayers > 0 or v4.TotalAvatars > 1 then
                v20("previewUsed", {
                    layerCount = v4.TotalLayers, 
                    avatarCount = v4.TotalAvatars
                });
            end;
            if v4.CageEdits > 0 then
                v20("cageEdited", {
                    count = v4.CageEdits
                });
                v15:ReportCounter("AccessoryFittingToolCageEdited", v4.CageEdits);
            end;
            if v41 then
                v4:reset();
                return;
            else
                v4:resetSession();
                return;
            end;
        end
    };
end;