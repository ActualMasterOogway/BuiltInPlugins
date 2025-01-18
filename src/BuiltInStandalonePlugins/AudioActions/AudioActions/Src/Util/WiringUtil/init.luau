local v0 = {};
local v1 = {
    AudioPlayer = {
        HasInput = false, 
        HasOutput = true
    }, 
    AudioDeviceInput = {
        HasInput = false, 
        HasOutput = true
    }, 
    AudioDeviceOutput = {
        HasInput = true, 
        HasOutput = false
    }, 
    AudioEmitter = {
        HasInput = true, 
        HasOutput = false
    }, 
    AudioListener = {
        HasInput = false, 
        HasOutput = true
    }, 
    AudioChorus = {
        HasInput = true, 
        HasOutput = true
    }, 
    AudioCompressor = {
        HasInput = true, 
        HasOutput = true, 
        HasSidechain = true
    }, 
    AudioDistortion = {
        HasInput = true, 
        HasOutput = true
    }, 
    AudioEcho = {
        HasInput = true, 
        HasOutput = true
    }, 
    AudioEqualizer = {
        HasInput = true, 
        HasOutput = true
    }, 
    AudioFader = {
        HasInput = true, 
        HasOutput = true
    }, 
    AudioFilter = {
        HasInput = true, 
        HasOutput = true
    }, 
    AudioFlanger = {
        HasInput = true, 
        HasOutput = true
    }, 
    AudioLimiter = {
        HasInput = true, 
        HasOutput = true
    }, 
    AudioPitchShifter = {
        HasInput = true, 
        HasOutput = true
    }, 
    AudioReverb = {
        HasInput = true, 
        HasOutput = true
    }, 
    AudioAnalyzer = {
        HasInput = true, 
        HasOutput = false
    }, 
    Wire = {
        HasInput = false, 
        HasOutput = false
    }
};
v0.getAudioInstanceDefs = function() --[[ Line: 87 ]] --[[ Name: getAudioInstanceDefs ]]
    -- upvalues: v1 (copy)
    return v1;
end;
v0.hasInputPin = function(v2) --[[ Line: 91 ]] --[[ Name: hasInputPin ]]
    -- upvalues: v1 (copy)
    if not v2 then
        return false;
    else
        local l_ClassName_0 = v2.ClassName;
        return v1[l_ClassName_0] and v1[l_ClassName_0].HasInput;
    end;
end;
v0.hasOutputPin = function(v4) --[[ Line: 100 ]] --[[ Name: hasOutputPin ]]
    -- upvalues: v1 (copy)
    if not v4 then
        return false;
    else
        local l_ClassName_1 = v4.ClassName;
        return v1[l_ClassName_1] and v1[l_ClassName_1].HasOutput;
    end;
end;
v0.hasSidechainPin = function(v6) --[[ Line: 109 ]] --[[ Name: hasSidechainPin ]]
    -- upvalues: v1 (copy)
    if not v6 then
        return false;
    else
        local l_ClassName_2 = v6.ClassName;
        return v1[l_ClassName_2] and v1[l_ClassName_2].HasSidechain == true;
    end;
end;
v0.getWirableInstances = function(v8) --[[ Line: 118 ]] --[[ Name: getWirableInstances ]]
    -- upvalues: v0 (copy)
    if not v8 or #v8 ~= 2 or not v8[1] or not v8[2] then
        return nil, nil;
    elseif v0.hasOutputPin(v8[1]) and v0.hasInputPin(v8[2]) then
        return v8[1], v8[2];
    elseif v0.hasInputPin(v8[1]) and v0.hasOutputPin(v8[2]) then
        return v8[2], v8[1];
    else
        return nil, nil;
    end;
end;
v0.findWire = function(v9, v10) --[[ Line: 132 ]] --[[ Name: findWire ]]
    for _, v12 in v9:GetConnectedWires("Output") do
        if v12.TargetInstance == v10 then
            return v12;
        end;
    end;
    return nil;
end;
v0.rewire = function(v13, v14, v15) --[[ Line: 143 ]] --[[ Name: rewire ]]
    v13.Parent = if v14:IsA("AudioDeviceInput") then v15 else v14;
    v13.SourceInstance = v14;
    v13.TargetInstance = v15;
    if v13.SourceInstance == v14 and v13.TargetInstance == v15 then
        v13.Name = ("%* -> %*"):format(v14.Name, v15.Name);
        return v13;
    else
        v13:Destroy();
        return nil;
    end;
end;
v0.connectByWire = function(v16, v17) --[[ Line: 157 ]] --[[ Name: connectByWire ]]
    -- upvalues: v0 (copy)
    if not v0.hasOutputPin(v16) or not v0.hasInputPin(v17) then
        return nil;
    else
        local v18 = v0.findWire(v16, v17);
        if v18 then
            return v18;
        else
            local l_Wire_0 = Instance.new("Wire");
            return v0.rewire(l_Wire_0, v16, v17);
        end;
    end;
end;
return v0;