local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetReadOnly);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v11 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v12 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v13 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v14 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v15 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v18 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v19 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v20 = require(l_script_FirstAncestor_0.Src.Util.KeyframeReduction.VisvalingamWhyatt);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Slider_0 = l_UI_0.Slider;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v29 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v30 = v3.PureComponent:extend("ReduceKeyframesDialog");
v30.init = function(v31) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy)
    v31.didApply = false;
    v31.animationBackup = nil;
    v31.timestamps = nil;
    v31.lastIndexToDelete = nil;
    v31.onClose = function(v32) --[[ Line: 64 ]]
        -- upvalues: v31 (copy), v11 (ref)
        local l_props_0 = v31.props;
        local v34 = #l_props_0.Tracks;
        local v35 = v11.isChannelAnimation(v31.props.AnimationData);
        local v36 = v31.state.hasMoved or false;
        v31.keepChanges = v32;
        if v32 then
            local v37 = if v31.state.ticks then #v31.state.ticks else 0;
            local l_keyframes_0 = v31.state.keyframes;
            l_props_0.Analytics:report("onKeyframeReductionApply", v34, v35, v37, l_keyframes_0, v36, if v31.props.AnimationData and v31.props.AnimationData.Metadata then v31.props.AnimationData.Metadata.Guid else nil);
            l_props_0.AddWaypoint(v31.animationBackup);
        else
            l_props_0.Analytics:report("onKeyframeReductionCancel", v34, v35, v36, if v31.props.AnimationData and v31.props.AnimationData.Metadata then v31.props.AnimationData.Metadata.Guid else nil);
        end;
        v31.props.OnClose();
    end;
    v31.onSliderChanged = function(v39) --[[ Line: 106 ]]
        -- upvalues: v31 (copy)
        v39 = math.round(v39);
        local l_keyframes_1 = v31.state.keyframes;
        v31:previewVisvalingamWhyatt(v39, l_keyframes_1);
        v31:setState({
            keyframes = v39, 
            hasMoved = v39 ~= v31.state.initialKeyframes or nil
        });
    end;
end;
local function v53(v41) --[[ Line: 120 ]] --[[ Name: getParents ]]
    -- upvalues: v18 (copy), v29 (copy)
    local v42 = v18.getRigInfo(v41);
    local l_PartNameToMotor_0 = v42.PartNameToMotor;
    local l_PartNameToAnimConstraint_0 = v42.PartNameToAnimConstraint;
    local l_BoneNameToBone_0 = v42.BoneNameToBone;
    local v46 = {};
    for v47, v48 in pairs(l_PartNameToMotor_0) do
        v46[v47] = v48.Part0.Name;
    end;
    for v49, v50 in pairs(l_BoneNameToBone_0) do
        v46[v49] = v50.Parent.Name;
    end;
    if v29() then
        for v51, v52 in pairs(l_PartNameToAnimConstraint_0) do
            v46[v51] = v52.Attachment0.Parent.Name;
        end;
    end;
    return v46;
end;
local function v54(v55, v56, v57, v58, v59) --[[ Line: 141 ]] --[[ Name: calculateOrientation ]]
    -- upvalues: v15 (copy), v54 (copy)
    if not v56[v58] then
        local v60 = v55[v58];
        v56[v58] = if v60 then v15.getValue(v60, v59):Orthonormalize().Rotation else CFrame.new();
        if v57[v58] then
            v56[v58] = v54(v55, v56, v57, v57[v58], v59) * v56[v58];
        end;
    end;
    return v56[v58];
end;
local function v76(v61, v62) --[[ Line: 169 ]] --[[ Name: calculateAngle ]]
    local _, _, _, v66, _, _, _, v70, _, _, _, v74 = (if v62 then v61 * v62:Inverse() else v61):GetComponents();
    local v75 = v66 + v70 + v74;
    if v75 >= 3 then
        return 1.5707963267948966;
    elseif v75 <= -1 then
        return -1.5707963267948966;
    else
        return (math.acos((v75 - 1) / 2));
    end;
