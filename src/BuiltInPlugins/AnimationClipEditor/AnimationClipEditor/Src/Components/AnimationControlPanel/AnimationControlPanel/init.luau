local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Components.AnimationControlPanel.AnimationClipDropdown);
local v7 = require(l_script_FirstAncestor_0.Src.Components.AnimationControlPanel.MediaControls);
local v8 = require(l_script_FirstAncestor_0.Src.Components.AnimationControlPanel.TimeDisplay);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.Playback.TogglePlay);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.ToggleLooping);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v12 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.SkipAnimation);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateEditingLength);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v16 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v17 = v1.PureComponent:extend("AnimationControlPanel");
v17.init = function(v18) --[[ Line: 38 ]] --[[ Name: init ]]
    v18.toggleLoopingWrapper = function() --[[ Line: 39 ]]
        -- upvalues: v18 (copy)
        return v18.props.ToggleLooping(v18.props.Analytics);
    end;
    v18.loadAnimationDataWrapper = function(v19) --[[ Line: 42 ]]
        -- upvalues: v18 (copy)
        return v18.props.LoadAnimationData(v19, v18.props.Analytics);
    end;
    v18.skipBackwardWrapper = function() --[[ Line: 45 ]]
        -- upvalues: v18 (copy)
        return v18.props.SkipBackward(v18.props.Analytics);
    end;
    v18.skipForwardWrapper = function() --[[ Line: 49 ]]
        -- upvalues: v18 (copy)
        return v18.props.SkipForward(v18.props.Analytics);
    end;
    v18.setPlayStateWrapper = function(v20) --[[ Line: 53 ]]
        -- upvalues: v18 (copy)
        return v18.props.SetPlayState(v20, v18.props.Analytics);
    end;
    v18.goToFirstFrameWrapper = function() --[[ Line: 57 ]]
        -- upvalues: v18 (copy)
        return v18.props.StepAnimation(0);
    end;
    v18.goToLastFrameWrapper = function() --[[ Line: 62 ]]
        -- upvalues: v18 (copy)
        local l_props_0 = v18.props;
        local l_AnimationData_0 = l_props_0.AnimationData;
        return l_props_0.StepAnimation(l_AnimationData_0.Metadata.EndTick);
    end;
end;
v17.render = function(v23) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v1 (copy), v3 (copy), v6 (copy), v7 (copy), v8 (copy)
    local l_props_1 = v23.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_AnimationData_1 = l_props_1.AnimationData;
    local l_IsLegacyAnimSaves_0 = l_props_1.IsLegacyAnimSaves;
    local l_PlayState_0 = l_props_1.PlayState;
    local l_RootInstance_0 = l_props_1.RootInstance;
    local l_StartTick_0 = l_props_1.StartTick;
    local l_EndTick_0 = l_props_1.EndTick;
    local l_Playhead_0 = l_props_1.Playhead;
    local l_EditingLength_0 = l_props_1.EditingLength;
    local v34 = if v16() then nil else l_props_1.ShowAsSeconds;
    local l_TimelineUnit_0 = l_props_1.TimelineUnit;
    local l_UpdateEditingLength_0 = l_props_1.UpdateEditingLength;
    local l_StepAnimation_0 = l_props_1.StepAnimation;
    local l_FrameRate_0 = l_props_1.FrameRate;
    local l_IsChannelAnimation_0 = l_props_1.IsChannelAnimation;
    local l_ReadOnly_0 = l_props_1.ReadOnly;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v3.TIMELINE_HEIGHT), 
        BorderSizePixel = 1, 
        LayoutOrder = 0, 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderColor3 = l_Stylizer_0.borderColor
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        AnimationClipDropdown = v1.createElement(v6, {
            AnimationName = l_AnimationData_1 and l_AnimationData_1.Metadata.Name or "", 
            IsLegacyAnimSaves = l_IsLegacyAnimSaves_0, 
            RootInstance = l_RootInstance_0, 
            LoadAnimationData = v23.loadAnimationDataWrapper, 
            InstanceType = l_RootInstance_0 and l_AnimationData_1 and l_AnimationData_1.Instances.Root.Type, 
            LayoutOrder = 0, 
            IsChannelAnimation = l_IsChannelAnimation_0
        }), 
        MediaControls = v1.createElement(v7, {
            PlayState = l_PlayState_0, 
            IsLooping = l_AnimationData_1 and l_AnimationData_1.Metadata and l_AnimationData_1.Metadata.Looping or false, 
            SkipBackward = v23.skipBackwardWrapper, 
            SkipForward = v23.skipForwardWrapper, 
            SetPlayState = v23.setPlayStateWrapper, 
            ToggleLooping = v23.toggleLoopingWrapper, 
            GoToFirstFrame = v23.goToFirstFrameWrapper, 
            GoToLastFrame = v23.goToLastFrameWrapper, 
            LayoutOrder = 1
        }), 
        TimeDisplay = v1.createElement(v8, {
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            FrameRate = l_FrameRate_0, 
            ShowAsTime = if v16() then nil else v34, 
            TimelineUnit = l_TimelineUnit_0, 
            AnimationData = l_AnimationData_1, 
            Playhead = l_Playhead_0, 
            EditingLength = l_EditingLength_0, 
            StepAnimation = l_StepAnimation_0, 
            UpdateEditingLength = l_UpdateEditingLength_0, 
            ReadOnly = l_ReadOnly_0, 
            LayoutOrder = 2
        })
    });
end;
v17 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Analytics = l_ContextServices_0.Analytics
})(v17);
return v2.connect(function(v41) --[[ Line: 147 ]] --[[ Name: mapStateToProps ]]
    return {
        FrameRate = v41.Status.FrameRate, 
        PlayState = v41.Status.PlayState, 
        ReadOnly = v41.Status.ReadOnly, 
        RootInstance = v41.Status.RootInstance
    };
end, function(v42) --[[ Line: 156 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy), v11 (copy), v15 (copy), v12 (copy), v14 (copy), v13 (copy)
    return {
        ToggleLooping = function(v43) --[[ Line: 158 ]] --[[ Name: ToggleLooping ]]
            -- upvalues: v42 (copy), v10 (ref)
            v42(v10(v43));
        end, 
        StepAnimation = function(v44) --[[ Line: 162 ]] --[[ Name: StepAnimation ]]
            -- upvalues: v42 (copy), v11 (ref)
            v42(v11(v44));
        end, 
        SetPlayState = function(v45) --[[ Line: 166 ]] --[[ Name: SetPlayState ]]
            -- upvalues: v42 (copy), v15 (ref)
            v42(v15(v45));
        end, 
        LoadAnimationData = function(v46, v47) --[[ Line: 170 ]] --[[ Name: LoadAnimationData ]]
            -- upvalues: v42 (copy), v12 (ref)
            v42(v12(v46, v47));
        end, 
        UpdateEditingLength = function(v48) --[[ Line: 174 ]] --[[ Name: UpdateEditingLength ]]
            -- upvalues: v42 (copy), v14 (ref)
            v42(v14(v48));
        end, 
        SkipBackward = function(v49) --[[ Line: 178 ]] --[[ Name: SkipBackward ]]
            -- upvalues: v42 (copy), v13 (ref)
            v42(v13(false, v49));
        end, 
        SkipForward = function(v50) --[[ Line: 182 ]] --[[ Name: SkipForward ]]
            -- upvalues: v42 (copy), v13 (ref)
            v42(v13(true, v50));
        end
    };
end)(v17);