local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.Typecheck);
local v5 = require(l_Parent_0.UI.Components.Container);
local v6 = require(l_Parent_0.UI.Components.Image);
local v7 = require(l_Parent_0.UI.Components.MediaPlayerControls);
local v8 = require(l_Parent_0.UI.Components.MediaPlayerWrapper.MediaPlayerSignal);
local v9 = v1.PureComponent:extend("StatelessAudioPlayer");
v4.wrap(v9, script);
v9.init = function(v10) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v8 (copy)
    v10.soundRef = v1.createRef();
    v10.onSoundChange = function(v11, v12) --[[ Line: 46 ]]
        -- upvalues: v10 (copy)
        if v10.unmounting then
            return;
        else
            if v12 == "SoundId" then
                v10.props.OnEnd();
            end;
            if v12 == "TimeLength" then
                v10.props.SetTimeLength(v11.TimeLength);
                v10.props.SetIsLoaded(v11.IsLoaded);
                return;
            else
                if v11.IsLoaded ~= v10.props.IsLoaded then
                    v10.props.SetIsLoaded(v11.IsLoaded);
                end;
                return;
            end;
        end;
    end;
    v10.handleMediaPlayerSignal = function(v13) --[[ Line: 62 ]]
        -- upvalues: v10 (copy), v8 (ref)
        local v14 = v10.soundRef:getValue();
        local l_unmounting_0 = v10.unmounting;
        if not v14 or l_unmounting_0 then
            return;
        elseif v13 == v8.PLAY then
            v14.SoundId = v10.props.SoundId;
            v14.Playing = true;
            return;
        elseif v13 == v8.PAUSE then
            v14.Playing = false;
            return;
        else
            if v13 == v8.SET_TIME and v10.props.IsPlaying then
                v14.TimePosition = v10.props.CurrentTime;
            end;
            return;
        end;
    end;
end;
v9.didMount = function(v16) --[[ Line: 82 ]] --[[ Name: didMount ]]
    v16.mediaPlayerSignalConnection = v16.props.MediaPlayerSignal:Connect(v16.handleMediaPlayerSignal);
end;
v9.willUnmount = function(v17) --[[ Line: 86 ]] --[[ Name: willUnmount ]]
    v17.unmounting = true;
    if v17.mediaPlayerSignalConnection then
        v17.mediaPlayerSignalConnection:Disconnect();
        v17.mediaPlayerSignalConnection = nil;
    end;
end;
v9.render = function(v18) --[[ Line: 94 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v1 (copy), v5 (copy), v6 (copy)
    local l_props_0 = v18.props;
    local l_Stylizer_0 = v18.props.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local v24 = v7.calculateSize(l_Stylizer_0.MediaPlayerControls);
    return v1.createElement(v5, {
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 10)
        }), 
        PlaceholderImageFrame = v1.createElement(v5, {
            LayoutOrder = 1, 
            Size = UDim2.new(UDim.new(1, 0), UDim.new(1, 0) - v24.Y)
        }, {
            PlaceholderImage = v1.createElement(v6, {
                Style = l_Stylizer_0.PlaceholderImage
            })
        }), 
        MediaPlayerControls = v1.createElement(v7, {
            LayoutOrder = 2, 
            Style = l_Stylizer_0.MediaPlayerControls, 
            IsPlaying = l_props_0.IsPlaying, 
            IsLoaded = l_props_0.IsLoaded, 
            OnPause = l_props_0.OnPause, 
            OnPlay = l_props_0.OnPlay, 
            TimeLength = l_props_0.TimeLength, 
            CurrentTime = l_props_0.CurrentTime, 
            OnScrub = l_props_0.SetCurrentTime
        }), 
        SoundObj = v1.createElement("Sound", {
            Looped = false, 
            SoundId = l_props_0.SoundId, 
            UsageContextPermission = l_props_0.UsageContext, 
            [v1.Ref] = v18.soundRef, 
            [v1.Event.Changed] = v18.onSoundChange, 
            [v1.Event.Ended] = l_props_0.OnEnd
        })
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v9));