local v0 = {};
v0.__index = v0;
v0._connectNodes = function(_, v2, v3, v4, v5, v6) --[[ Line: 6 ]] --[[ Name: _connectNodes ]]
    if not v6 then
        v6 = Instance.new("Wire");
    end;
    v6.Name = v2;
    v6.Parent = v5;
    v6.SourceInstance = v3;
    v6.TargetInstance = v4;
    return v6;
end;
v0._disconnectNodes = function(_, v8) --[[ Line: 17 ]] --[[ Name: _disconnectNodes ]]
    if not v8 then
        return;
    else
        v8:Destroy();
        return;
    end;
end;
v0.connectVideoInput = function(v9, v10) --[[ Line: 25 ]] --[[ Name: connectVideoInput ]]
    assert(v10, "Invalid videoInput");
    if not v9.trackerNode then
        return;
    else
        v9.videoWire = v9:_connectNodes("VideoToTracker", v10, v9.trackerNode, v10, v9.videoWire);
        return;
    end;
end;
v0.disconnectVideoInput = function(v11) --[[ Line: 35 ]] --[[ Name: disconnectVideoInput ]]
    v11:_disconnectNodes(v11.videoWire);
    v11.videoWire = nil;
end;
v0._createCameraForVideoInput = function(v12) --[[ Line: 40 ]] --[[ Name: _createCameraForVideoInput ]]
    if not v12.trackerNode then
        return;
    else
        if not v12.videoDeviceInput then
            v12.videoDeviceInput = Instance.new("VideoDeviceInput");
            v12.videoDeviceInput.Parent = v12.trackerNode;
            v12.videoDeviceInput.CaptureQuality = Enum.VideoDeviceCaptureQuality.Low;
        end;
        return;
    end;
end;
v0.setCameraEnabled = function(v13, v14) --[[ Line: 52 ]] --[[ Name: setCameraEnabled ]]
    if v14 then
        v13:_createCameraForVideoInput();
        v13.videoDeviceInput.Active = true;
        v13:connectVideoInput(v13.videoDeviceInput);
        return;
    else
        v13:disconnectVideoInput();
        return;
    end;
end;
v0.createLocalTracker = function(v15) --[[ Line: 62 ]] --[[ Name: createLocalTracker ]]
    if v15.trackerNode then
        return v15.trackerNode;
    else
        v15.trackerNode = Instance.new("RTAnimationTracker");
        v15.trackerNode.Parent = v15.root;
        return v15.trackerNode;
    end;
end;
v0.connectToLocalTrackerOutput = function(v16, v17) --[[ Line: 71 ]] --[[ Name: connectToLocalTrackerOutput ]]
    assert(v17, "Invalid outputNode");
    assert(v16.trackerNode, "Must have local tracker to connect to!");
    return v16:_connectNodes("TrackerToOutput", v16.trackerNode, v17, v17, nil);
end;
v0.setTracking = function(v18, v19) --[[ Line: 78 ]] --[[ Name: setTracking ]]
    if not v18.trackerNode then
        return;
    else
        v18.trackerNode.Active = v19;
        return;
    end;
end;
v0.getTracking = function(v20) --[[ Line: 86 ]] --[[ Name: getTracking ]]
    if v20.trackerNode then
        return v20.trackerNode.Active;
    else
        return false;
    end;
end;
v0.createStreamAnimationAndTrack = function(v21, v22, v23, v24, v25) --[[ Line: 90 ]] --[[ Name: createStreamAnimationAndTrack ]]
    assert(v22, "Invalid animator");
    v21.streamAnimation = Instance.new("TrackerStreamAnimation");
    v21.streamAnimation.Parent = v21.root;
    v21.animator = v22;
    if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
        v21.animationTrack = v21.animator:LoadStreamAnimationV2(v21.streamAnimation, v23, v24, v25);
    else
        v21.animationTrack = v21.animator:LoadStreamAnimation(v21.streamAnimation);
    end;
    if not v21.animationTrack then
        return nil, nil;
    else
        return v21.streamAnimation, v21.animationTrack;
    end;
end;
v0.teardown = function(v26) --[[ Line: 116 ]] --[[ Name: teardown ]]
    v26:disconnectVideoInput();
    assert(v26.videoWire == nil, "videoWire expected to be nil");
    if v26.animationTrack then
        v26.animationTrack:Stop(0);
        v26.animationTrack = nil;
    end;
    if v26.streamAnimation then
        v26.streamAnimation:Destroy();
        v26.streamAnimation = nil;
    end;
    if v26.videoDeviceInput then
        v26.videoDeviceInput:Destroy();
    end;
    if v26.trackerNode then
        v26.trackerNode.Active = false;
        v26.trackerNode:Destroy();
        v26.trackerNode = nil;
    end;
end;
v0.new = function(v27, v28) --[[ Line: 141 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v29 = setmetatable({}, v0);
    v29.id = v27;
    v29.root = v28;
    assert(v29.root, "No root instance!");
    v29.trackerNode = nil;
    v29.streamAnimation = nil;
    v29.animator = nil;
    v29.animationTrack = nil;
    v29.videoWire = nil;
    v29.videoDeviceInput = nil;
    return v29;
end;
return v0;