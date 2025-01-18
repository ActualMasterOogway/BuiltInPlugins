local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_RunService_0 = game:GetService("RunService");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v3 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Core.Util.Urls);
game:DefineFastFlag("StudioAudioPermissionFix", false);
local v7 = v3.PureComponent:extend("AudioPlayer");
v7.init = function(v8, v9) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v8.frameRef = v3.createRef();
    v8.audioRef = v3.createRef();
    local v10, v11 = v3.createBinding(0);
    v8.elapsedTime = v10;
    v8.updateElapsedTime = v11;
    v8.state = {
        isLoaded = false, 
        totalTime = 0
    };
    v8.onSoundChange = function(_, v13) --[[ Line: 45 ]]
        -- upvalues: v8 (copy)
        if not v8.isMounted or not v8.audioRef.current then
            return;
        else
            if (v13 == "Playing" or v13 == "TimePosition") and v8.audioRef.current.TimePosition ~= v8.elapsedTime:getValue() then
                v8.updateElapsedTime(v8.audioRef.current.TimePosition);
            end;
            v8:setState(function(v14) --[[ Line: 57 ]]
                -- upvalues: v8 (ref), v13 (copy)
                local v15 = {
                    isLoaded = v8.audioRef.current.IsLoaded
                };
                if v13 == "TimeLength" and v8.audioRef.current.TimeLength ~= v14.totalTime then
                    v15.totalTime = v8.audioRef.current.TimeLength;
                end;
                return v15;
            end);
            return;
        end;
    end;
    v8.calculateTimePosition = function(v16) --[[ Line: 70 ]]
        -- upvalues: v8 (copy)
        local l_current_0 = v8.frameRef.current;
        return (math.clamp((v16.Position.X - l_current_0.AbsolutePosition.X) / l_current_0.AbsoluteSize.X, 0, 1));
    end;
    v8.handleIndicatorEvent = function(_, v19) --[[ Line: 76 ]]
        -- upvalues: v8 (copy)
        if v19.UserInputType == Enum.UserInputType.MouseButton1 then
            v8.indicatorPressed = true;
        end;
    end;
    v8.updateTimePosition = function(v20) --[[ Line: 82 ]]
        -- upvalues: v8 (copy)
        local v21 = v8.state.totalTime * v20;
        v8.audioRef.current.TimePosition = v21;
    end;
    v8.onSoundEnded = function() --[[ Line: 87 ]]
        -- upvalues: v9 (copy)
        if v9.OnEnded then
            v9.OnEnded();
        end;
    end;
    v8.getCurrentTimeProgress = function(v22) --[[ Line: 93 ]]
        -- upvalues: v8 (copy)
        local v23 = v8.state.totalTime ~= 0 and v22 / v8.state.totalTime or 0;
        return v8.state.indicatorPosition or v23;
    end;
end;
v7.didMount = function(v24) --[[ Line: 100 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v24.isMounted = true;
    v24.runServiceConnection = l_RunService_0.RenderStepped:Connect(function(v25) --[[ Line: 103 ]]
        -- upvalues: v24 (copy)
        if not v24.isMounted or not v24.audioRef.current or not v24.audioRef.current.IsPlaying then
            return;
        else
            local l_current_1 = v24.audioRef.current;
            local v27 = v24.elapsedTime:getValue() + v25;
            local l_TimeLength_0 = l_current_1.TimeLength;
            v24.updateElapsedTime((math.min(v27, l_TimeLength_0)));
            return;
        end;
    end);
end;
v7.willUnmount = function(v29) --[[ Line: 117 ]] --[[ Name: willUnmount ]]
    v29.isMounted = false;
    if v29.runServiceConnection then
        v29.runServiceConnection:Disconnect();
        v29.runServiceConnection = nil;
    end;
end;
v7.render = function(v30) --[[ Line: 125 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v6 (copy)
    local l_props_0 = v30.props;
    local l_state_0 = v30.state;
    local l_isLoaded_0 = l_state_0.isLoaded;
    local l_IsPlaying_0 = l_props_0.IsPlaying;
    local l_SoundId_0 = l_props_0.SoundId;
    local l_audioPlayer_0 = l_props_0.Stylizer.audioPlayer;
    local v38 = v30.elapsedTime:map(function(v37) --[[ Line: 134 ]]
        -- upvalues: v30 (copy)
        return UDim2.new(v30.getCurrentTimeProgress(v37), 0, 1, 0);
    end);
    local v40 = v30.elapsedTime:map(function(v39) --[[ Line: 138 ]]
        -- upvalues: v30 (copy)
        return UDim2.new(v30.getCurrentTimeProgress(v39), 0, 0.5, 0);
    end);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 4), 
        BackgroundColor3 = l_audioPlayer_0.backgroundColor, 
        [v3.Ref] = v30.frameRef
    }, {
        Button = v3.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 12), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            [v3.Event.InputChanged] = function(_, v42) --[[ Line: 152 ]]
                -- upvalues: v30 (copy)
                if v42.UserInputType == Enum.UserInputType.MouseMovement and v30.indicatorPressed then
                    v30:setState({
                        indicatorPosition = v30.calculateTimePosition(v42)
                    });
                end;
            end, 
            [v3.Event.InputEnded] = function(_, v44) --[[ Line: 157 ]]
                -- upvalues: v30 (copy), v3 (ref)
                if v44.UserInputType == Enum.UserInputType.MouseButton1 then
                    v30.updateTimePosition(v30.calculateTimePosition(v44));
                    v30.indicatorPressed = false;
                    v30:setState({
                        indicatorPosition = v3.None
                    });
                end;
            end
        }), 
        ProgressBar = v3.createElement("Frame", {
            BackgroundColor3 = l_audioPlayer_0.progressBarColor, 
            Size = v38, 
            ZIndex = 1
        }, v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        })), 
        ProgressIndicator = v3.createElement("Frame", {
            BackgroundColor3 = l_audioPlayer_0.indicatorColor, 
            Size = UDim2.new(0, 12, 0, 12), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = v40, 
            ZIndex = 3, 
            [v3.Event.InputBegan] = function(_, v46) --[[ Line: 182 ]]
                -- upvalues: v30 (copy)
                if v46.UserInputType == Enum.UserInputType.MouseButton1 then
                    v30.indicatorPressed = true;
                end;
            end
        }, {
            CornerRadius = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            })
        }), 
        ProgressIndicatorBorder = v3.createElement("Frame", {
            BackgroundColor3 = l_audioPlayer_0.indicatorBorderColor, 
            Size = UDim2.new(0, 14, 0, 14), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = v40, 
            ZIndex = 2
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 14)
            })
        }), 
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(4, 4)
        }), 
        Sound = v3.createElement("Sound", {
            [v3.Ref] = v30.audioRef, 
            [v3.Event.Changed] = v30.onSoundChange, 
            [v3.Event.Ended] = v30.onSoundEnded, 
            SoundId = v6.constructAssetIdString(l_SoundId_0), 
            Playing = not l_state_0.indicatorPosition and l_isLoaded_0 and l_IsPlaying_0, 
            UsageContextPermission = if game:GetFastFlag("StudioAudioPermissionFix") then Enum.UsageContext.Preview else nil
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));