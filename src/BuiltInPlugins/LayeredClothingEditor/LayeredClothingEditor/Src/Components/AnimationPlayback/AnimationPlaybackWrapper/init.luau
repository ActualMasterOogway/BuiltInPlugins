local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_PreviewingInfo_0 = v3.Util.AccessoryAndBodyToolShared.PreviewingInfo;
local l_PreviewAnimationPlayback_0 = v3.Components.PreviewAnimationPlayback;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_PreviewContext_0 = v3.Contexts.PreviewContext;
local v8 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v8.ContextServices.withContext;
local v10 = v1.PureComponent:extend("AnimationPlaybackWrapper");
local v11 = require(l_Parent_0.Src.Actions.SetPlayhead);
local v12 = require(l_Parent_0.Src.Actions.SetTrackLength);
local v13 = require(l_Parent_0.Src.Actions.SetIsPlaying);
v8.Util.Typecheck.wrap(v10, script);
v10.init = function(v14) --[[ Line: 45 ]] --[[ Name: init ]]
    v14.previewAvatar = {};
end;
v10.updatePreviewAvatar = function(v15) --[[ Line: 49 ]] --[[ Name: updatePreviewAvatar ]]
    local l_PreviewContext_1 = v15.props.PreviewContext;
    local v17 = l_PreviewContext_1:getCurrentPreviewAvatarIndex();
    local v18 = {
        l_PreviewContext_1:getAvatars()[v17]
    };
    if v18 ~= v15.previewAvatar then
        v15.previewAvatar = v18;
        v15:setState({
            temp = {}
        });
    end;
end;
v10.didMount = function(v19) --[[ Line: 64 ]] --[[ Name: didMount ]]
    v19.previewModelChangedConnection = v19.props.PreviewContext:getAnimationTargetChangedSignal():Connect(function() --[[ Line: 68 ]]
        -- upvalues: v19 (copy)
        v19:updatePreviewAvatar();
    end);
    v19:updatePreviewAvatar();
end;
v10.render = function(v20) --[[ Line: 75 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_PreviewAnimationPlayback_0 (copy)
    local l_props_0 = v20.props;
    local l_AnimationId_0 = l_props_0.AnimationId;
    local l_IsPlaying_0 = l_props_0.IsPlaying;
    local l_SetPlayhead_0 = l_props_0.SetPlayhead;
    local l_SetTrackLength_0 = l_props_0.SetTrackLength;
    local l_SetIsPlaying_0 = l_props_0.SetIsPlaying;
    local l_SliderPlayhead_0 = l_props_0.SliderPlayhead;
    return v1.createElement(l_PreviewAnimationPlayback_0, {
        AnimationId = l_AnimationId_0, 
        IsPlayingOverride = l_IsPlaying_0, 
        PreviewAvatars = v20.previewAvatar, 
        PlayheadOverride = l_SliderPlayhead_0, 
        OnPlayheadChanged = l_SetPlayhead_0, 
        OnIsPlayingChanged = l_SetIsPlaying_0, 
        OnTrackLengthChanged = l_SetTrackLength_0
    });
end;
v10.willUnmount = function(v28) --[[ Line: 96 ]] --[[ Name: willUnmount ]]
    if v28.previewModelChangedConnection then
        v28.previewModelChangedConnection:Disconnect();
        v28.previewModelChangedConnection = nil;
    end;
end;
v10 = l_withContext_0({
    EditingItemContext = l_EditingItemContext_0, 
    PreviewContext = l_PreviewContext_0
})(v10);
return v2.connect(function(v29, _) --[[ Line: 108 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_PreviewingInfo_0 (copy)
    local l_animation_0 = v29.animation;
    return {
        AnimationId = l_PreviewingInfo_0.getPreviewingAnimationId(v29), 
        IsPlaying = l_animation_0.IsPlaying, 
        Playhead = l_animation_0.Playhead, 
        SliderPlayhead = l_animation_0.SliderPlayhead
    };
end, function(v32) --[[ Line: 118 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v12 (copy), v13 (copy)
    return {
        SetPlayhead = function(v33) --[[ Line: 120 ]] --[[ Name: SetPlayhead ]]
            -- upvalues: v32 (copy), v11 (ref)
            v32(v11(v33));
        end, 
        SetTrackLength = function(v34) --[[ Line: 123 ]] --[[ Name: SetTrackLength ]]
            -- upvalues: v32 (copy), v12 (ref)
            v32(v12(v34));
        end, 
        SetIsPlaying = function(v35) --[[ Line: 126 ]] --[[ Name: SetIsPlaying ]]
            -- upvalues: v32 (copy), v13 (ref)
            v32(v13(v35));
        end
    };
end)(v10);