end;
v30.calculateVisvalingamWhyatt = function(v77) --[[ Line: 186 ]] --[[ Name: calculateVisvalingamWhyatt ]]
    -- upvalues: v18 (copy), v19 (copy), v53 (copy), v1 (copy), v15 (copy), v12 (copy), v54 (copy), v76 (copy), v20 (copy)
    local l_sourceData_0 = v77.sourceData;
    local l_RootInstance_0 = v77.props.RootInstance;
    local l_Tracks_0 = l_sourceData_0.Instances.Root.Tracks;
    local l_Name_0 = v18.findRootPart(l_RootInstance_0).Name;
    local v82 = l_Tracks_0[l_Name_0];
    local v83 = v19.getSummaryKeyframes(l_Tracks_0, l_sourceData_0.Metadata.StartTick, l_sourceData_0.Metadata.EndTick);
    table.sort(v83);
    local v84 = v53(l_RootInstance_0);
    local v85 = v1.Dictionary.keys(l_Tracks_0);
    local v86 = table.create(#v83);
    for v87, v88 in ipairs(v83) do
        local v89 = table.create(#v85 + 4);
        table.insert(v89, v88);
        if v82 then
            local l_Position_0 = v15.getValue(v82, v88).Position;
            table.insert(v89, l_Position_0.X);
            table.insert(v89, l_Position_0.Y);
            table.insert(v89, l_Position_0.Z);
        end;
        local v91 = {};
        for _, v93 in ipairs(v85) do
            local v94 = l_Tracks_0[v93];
            if v94.Type == v12.TRACK_TYPES.CFrame then
                v54(l_Tracks_0, v91, v84, v93, v88);
                table.insert(v89, (v76(v91[v93], v91[l_Name_0])));
            elseif v94.Type == v12.TRACK_TYPES.Facs then
                table.insert(v89, (v15.getValue(v94, v88)));
            end;
        end;
        v86[v87] = v89;
    end;
    return v20(v86);
end;
v30.previewVisvalingamWhyatt = function(v95, v96, v97) --[[ Line: 249 ]] --[[ Name: previewVisvalingamWhyatt ]]
    -- upvalues: v1 (copy), v19 (copy), v11 (copy)
    if v96 == v97 then
        return;
    else
        local v98 = v1.Dictionary.join(v95.workData, {});
        local l_ticks_0 = v95.state.ticks;
        if l_ticks_0 then
            for v100, v101 in v98.Instances do
                for v102, v103 in v101.Tracks do
                    v19.traverseTracks(v102, v103, function(v104, _, v106) --[[ Line: 259 ]]
                        -- upvalues: v11 (ref), v95 (copy), v100 (copy), v96 (copy), l_ticks_0 (copy)
                        local v107 = v11.getTrack(v95.sourceData, v100, v106);
                        if v107 and v107.Data then
                            local v108 = table.create(v96);
                            local v109 = table.create(v96);
                            for v110 = 1, v96 do
                                local v111 = l_ticks_0[v110];
                                v109[v111] = v107.Data[v111];
                                if v109[v111] then
                                    table.insert(v108, v111);
                                end;
                            end;
                            table.sort(v108);
                            v104.Keyframes = v108;
                            v104.Data = v109;
                        end;
                    end, true);
                end;
            end;
            v95.props.SetAnimationData(v98);
            v95.props.StepAnimation(v95.props.Playhead);
        end;
        return;
    end;
end;
v30.didMount = function(v112) --[[ Line: 286 ]] --[[ Name: didMount ]]
    -- upvalues: v14 (copy), v13 (copy), v11 (copy), v19 (copy)
    local l_props_1 = v112.props;
    if l_props_1.Tracks == nil or v14(l_props_1.Tracks) then
        v112.onClose(false);
        return;
    else
        l_props_1.SetReadOnly(true);
        l_props_1.SetSelectedKeyframes({});
        v112.animationBackup = v13(l_props_1.AnimationData);
        v112.sourceData = v13(l_props_1.AnimationData);
        if v11.clearTrackSequences(v112.sourceData) then
            v112.props.SetAnimationData(v112.sourceData);
            v112.props.StepAnimation(v112.props.Playhead);
        end;
        for _, v115 in v112.sourceData.Instances do
            for v116, v117 in v115.Tracks do
                v19.traverseTracks(v116, v117, function(v118) --[[ Line: 327 ]]
                    for _, v120 in v118.Data do
                        v120.LeftTangent = nil;
                        v120.RightTangent = nil;
                    end;
                end, true);
            end;
        end;
        v112.workData = v13(v112.sourceData);
        local v121 = v112:calculateVisvalingamWhyatt();
        v112:setState({
            initialKeyframes = #v121, 
            keyframes = #v121, 
            ticks = v121, 
            hasMoved = false
        });
        return;
    end;
end;
v30.willUnmount = function(v122) --[[ Line: 346 ]] --[[ Name: willUnmount ]]
    if not v122.keepChanges then
        v122.props.UpdateAnimationData(v122.animationBackup);
    end;
    v122.keepChanges = false;
    v122.animationBackup = nil;
    v122.sourceData = nil;
    v122.workData = nil;
    v122.props.SetReadOnly(false);
end;
v30.render = function(v123) --[[ Line: 357 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_StyledDialog_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_Slider_0 (copy)
    local l_Stylizer_0 = v123.props.Stylizer;
    local l_Localization_0 = v123.props.Localization;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local l_keyframes_2 = v123.state.keyframes;
    local l_ticks_1 = v123.state.ticks;
    local v129 = if l_ticks_1 then math.max(#l_ticks_1, 3) else 3;
    local v130 = if l_keyframes_2 then math.max(l_keyframes_2, 2) else 2;
    local v131 = l_ticks_1 and #l_ticks_1 > 2;
    local v132 = l_Localization_0:getText("OptimizeKeyframes", "Keyframes");
    if l_ticks_1 then
        v132 = v132 .. string.format(" %d / %d", l_keyframes_2, #l_ticks_1);
    end;
    local v133 = {
        {
            Key = false, 
            Text = l_Localization_0:getText("Dialog", "Cancel"), 
            Style = "Round"
        }, 
        {
            Key = true, 
            Text = l_Localization_0:getText("Dialog", "Ok"), 
            Style = "RoundPrimary"
        }
    };
    return v3.createElement(l_StyledDialog_0, {
        MinContentSize = Vector2.new(400, 100), 
        Size = Vector2.new(400, 100), 
        TextSize = l_dialogTheme_0.textSize, 
        Resizable = false, 
        Buttons = v133, 
        OnButtonPressed = v123.onClose, 
        OnClose = v123.onClose, 
        Title = l_Localization_0:getText("Title", "OptimizeKeyframes")
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        KeyframePane = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            Padding = 10, 
            Spacing = 15, 
            LayoutOrder = 1
        }, {
            KeyframesText = v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v132, 
                TextColor3 = l_Stylizer_0.TextColor, 
                BackgroundTransparency = 1, 
                TextWrapped = true
            })
        }), 
        Slider = v3.createElement(l_Slider_0, {
            Size = UDim2.new(1, 0, 0, 30), 
            Min = 2, 
            Max = v129, 
            Value = v130, 
            Disabled = not v131, 
            OnValueChanged = v123.onSliderChanged, 
            LayoutOrder = 2
        })
    });
end;
local function v135(v134) --[[ Line: 425 ]] --[[ Name: mapStateToProps ]]
    return {
        AnimationData = v134.AnimationData, 
        Tracks = v134.Status.Tracks, 
        Playhead = v134.Status.Playhead, 
        RootInstance = v134.Status.RootInstance
    };
end;
local function v143(v136) --[[ Line: 434 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy), v5 (copy), v6 (copy), v7 (copy), v9 (copy), v10 (copy)
    return {
        AddWaypoint = function(v137) --[[ Line: 436 ]] --[[ Name: AddWaypoint ]]
            -- upvalues: v136 (copy), v8 (ref)
            v136(v8(v137));
        end, 
        SetAnimationData = function(v138) --[[ Line: 440 ]] --[[ Name: SetAnimationData ]]
            -- upvalues: v136 (copy), v5 (ref)
            v136(v5(v138));
        end, 
        SetReadOnly = function(v139) --[[ Line: 444 ]] --[[ Name: SetReadOnly ]]
            -- upvalues: v136 (copy), v6 (ref)
            v136(v6(v139));
        end, 
        SetSelectedKeyframes = function(v140) --[[ Line: 448 ]] --[[ Name: SetSelectedKeyframes ]]
            -- upvalues: v136 (copy), v7 (ref)
            v136(v7(v140));
        end, 
        StepAnimation = function(v141) --[[ Line: 452 ]] --[[ Name: StepAnimation ]]
            -- upvalues: v136 (copy), v9 (ref)
            v136(v9(v141));
        end, 
        UpdateAnimationData = function(v142) --[[ Line: 456 ]] --[[ Name: UpdateAnimationData ]]
            -- upvalues: v136 (copy), v10 (ref)
            v136(v10(v142));
        end
    };
end;
v30 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v30);
return v4.connect(v135, v143)(v30);