local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v5 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local _ = v6.MENU_SEPARATOR;
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.SaveAnimation);
local v12 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.ExportAnimation);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateMetadata);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetEditorMode);
local v16 = game:DefineFastFlag("AnimationFromVideoCreatorServiceInAnimationEditor", false);
local v17 = v1.PureComponent:extend("AnimationClipMenu");
v17.init = function(v18) --[[ Line: 53 ]] --[[ Name: init ]]
    v18.hasInternalPermission = false;
end;
v17.didMount = function(v19) --[[ Line: 57 ]] --[[ Name: didMount ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 58 ]]
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    v19.hasInternalPermission = l_status_0 and l_result_0;
end;
v17.makeLoadMenu = function(v22) --[[ Line: 65 ]] --[[ Name: makeLoadMenu ]]
    -- upvalues: v5 (copy)
    local l_props_0 = v22.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_OnLoadRequested_0 = l_props_0.OnLoadRequested;
    local v26 = v5.getAnimSaves(l_props_0.RootInstance);
    local v27 = {
        Text = l_Localization_0:getText("Menu", "Load"), 
        Data = nil, 
        OnItemClicked = nil
    };
    if #v26 > 0 then
        for _, v29 in ipairs(v26) do
            local l_Name_0 = v29.animation.Name;
            if v29.isLegacyAnimSaves then
                l_Name_0 = l_Name_0 .. " *";
            end;
            table.insert(v27, {
                Text = l_Name_0, 
                Data = {
                    Animation = v29.animation, 
                    IsLegacyAnimSaves = v29.isLegacyAnimSaves
                }, 
                OnItemClicked = function(v31) --[[ Line: 89 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: l_OnLoadRequested_0 (copy)
                    l_OnLoadRequested_0(v31.Data.Animation.Name, v31.Data.IsLegacyAnimSaves);
                end
            });
        end;
        return v27;
    else
        v27.Enabled = false;
        return v27;
    end;
end;
v17.makeSaveAsMenu = function(v32) --[[ Line: 101 ]] --[[ Name: makeSaveAsMenu ]]
    -- upvalues: v5 (copy), v6 (copy)
    local l_props_1 = v32.props;
    local l_Localization_1 = l_props_1.Localization;
    local _ = l_props_1.CurrentAnimation or "";
    local v36 = v5.getAnimSaves(l_props_1.RootInstance);
    local function _(v37, v38) --[[ Line: 108 ]] --[[ Name: onOverwriteRequested ]]
        -- upvalues: l_props_1 (copy)
        l_props_1.OnOverwriteRequested(v37, v38);
    end;
    local v40 = {
        Text = l_Localization_1:getText("Menu", "SaveAs"); 
        {
            Text = l_Localization_1:getText("Menu", "New"), 
            OnItemClicked = l_props_1.OnSaveAsRequested
        }
    };
    if #v36 > 0 then
        table.insert(v40, v6.MENU_SEPARATOR);
    end;
    for _, v42 in ipairs(v36) do
        local l_Name_1 = v42.animation.Name;
        if v42.isLegacyAnimSaves then
            l_Name_1 = l_Name_1 .. " *";
        end;
        table.insert(v40, {
            Text = l_Name_1, 
            Data = {
                Animation = v42.animation, 
                IsLegacyAnimSaves = v42.isLegacyAnimSaves
            }, 
            OnItemClicked = function(v44) --[[ Line: 135 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: l_props_1 (copy)
                local l_Name_2 = v44.Data.Animation.Name;
                local l_IsLegacyAnimSaves_0 = v44.Data.IsLegacyAnimSaves;
                l_props_1.OnOverwriteRequested(l_Name_2, l_IsLegacyAnimSaves_0);
            end
        });
    end;
    return v40;
end;
v17.makeImportMenu = function(v47) --[[ Line: 144 ]] --[[ Name: makeImportMenu ]]
    -- upvalues: v16 (copy), v4 (copy)
    local l_props_2 = v47.props;
    local l_Localization_2 = l_props_2.Localization;
    local v50 = {
        Text = l_Localization_2:getText("Menu", "Import"); 
        {
            Text = l_Localization_2:getText("Menu", "FromRoblox"), 
            OnItemClicked = l_props_2.OnImportRequested
        }, 
        {
            Text = l_Localization_2:getText("Menu", "FromFBX"), 
            OnItemClicked = l_props_2.OnImportFbxRequested
        }
    };
    if v16 then
        table.insert(v50, {
            Text = l_Localization_2:getText("Menu", "CreateFromVideo"), 
            OnItemClicked = l_props_2.OnCreateFromVideoRequested, 
            Enabled = v4.isR15Humanoid(l_props_2.RootInstance)
        });
    end;
    return v50;
end;
v17.makePriorityMenu = function(v51) --[[ Line: 170 ]] --[[ Name: makePriorityMenu ]]
    local l_props_3 = v51.props;
    local l_Localization_3 = l_props_3.Localization;
    local l_SetPriority_0 = l_props_3.SetPriority;
    local l_AnimationData_0 = l_props_3.AnimationData;
    local v56 = l_AnimationData_0 and l_AnimationData_0.Metadata and l_AnimationData_0.Metadata.Priority;
    local function v58(v57) --[[ Line: 177 ]]
        -- upvalues: l_SetPriority_0 (copy)
        l_SetPriority_0(v57.Data);
    end;
    local v59 = {
        Text = l_Localization_3:getText("Menu", "SetPriority")
    };
    for _, v61 in {
        Enum.AnimationPriority.Core, 
        Enum.AnimationPriority.Idle, 
        Enum.AnimationPriority.Movement, 
        Enum.AnimationPriority.Action, 
        Enum.AnimationPriority.Action2, 
        Enum.AnimationPriority.Action3, 
        Enum.AnimationPriority.Action4
    } do
        table.insert(v59, {
            Text = l_Localization_3:getText("Menu", v61.Name), 
            Data = v61, 
            Checked = v56 == v61, 
            OnItemClicked = v58
        });
    end;
    return v59;
end;
v17.makeAction = function(v62, v63, v64, v65) --[[ Line: 207 ]] --[[ Name: makeAction ]]
    return {
        Text = v62.props.Localization:getText("Menu", v63), 
        Enabled = v65 ~= false, 
        OnItemClicked = v64
    };
end;
v17.makeMenuActions = function(v66) --[[ Line: 217 ]] --[[ Name: makeMenuActions ]]
    -- upvalues: v6 (copy)
    local l_props_4 = v66.props;
    local l_OnCreateNewRequested_0 = l_props_4.OnCreateNewRequested;
    local l_OnReduceKeyframesRequested_0 = l_props_4.OnReduceKeyframesRequested;
    local l_OnSanitizeAnimation_0 = l_props_4.OnSanitizeAnimation;
    local v71 = l_props_4.CurrentAnimation or "";
    local l_AnimationData_1 = l_props_4.AnimationData;
    local l_Plugin_0 = l_props_4.Plugin;
    local v74 = l_props_4.PlayState == v6.PLAY_STATE.Record;
    local v75 = l_AnimationData_1 and l_AnimationData_1.Metadata and l_AnimationData_1.Metadata.EndTick > 0 and not v74;
    local v76 = {
        v66:makeLoadMenu(), 
        v66:makeAction("Save", function() --[[ Line: 234 ]]
            -- upvalues: l_props_4 (copy), v71 (copy)
            l_props_4.SaveAnimation(v71, l_props_4.Analytics);
        end), 
        v66:makeSaveAsMenu(), 
        v6.MENU_SEPARATOR, 
        v66:makeImportMenu(), 
        v66:makeAction("PublishToRoblox", function() --[[ Line: 240 ]]
            -- upvalues: l_props_4 (copy), l_Plugin_0 (copy)
            l_props_4.ExportAnimation(l_Plugin_0, l_props_4.Analytics);
        end), 
        v6.MENU_SEPARATOR, 
        v66:makeAction("CreateNew", l_OnCreateNewRequested_0), 
        v6.MENU_SEPARATOR, 
        v66:makePriorityMenu(), 
        v6.MENU_SEPARATOR, 
        v66:makeAction("OptimizeKeyframes", l_OnReduceKeyframesRequested_0, v75)
    };
    if v66.hasInternalPermission then
        table.insert(v76, {
            Text = "[INTERNAL] Sanitize animation", 
            OnItemClicked = l_OnSanitizeAnimation_0
        });
    end;
    return v76;
end;
v17.render = function(v77) --[[ Line: 260 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v9 (copy)
    local l_props_5 = v77.props;
    return l_props_5.ShowMenu and v1.createElement(v9, {
        Actions = v77:makeMenuActions(), 
        OnMenuOpened = l_props_5.OnMenuOpened
    }) or nil;
end;
v17 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Analytics = l_ContextServices_0.Analytics
})(v17);
return v2.connect(function(v79, _) --[[ Line: 278 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v79.Status;
    return {
        AnimationData = v79.AnimationData, 
        EditorMode = l_Status_0.EditorMode, 
        PlayState = l_Status_0.PlayState, 
        RootInstance = l_Status_0.RootInstance
    };
end, function(v82) --[[ Line: 288 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy), v11 (copy), v15 (copy), v13 (copy), v14 (copy)
    return {
        ExportAnimation = function(v83, v84) --[[ Line: 290 ]] --[[ Name: ExportAnimation ]]
            -- upvalues: v82 (copy), v12 (ref)
            v82(v12(v83, v84));
        end, 
        SaveAnimation = function(v85, v86) --[[ Line: 294 ]] --[[ Name: SaveAnimation ]]
            -- upvalues: v82 (copy), v11 (ref)
            v82(v11(v85, v86));
        end, 
        SetEditorMode = function(v87) --[[ Line: 298 ]] --[[ Name: SetEditorMode ]]
            -- upvalues: v82 (copy), v15 (ref)
            v82(v15(v87));
        end, 
        SetPriority = function(v88) --[[ Line: 302 ]] --[[ Name: SetPriority ]]
            -- upvalues: v82 (copy), v13 (ref), v14 (ref)
            v82(v13());
            v82(v14({
                Priority = v88
            }));
        end
    };
end)(v17);