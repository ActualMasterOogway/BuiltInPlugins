local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Parent_0.Core.Util.Urls);
local v6 = require(l_Parent_0.Core.Actions.StopPreviewSound);
local v7 = require(l_Parent_0.Core.Actions.SetSoundLoading);
local v8 = require(l_Parent_0.Core.Actions.SetSoundElapsedTime);
local v9 = require(l_Parent_0.Core.Actions.SetSoundTotalTime);
local v10 = v3.Component:extend("SoundPreviewComponent");
v10.init = function(v11) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v5 (copy)
    v11.ref = v3.createRef();
    v11.onSoundChange = function(_, v13) --[[ Line: 21 ]]
        -- upvalues: v11 (copy)
        local l_current_0 = v11.ref.current;
        if not l_current_0 then
            return;
        else
            if l_current_0.IsLoaded ~= v11.props.isLoaded then
                v11.props.setSoundLoaded(not l_current_0.IsLoaded);
            end;
            if v13 == "TimeLength" and l_current_0.TimeLength ~= v11.props.totalTime then
                local l_TimeLength_0 = l_current_0.TimeLength;
                v11.props.setSoundTotalTime(l_TimeLength_0);
            end;
            return;
        end;
    end;
    v11.updateSound = function() --[[ Line: 36 ]]
        -- upvalues: v11 (copy), v5 (ref)
        local l_current_1 = v11.ref.current;
        local l_currentSoundId_0 = v11.props.currentSoundId;
        local l_isPlaying_0 = v11.props.isPlaying;
        if not l_current_1 then
            return;
        else
            local l_lastSoundId_0 = v11.lastSoundId;
            if l_currentSoundId_0 == 0 or not l_isPlaying_0 then
                if l_current_1.isPlaying then
                    l_current_1.Playing = false;
                    return;
                end;
            elseif l_currentSoundId_0 == l_lastSoundId_0 then
                l_current_1.Playing = true;
                return;
            else
                l_current_1.TimePosition = 0;
                l_current_1.Playing = true;
                l_current_1.SoundId = v5.constructAssetIdString(l_currentSoundId_0);
                v11.lastSoundId = l_currentSoundId_0;
            end;
            return;
        end;
    end;
    v11.onSoundEnded = function(_) --[[ Line: 64 ]]
        -- upvalues: v11 (copy)
        v11.props.stopPreviewSound();
    end;
end;
v10.didMount = function(v21) --[[ Line: 69 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v21.runServiceConnection = l_RunService_0.RenderStepped:Connect(function(v22) --[[ Line: 70 ]]
        -- upvalues: v21 (copy)
        local l_current_2 = v21.ref.current;
        local l_elapsedTime_0 = v21.props.elapsedTime;
        if not l_current_2 or not l_current_2.Playing then
            return;
        else
            local v25 = l_elapsedTime_0 + v22;
            local l_TimeLength_1 = l_current_2.TimeLength;
            if l_TimeLength_1 <= v25 then
                v25 = l_TimeLength_1;
            end;
            if l_elapsedTime_0 ~= v25 then
                v21.props.setSoundElapsedTime(v25);
            end;
            return;
        end;
    end);
end;
v10.willUnmount = function(v27) --[[ Line: 90 ]] --[[ Name: willUnmount ]]
    if v27.runServiceConnection then
        v27.runServiceConnection:Disconnect();
        v27.runServiceConnection = nil;
    end;
end;
v10.render = function(v28) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    return v3.createElement("Sound", {
        [v3.Ref] = v28.ref, 
        [v3.Event.Ended] = v28.onSoundEnded, 
        [v3.Event.Changed] = v28.onSoundChange, 
        UsageContextPermission = Enum.UsageContext.Preview
    });
end;
v10.didUpdate = function(v29) --[[ Line: 106 ]] --[[ Name: didUpdate ]]
    v29.updateSound();
end;
return v4.connect(function(v30, _) --[[ Line: 110 ]] --[[ Name: mapStateToProps ]]
    local v32 = (v30 or {}).sound or {};
    return {
        currentSoundId = v32.currentSoundId or 0, 
        elapsedTime = v32.elapsedTime or 0, 
        isPlaying = v32.isPlaying or false
    };
end, function(v33) --[[ Line: 123 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    return {
        stopPreviewSound = function() --[[ Line: 125 ]] --[[ Name: stopPreviewSound ]]
            -- upvalues: v33 (copy), v6 (ref)
            v33(v6());
        end, 
        setSoundLoaded = function(v34) --[[ Line: 128 ]] --[[ Name: setSoundLoaded ]]
            -- upvalues: v33 (copy), v7 (ref)
            v33(v7(v34));
        end, 
        setSoundElapsedTime = function(v35) --[[ Line: 131 ]] --[[ Name: setSoundElapsedTime ]]
            -- upvalues: v33 (copy), v8 (ref)
            v33(v8(v35));
        end, 
        setSoundTotalTime = function(v36) --[[ Line: 134 ]] --[[ Name: setSoundTotalTime ]]
            -- upvalues: v33 (copy), v9 (ref)
            v33(v9(v36));
        end
    };
end)(v10);