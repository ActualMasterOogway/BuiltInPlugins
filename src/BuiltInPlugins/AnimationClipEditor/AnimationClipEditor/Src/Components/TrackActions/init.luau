local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.AddKeyframe);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.ClearTrack);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.ConvertTrack);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.DeleteTrack);
local v12 = require(l_script_FirstAncestor_0.Src.Thunks.SetTrackEulerAnglesOrder);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.SplitTrack);
local v15 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v16 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v17 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v18 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v20 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v21 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAddKeyframeUniqueWaypoint);
local _ = {
    Enum.RotationOrder.XYZ, 
    Enum.RotationOrder.XZY, 
    Enum.RotationOrder.YXZ, 
    Enum.RotationOrder.YZX, 
    Enum.RotationOrder.ZXY, 
    Enum.RotationOrder.ZYX
};
local v23 = v1.PureComponent:extend("TrackActions");
v23.init = function(v24) --[[ Line: 80 ]] --[[ Name: init ]]
    v24.hasInternalPermission = false;
end;
v23.makeEulerAnglesOrderSubMenu = function(v25) --[[ Line: 84 ]] --[[ Name: makeEulerAnglesOrderSubMenu ]]
    -- upvalues: v15 (copy), v20 (copy), v16 (copy)
    local l_props_0 = v25.props;
    local l_Localization_0 = v25.props.Localization;
    local l_AnimationData_0 = v25.props.AnimationData;
    local l_InstanceName_0 = v25.props.InstanceName;
    local l_Path_0 = v25.props.Path;
    local v31 = v15.getTrack(l_AnimationData_0, l_InstanceName_0, l_Path_0);
    local v32 = v20.getEulerAnglesOrder(v31) or l_props_0.DefaultEulerAnglesOrder;
    local function v34(v33) --[[ Line: 93 ]] --[[ Name: onItemClicked ]]
        -- upvalues: l_props_0 (copy), l_InstanceName_0 (copy), l_Path_0 (copy)
        l_props_0.AddWaypoint();
        l_props_0.SetTrackEulerAnglesOrder(l_InstanceName_0, l_Path_0, v33.Data);
    end;
    local v35 = {
        Text = l_Localization_0:getText("ContextMenu", "EulerAnglesOrder")
    };
    for _, v37 in v16.EULER_ANGLES_ORDER do
        table.insert(v35, {
            Text = v37.Name, 
            Data = v37, 
            Checked = v32 == v37.Value, 
            OnItemClicked = v34
        });
    end;
    return v35;
