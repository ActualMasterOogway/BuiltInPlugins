local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.Typecheck);
local v5 = require(l_Parent_0.Util.Immutable);
local v6 = require(l_Parent_0.Util.Math);
local v7 = require(l_Parent_0.Util.isInputMainPress);
local v8 = require(l_Parent_0.UI.Components.Container);
local v9 = require(l_Parent_0.UI.Components.Image);
local v10 = require(l_Parent_0.UI.Components.HoverArea);
local v11 = require(l_Parent_0.UI.Components.MediaPlayerControls);
local v12 = require(l_Parent_0.UI.Components.MediaPlayerWrapper.MediaPlayerSignal);
local v13 = v1.PureComponent:extend("StatelessVideoPlayer");
v4.wrap(v13, script);
local v14 = require(l_Parent_0.SharedFlags.getFFlagDFVideoStudioPreviewPermissionFix);
v13.init = function(v15) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v12 (copy), v6 (copy), v7 (copy)
    v15.layoutRef = v1.createRef();
    v15.videoRef = v1.createRef();
    v15.videoContainerRef = v1.createRef();
    v15.onVideoChange = function(_, v17) --[[ Line: 55 ]]
        -- upvalues: v15 (copy)
        local v18 = v15.videoRef:getValue();
        local l_unmounting_0 = v15.unmounting;
        if not v18 or l_unmounting_0 then
            return;
        else
            local v20 = v18 and v18.IsLoaded;
            if v17 == "Video" then
                v15.props.OnEnd();
            end;
            if v17 == "TimeLength" then
                v15.props.SetTimeLength(v18.TimeLength);
                v15.props.SetIsLoaded(v20);
                return;
            elseif v20 ~= v15.props.IsLoaded then
                v15.props.SetIsLoaded(v20);
                return;
            else
                if v17 == "Resolution" then
                    v15.onResize();
                end;
                return;
            end;
        end;
    end;
    v15.handleMediaPlayerSignal = function(v21) --[[ Line: 76 ]]
        -- upvalues: v15 (copy), v12 (ref)
        local v22 = v15.videoRef:getValue();
        local l_unmounting_1 = v15.unmounting;
        if not v22 or l_unmounting_1 then
            return;
        elseif v21 == v12.PLAY then
            v22:Play();
            return;
        elseif v21 == v12.PAUSE then
            v22:Pause();
            return;
        else
            if v21 == v12.SET_TIME then
                v22.TimePosition = v15.props.CurrentTime;
            end;
            return;
        end;
    end;
    v15.togglePlay = function() --[[ Line: 92 ]]
        -- upvalues: v15 (copy)
        if v15.props.IsPlaying then
            v15.props.OnPause();
            return;
        else
            v15.props.OnPlay();
            return;
        end;
    end;
    v15.onResize = function() --[[ Line: 100 ]]
        -- upvalues: v15 (copy), v6 (ref)
        local v24 = v15.layoutRef:getValue();
        local v25 = v15.videoRef:getValue();
        local v26 = v15.videoContainerRef:getValue();
        if not v25 or not v24 or not v26 then
            return;
        else
            local l_Resolution_0 = v25.Resolution;
            local v28 = l_Resolution_0.X / l_Resolution_0.Y;
            if v6.isNaN(v28) then
                return;
            else
                local l_Y_0 = v26.AbsoluteSize.Y;
                local v30 = l_Y_0 * v28;
                if v24.AbsoluteContentSize.X < v30 then
                    v30 = v24.AbsoluteContentSize.X;
                    l_Y_0 = v30 * (1 / v28);
                end;
                v25.Size = UDim2.new(UDim.new(0, v30), UDim.new(0, l_Y_0));
                return;
            end;
        end;
    end;
    v15.onInputBegan = function(_, v32) --[[ Line: 128 ]]
        -- upvalues: v7 (ref), v15 (copy)
        if v7(v32) and v15.props.IsLoaded then
            v15.togglePlay();
        end;
    end;
end;
v13.didMount = function(v33) --[[ Line: 136 ]] --[[ Name: didMount ]]
    -- upvalues: v14 (copy)
    v33.onResize();
    if v14() then
        local v34 = v33.videoRef:getValue();
        if v34 then
            v34:SetStudioPreview(true);
            v34.Video = v33.props.VideoId;
        end;
    end;
    v33.mediaPlayerSignalConnection = v33.props.MediaPlayerSignal:Connect(v33.handleMediaPlayerSignal);
end;
v13.didUpdate = function(v35, v36) --[[ Line: 148 ]] --[[ Name: didUpdate ]]
    -- upvalues: v14 (copy)
    if v14() then
        if v36.VideoId == v35.props.VideoId then
            return;
        else
            local v37 = v35.videoRef:getValue();
            if v37 then
                v37.Video = v35.props.VideoId;
            end;
        end;
    end;
end;
v13.willUnmount = function(v38) --[[ Line: 160 ]] --[[ Name: willUnmount ]]
    v38.unmounting = true;
    if v38.mediaPlayerSignalConnection then
        v38.mediaPlayerSignalConnection:Disconnect();
        v38.mediaPlayerSignalConnection = nil;
    end;
end;
v13.render = function(v39) --[[ Line: 168 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v1 (copy), v8 (copy), v10 (copy), v14 (copy), v5 (copy), v9 (copy)
    local l_props_0 = v39.props;
    local l_IsLoaded_0 = l_props_0.IsLoaded;
    local l_IsPlaying_0 = l_props_0.IsPlaying;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local v47 = v11.calculateSize(l_Stylizer_0.MediaPlayerControls);
    local v48 = UDim.new(0, 10);
    return v1.createElement(v8, {
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v48, 
            [v1.Change.AbsoluteContentSize] = v39.onResize, 
            [v1.Ref] = v39.layoutRef
        }), 
        VideoContainer = v1.createElement(v8, {
            LayoutOrder = 1, 
            Size = UDim2.new(UDim.new(1, 0), UDim.new(1, 0) - v47.Y - v48), 
            [v1.Ref] = v39.videoContainerRef
        }, {
            HoverArea = v1.createElement(v10, {
                Cursor = "PointingHand"
            }), 
            VideoFrame = v1.createElement("VideoFrame", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                Looped = false, 
                Video = if v14() then nil else l_props_0.VideoId, 
                [v1.Ref] = v39.videoRef, 
                [v1.Event.Changed] = v39.onVideoChange, 
                [v1.Event.Ended] = l_props_0.OnEnd, 
                [v1.Event.InputBegan] = v39.onInputBegan
            }, {
                PausedOverlay = not l_IsPlaying_0 and v1.createElement(v8, v5.JoinDictionaries({
                    Size = UDim2.new(1, 0, 1, 0)
                }, l_Stylizer_0.PausedOverlay), {
                    PlayVideoIcon = l_IsLoaded_0 and v1.createElement(v9, {
                        Style = l_Stylizer_0.PlayVideoIcon
                    })
                })
            })
        }), 
        MediaPlayerControls = v1.createElement(v11, {
            Style = l_Stylizer_0.MediaPlayerControls, 
            LayoutOrder = 2, 
            IsPlaying = l_props_0.IsPlaying, 
            IsLoaded = l_props_0.IsLoaded, 
            OnPause = l_props_0.OnPause, 
            OnPlay = l_props_0.OnPlay, 
            TimeLength = l_props_0.TimeLength, 
            CurrentTime = l_props_0.CurrentTime, 
            OnScrub = l_props_0.SetCurrentTime
        })
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v13));