local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.Util);
local l_Signal_0 = v3.Signal;
local l_Immutable_0 = v3.Immutable;
local v6 = require(script.MediaPlayerSignal);
return function(v7) --[[ Line: 16 ]] --[[ Name: MediaPlayerWrapper ]]
    -- upvalues: v2 (copy), l_Signal_0 (copy), v6 (copy), l_RunService_0 (copy), l_Immutable_0 (copy)
    local v8 = v2.PureComponent:extend(("MediaPlayerWrapper(%s)"):format((tostring(v7))));
    v8.init = function(v9) --[[ Line: 19 ]] --[[ Name: init ]]
        -- upvalues: l_Signal_0 (ref), v6 (ref)
        v9.state = {
            currentTime = 0, 
            isPlaying = false, 
            isLoaded = false, 
            timeLength = 0
        };
        v9.mediaPlayerSignal = l_Signal_0.new();
        v9.play = function() --[[ Line: 29 ]]
            -- upvalues: v9 (copy), v6 (ref)
            v9.mediaPlayerSignal:Fire(v6.PLAY);
            v9:setState({
                isPlaying = true
            });
            if v9.props.OnPlay then
                v9.props.OnPlay();
            end;
        end;
        v9.pause = function() --[[ Line: 40 ]]
            -- upvalues: v9 (copy), v6 (ref)
            v9.mediaPlayerSignal:Fire(v6.PAUSE);
            v9:setState({
                isPlaying = false
            });
            if v9.props.OnPause then
                v9.props.OnPause();
            end;
        end;
        v9.onEnd = function() --[[ Line: 51 ]]
            -- upvalues: v9 (copy), v6 (ref)
            v9:setState({
                currentTime = 0, 
                isPlaying = false
            });
            v9.mediaPlayerSignal:Fire(v6.SET_TIME);
            v9.mediaPlayerSignal:Fire(v6.PAUSE);
        end;
        v9.setIsLoaded = function(v10) --[[ Line: 62 ]]
            -- upvalues: v9 (copy)
            v9:setState({
                isLoaded = v10
            });
        end;
        v9.setCurrentTime = function(v11) --[[ Line: 68 ]]
            -- upvalues: v9 (copy), v6 (ref)
            v9:setState({
                currentTime = v11
            });
            v9.mediaPlayerSignal:Fire(v6.SET_TIME);
        end;
        v9.setTimeLength = function(v12) --[[ Line: 75 ]]
            -- upvalues: v9 (copy)
            v9:setState({
                timeLength = v12
            });
        end;
        v9.onRenderStepped = function(v13) --[[ Line: 81 ]]
            -- upvalues: v9 (copy)
            if not v9.isMounted or not v9.state.isPlaying then
                return;
            else
                local v14 = v9.state.currentTime + v13;
                if v14 < v9.state.timeLength then
                    v9:setState({
                        currentTime = v14
                    });
                end;
                return;
            end;
        end;
    end;
    v8.didMount = function(v15) --[[ Line: 96 ]] --[[ Name: didMount ]]
        -- upvalues: l_RunService_0 (ref)
        v15.isMounted = true;
        v15.runServiceConnection = l_RunService_0.RenderStepped:Connect(v15.onRenderStepped);
    end;
    v8.willUnmount = function(v16) --[[ Line: 101 ]] --[[ Name: willUnmount ]]
        v16.isMounted = false;
        if v16.runServiceConnection then
            v16.runServiceConnection:Disconnect();
            v16.runServiceConnection = nil;
        end;
    end;
    v8.render = function(v17) --[[ Line: 109 ]] --[[ Name: render ]]
        -- upvalues: l_Immutable_0 (ref), v2 (ref), v7 (copy)
        local l_state_0 = v17.state;
        local v19 = l_Immutable_0.JoinDictionaries(v17.props, {
            CurrentTime = l_state_0.currentTime, 
            IsLoaded = l_state_0.isLoaded, 
            IsPlaying = l_state_0.isPlaying, 
            MediaPlayerSignal = v17.mediaPlayerSignal, 
            SetIsLoaded = v17.setIsLoaded, 
            OnEnd = v17.onEnd, 
            OnPlay = v17.play, 
            OnPause = v17.pause, 
            SetCurrentTime = v17.setCurrentTime, 
            SetTimeLength = v17.setTimeLength, 
            TimeLength = l_state_0.timeLength
        });
        return v2.createElement(v7, v19);
    end;
    return v8;
end;