end;
v23.makeMenuActions = function(v38) --[[ Line: 114 ]] --[[ Name: makeMenuActions ]]
    -- upvalues: v15 (copy), v16 (copy), v20 (copy), l_script_FirstAncestor_0 (copy)
    local l_props_1 = v38.props;
    local l_PluginActions_0 = l_props_1.PluginActions;
    local l_IsChannelAnimation_0 = l_props_1.IsChannelAnimation;
    local l_Path_1 = l_props_1.Path;
    local l_TrackType_0 = l_props_1.TrackType;
    local l_AnimationData_1 = l_props_1.AnimationData;
    local l_InstanceName_1 = l_props_1.InstanceName;
    local l_TrackName_0 = l_props_1.TrackName;
    local v47 = v15.getTrack(l_AnimationData_1, l_InstanceName_1, l_Path_1);
    local v48 = false;
    if v47 ~= nil then
        v48 = true;
        if v47.Type ~= v16.TRACK_TYPES.Quaternion then
            v48 = false;
            if v47.Type == v16.TRACK_TYPES.CFrame then
                v48 = v20.getRotationType(v47) == v16.TRACK_TYPES.Quaternion;
            end;
        end;
    end;
    local v49 = (not l_IsChannelAnimation_0 or l_Path_1 ~= nil and #l_Path_1 <= 1) and "DeleteTrack" or "ClearTrack";
    local v50 = {
        l_PluginActions_0:get("AddKeyframe"), 
        l_PluginActions_0:get(v49)
    };
    local v51 = false;
    if l_IsChannelAnimation_0 and v48 then
        table.insert(v50, v16.MENU_SEPARATOR);
        table.insert(v50, l_PluginActions_0:get("ConvertToEulerAngles"));
        v51 = true;
    end;
    if l_TrackType_0 == v16.TRACK_TYPES.EulerAngles then
        if not v51 then
            table.insert(v50, v16.MENU_SEPARATOR);
        end;
        table.insert(v50, v38:makeEulerAnglesOrderSubMenu());
    end;
    if v38.hasInternalPermission then
        table.insert(v50, {
            Text = "[INTERNAL] Dump track data", 
            OnItemClicked = function() --[[ Line: 158 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: l_AnimationData_1 (copy), l_InstanceName_1 (copy), l_TrackName_0 (ref), l_Path_1 (copy), l_script_FirstAncestor_0 (ref)
                local v52 = l_AnimationData_1.Instances[l_InstanceName_1];
                l_TrackName_0 = l_TrackName_0 or l_Path_1[1];
                local v53 = v52.Tracks[l_TrackName_0];
                require(l_script_FirstAncestor_0.Src.Util.Debug.dumpTable)(v53);
            end
        });
        table.insert(v50, {
            Text = "[INTERNAL] Dump track as CSV", 
            OnItemClicked = function() --[[ Line: 169 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: l_script_FirstAncestor_0 (ref), l_AnimationData_1 (copy), l_InstanceName_1 (copy), l_TrackName_0 (ref), l_Path_1 (copy), v20 (ref), l_props_1 (copy)
                local v54 = require(l_script_FirstAncestor_0.Src.Util.Debug.dumpTrack);
                local v55 = l_AnimationData_1.Instances[l_InstanceName_1];
                l_TrackName_0 = l_TrackName_0 or l_Path_1[1];
                local v56 = v55.Tracks[l_TrackName_0];
                local v57 = v20.getEulerAnglesOrder(v56);
                v54(v56, l_TrackName_0, v57 or l_props_1.DefaultEulerAnglesOrder);
            end
        });
    end;
    return v50;
end;
v23.addAction = function(v58, v59, v60) --[[ Line: 184 ]] --[[ Name: addAction ]]
    if v59 then
        v59.Enabled = false;
        table.insert(v58.Actions, v59);
        table.insert(v58.Connections, v59.Triggered:Connect(v60));
    end;
end;
v23.didMount = function(v61) --[[ Line: 193 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy), v2 (copy), v15 (copy), v18 (copy), v16 (copy)
    local l_PluginActions_1 = v61.props.PluginActions;
    v61.Actions = {};
    v61.Connections = {};
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 198 ]]
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    if l_status_0 and l_result_0 then
        v61.hasInternalPermission = true;
    end;
    v61:addAction(l_PluginActions_1:get("DeleteTrack"), function() --[[ Line: 206 ]]
        -- upvalues: v61 (copy)
        local l_props_2 = v61.props;
        local v66 = l_props_2.Path[1];
        l_props_2.AddWaypoint();
        l_props_2.DeleteTrack(v66, l_props_2.Analytics);
    end);
    v61:addAction(l_PluginActions_1:get("ClearTrack"), function() --[[ Line: 213 ]]
        -- upvalues: v61 (copy)
        local l_props_3 = v61.props;
        local l_Path_2 = l_props_3.Path;
        local l_InstanceName_2 = l_props_3.InstanceName;
        l_props_3.AddWaypoint();
        l_props_3.ClearTrack(l_InstanceName_2, l_Path_2, l_props_3.Analytics);
    end);
    v61:addAction(l_PluginActions_1:get("AddKeyframe"), function() --[[ Line: 221 ]]
        -- upvalues: v61 (copy), v20 (ref), v2 (ref), v15 (ref), v18 (ref)
        local l_props_4 = v61.props;
        local l_Playhead_0 = l_props_4.Playhead;
        local l_TrackType_1 = l_props_4.TrackType;
        local l_RotationType_0 = l_props_4.RotationType;
        local l_InstanceName_3 = l_props_4.InstanceName;
        local l_AnimationData_2 = l_props_4.AnimationData;
        local l_IsChannelAnimation_1 = l_props_4.IsChannelAnimation;
        local l_Path_3 = l_props_4.Path;
        local _ = nil;
        if l_InstanceName_3 and l_Path_3 then
            l_props_4.AddWaypoint();
            if l_IsChannelAnimation_1 then
                v20.traverseComponents(l_TrackType_1, function(v79, v80) --[[ Line: 237 ]]
                    -- upvalues: v2 (ref), l_Path_3 (copy), l_props_4 (copy), l_InstanceName_3 (copy), l_RotationType_0 (copy), l_Playhead_0 (copy)
                    local v81 = v2.List.join(l_Path_3, v80);
                    l_props_4.SplitTrack(l_InstanceName_3, v81, v79, l_RotationType_0, l_Playhead_0, l_props_4.Analytics);
                end, l_RotationType_0);
                return;
            else
                local v82 = v15.getTrack(l_AnimationData_2, l_InstanceName_3, l_Path_3);
                local v83 = {
                    Value = if v82 and v82.Keyframes then v18.getValue(v82, l_Playhead_0) else v18.getDefaultValue(l_TrackType_1), 
                    EasingStyle = Enum.PoseEasingStyle.Linear, 
                    EasingDirection = Enum.PoseEasingDirection.In
                };
                l_props_4.AddKeyframe(l_InstanceName_3, l_Path_3, l_TrackType_1, nil, l_Playhead_0, v83, l_props_4.Analytics);
            end;
        end;
    end);
    v61:addAction(l_PluginActions_1:get("ConvertToEulerAngles"), function() --[[ Line: 265 ]]
        -- upvalues: v61 (copy), v16 (ref), v15 (ref)
        local l_props_5 = v61.props;
        local l_Path_4 = l_props_5.Path;
        local l_InstanceName_4 = l_props_5.InstanceName;
        local l_TrackType_2 = l_props_5.TrackType;
        local l_AnimationData_3 = l_props_5.AnimationData;
        if l_TrackType_2 == v16.TRACK_TYPES.CFrame then
            table.insert(l_Path_4, v16.PROPERTY_KEYS.Rotation);
            local v89 = v15.getTrack(l_AnimationData_3, l_InstanceName_4, l_Path_4);
            if not v89 or v89.Type ~= v16.TRACK_TYPES.Quaternion then
                return;
            end;
        end;
        l_props_5.AddWaypoint();
        l_props_5.ConvertTrack(l_InstanceName_4, l_Path_4, v16.TRACK_TYPES.EulerAngles, l_props_5.Analytics);
    end);
end;
v23.render = function(v90) --[[ Line: 285 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v15 (copy), v20 (copy), v1 (copy), v6 (copy)
    local l_props_6 = v90.props;
    local l_ShowMenu_0 = l_props_6.ShowMenu;
    local l_Path_5 = l_props_6.Path;
    local l_InstanceName_5 = l_props_6.InstanceName;
    local l_AnimationData_4 = l_props_6.AnimationData;
    local l_Playhead_1 = l_props_6.Playhead;
    local l_ReadOnly_0 = l_props_6.ReadOnly;
    local l_Actions_0 = v90.Actions;
    local l_PluginActions_2 = v90.props.PluginActions;
    local l_IsChannelAnimation_2 = v90.props.IsChannelAnimation;
    if not v17(l_PluginActions_2) and l_Actions_0 ~= nil then
        for _, v102 in ipairs(l_Actions_0) do
            v102.Enabled = false;
        end;
        if l_Path_5 and l_InstanceName_5 then
            local v103 = v15.getTrack(l_AnimationData_4, l_InstanceName_5, l_Path_5);
            local v104 = nil;
            if not l_IsChannelAnimation_2 then
                v104 = not (v103 and v103.Data and v103.Data[l_Playhead_1]);
            elseif not v103 then
                v104 = true;
            else
                local v105 = v20.getComponentsInfo(v103, l_Playhead_1);
                v104 = not v105[l_Playhead_1] or not v105[l_Playhead_1].Complete;
            end;
            l_PluginActions_2:get("AddKeyframe").Enabled = not l_ReadOnly_0 and v104;
        end;
        l_PluginActions_2:get("DeleteTrack").Enabled = not l_ReadOnly_0;
        l_PluginActions_2:get("ClearTrack").Enabled = not l_ReadOnly_0;
        if l_IsChannelAnimation_2 then
            l_PluginActions_2:get("ConvertToEulerAngles").Enabled = not l_ReadOnly_0;
        end;
    end;
    return l_ShowMenu_0 and v1.createElement(v6, {
        Actions = v90:makeMenuActions(), 
        OnMenuOpened = l_props_6.OnMenuOpened
    }) or nil;
end;
v23.willUnmount = function(v106) --[[ Line: 334 ]] --[[ Name: willUnmount ]]
    if v106.Connections then
        for _, v108 in ipairs(v106.Connections) do
            v108:Disconnect();
        end;
        v106.Connections = {};
    end;
    if v106.Actions then
        for _, v110 in ipairs(v106.Actions) do
            v110.Enabled = false;
        end;
    end;
end;
v23 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Analytics = l_ContextServices_0.Analytics
})(v23);
return v3.connect(function(v111) --[[ Line: 354 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v111.Status;
    return {
        AnimationData = v111.AnimationData, 
        DefaultEulerAnglesOrder = l_Status_0.DefaultEulerAnglesOrder, 
        InstanceName = l_Status_0.RightClickContextInfo.InstanceName, 
        Path = l_Status_0.RightClickContextInfo.Path, 
        Playhead = l_Status_0.Playhead, 
        ReadOnly = l_Status_0.ReadOnly, 
        RotationType = l_Status_0.RightClickContextInfo.RotationType, 
        TrackName = l_Status_0.RightClickContextInfo.TrackName, 
        TrackType = l_Status_0.RightClickContextInfo.TrackType
    };
end, function(v113) --[[ Line: 370 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), v8 (copy), v7 (copy), v13 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v14 (copy)
    return {
        AddKeyframe = function(v114, v115, v116, v117, v118, v119, v120) --[[ Line: 372 ]] --[[ Name: AddKeyframe ]]
            -- upvalues: v21 (ref), v113 (copy), v8 (ref), v7 (ref), v13 (ref)
            if not v21() then
                v113(v8());
            end;
            v113(v7(v114, v115, v116, v117, v118, v119, v120));
            v113(v13({}));
        end, 
        AddWaypoint = function() --[[ Line: 380 ]] --[[ Name: AddWaypoint ]]
            -- upvalues: v113 (copy), v8 (ref)
            v113(v8());
        end, 
        ClearTrack = function(v121, v122, v123) --[[ Line: 384 ]] --[[ Name: ClearTrack ]]
            -- upvalues: v21 (ref), v113 (copy), v8 (ref), v9 (ref), v13 (ref)
            if not v21() then
                v113(v8());
            end;
            v113(v9(v121, v122, v123));
            v113(v13({}));
        end, 
        ConvertTrack = function(v124, v125, v126, v127) --[[ Line: 392 ]] --[[ Name: ConvertTrack ]]
            -- upvalues: v21 (ref), v113 (copy), v8 (ref), v10 (ref), v13 (ref)
            if not v21() then
                v113(v8());
            end;
            v113(v10(v124, v125, v126, v127));
            v113(v13({}));
        end, 
        DeleteTrack = function(v128, v129) --[[ Line: 400 ]] --[[ Name: DeleteTrack ]]
            -- upvalues: v21 (ref), v113 (copy), v8 (ref), v11 (ref), v13 (ref)
            if not v21() then
                v113(v8());
            end;
            v113(v11(v128, v129));
            v113(v13({}));
        end, 
        SetTrackEulerAnglesOrder = function(v130, v131, v132) --[[ Line: 408 ]] --[[ Name: SetTrackEulerAnglesOrder ]]
            -- upvalues: v21 (ref), v113 (copy), v8 (ref), v12 (ref), v13 (ref)
            if not v21() then
                v113(v8());
            end;
            v113(v12(v130, v131, v132));
            v113(v13({}));
        end, 
        SplitTrack = function(v133, v134, v135, v136, v137, v138) --[[ Line: 420 ]] --[[ Name: SplitTrack ]]
            -- upvalues: v21 (ref), v113 (copy), v8 (ref), v14 (ref), v13 (ref)
            if not v21() then
                v113(v8());
            end;
            v113(v14(v133, v134, v135, v136, v137, v138));
            v113(v13({}));
        end
    };
end)(v23);