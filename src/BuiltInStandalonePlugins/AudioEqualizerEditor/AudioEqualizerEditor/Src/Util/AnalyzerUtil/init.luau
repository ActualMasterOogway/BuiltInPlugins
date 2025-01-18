local _ = script:FindFirstAncestor("AudioEqualizerEditor");
local v1 = {
    OnStartAnalyzing = "OnStartAnalyzing", 
    OnSpectrumChanged = "OnSpectrumChanged", 
    IsAnalyzing = "IsAnalyzing", 
    InstanceContainer = "AudioEqualizerEditor_Container", 
    Frame = "Frame", 
    Analyzer = "AudioAnalyzer", 
    Wire = "Wire"
};
local v2 = {};
local v3 = nil;
v2.setPlugin = function(v4) --[[ Line: 22 ]] --[[ Name: setPlugin ]]
    -- upvalues: v3 (ref)
    assert(v4, "Plugin doesn't exist");
    v3 = v4;
end;
local v5 = nil;
v2.disconnectStartAnalyzing = function() --[[ Line: 29 ]] --[[ Name: disconnectStartAnalyzing ]]
    -- upvalues: v5 (ref)
    if v5 then
        v5:Disconnect();
        v5 = nil;
    end;
end;
local v6 = nil;
v2.disconnectRunService = function() --[[ Line: 38 ]] --[[ Name: disconnectRunService ]]
    -- upvalues: v6 (ref)
    if v6 then
        v6:Disconnect();
        v6 = nil;
    end;
end;
v2.createInstances = function(v7, v8) --[[ Line: 46 ]] --[[ Name: createInstances ]]
    -- upvalues: v3 (ref), v1 (copy), v2 (copy), v5 (ref), v6 (ref)
    if not v3 then
        return;
    else
        local l_v8_FirstChild_0 = v8:FindFirstChild(v1.InstanceContainer);
        if not l_v8_FirstChild_0 then
            local v10 = Instance.new(v1.Frame);
            v10.Name = v1.InstanceContainer;
            v10.Parent = v8;
            l_v8_FirstChild_0 = v10;
        end;
        local l_l_v8_FirstChild_0_0 = l_v8_FirstChild_0;
        local l_l_l_v8_FirstChild_0_0_FirstChild_0 = l_l_v8_FirstChild_0_0:FindFirstChild(v1.Analyzer);
        if l_l_l_v8_FirstChild_0_0_FirstChild_0 and not l_l_l_v8_FirstChild_0_0_FirstChild_0:IsA(v1.Analyzer) then
            l_l_l_v8_FirstChild_0_0_FirstChild_0:Destroy();
            l_l_l_v8_FirstChild_0_0_FirstChild_0 = nil;
        end;
        if not l_l_l_v8_FirstChild_0_0_FirstChild_0 then
            local v13 = Instance.new(v1.Analyzer);
            v13.Parent = l_l_v8_FirstChild_0_0;
            l_l_l_v8_FirstChild_0_0_FirstChild_0 = v13;
        end;
        local l_l_l_l_v8_FirstChild_0_0_FirstChild_0_0 = l_l_l_v8_FirstChild_0_0_FirstChild_0;
        local l_l_l_v8_FirstChild_0_0_FirstChild_1 = l_l_v8_FirstChild_0_0:FindFirstChild(v1.Wire);
        if l_l_l_v8_FirstChild_0_0_FirstChild_1 and not l_l_l_v8_FirstChild_0_0_FirstChild_1:IsA(v1.Wire) then
            l_l_l_v8_FirstChild_0_0_FirstChild_1:Destroy();
            l_l_l_v8_FirstChild_0_0_FirstChild_1 = nil;
        end;
        if not l_l_l_v8_FirstChild_0_0_FirstChild_1 then
            local v16 = Instance.new(v1.Wire);
            v16.Parent = l_l_v8_FirstChild_0_0;
            v16.TargetInstance = l_l_l_l_v8_FirstChild_0_0_FirstChild_0_0;
            l_l_l_v8_FirstChild_0_0_FirstChild_1 = v16;
        end;
        l_l_l_v8_FirstChild_0_0_FirstChild_1.SourceInstance = v7;
        v2.disconnectStartAnalyzing();
        v5 = v3:OnInvoke(v1.OnStartAnalyzing, function() --[[ Line: 91 ]]
            -- upvalues: v3 (ref), v1 (ref), v2 (ref), v6 (ref), l_l_l_l_v8_FirstChild_0_0_FirstChild_0_0 (copy)
            v3:SetItem(v1.IsAnalyzing, true);
            v2.disconnectRunService();
            v6 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 96 ]]
                -- upvalues: v3 (ref), v1 (ref), v2 (ref), l_l_l_l_v8_FirstChild_0_0_FirstChild_0_0 (ref)
                if not v3:GetItem(v1.IsAnalyzing) then
                    v2.disconnectRunService();
                    return;
                else
                    local l_l_l_l_l_v8_FirstChild_0_0_FirstChild_0_0_Spectrum_0 = l_l_l_l_v8_FirstChild_0_0_FirstChild_0_0:GetSpectrum();
                    v3:Invoke(v1.OnSpectrumChanged, l_l_l_l_l_v8_FirstChild_0_0_FirstChild_0_0_Spectrum_0);
                    return;
                end;
            end);
        end);
        return;
    end;
end;
v2.destroyInstances = function(v18) --[[ Line: 109 ]] --[[ Name: destroyInstances ]]
    -- upvalues: v3 (ref), v2 (copy), v1 (copy)
    if not v3 then
        return;
    else
        v2.disconnectSpectrumChanged();
        v3:SetItem(v1.IsAnalyzing, false);
        local l_v18_FirstChild_0 = v18:FindFirstChild(v1.InstanceContainer);
        if l_v18_FirstChild_0 then
            l_v18_FirstChild_0:Destroy();
        end;
        return;
    end;
end;
local v20 = nil;
v2.disconnectSpectrumChanged = function() --[[ Line: 126 ]] --[[ Name: disconnectSpectrumChanged ]]
    -- upvalues: v20 (ref)
    if v20 then
        v20:Disconnect();
        v20 = nil;
    end;
end;
v2.startAnalyzing = function(v21) --[[ Line: 134 ]] --[[ Name: startAnalyzing ]]
    -- upvalues: v3 (ref), v1 (copy), v2 (copy), v20 (ref)
    if not v3 then
        return;
    else
        v3:Invoke(v1.OnStartAnalyzing);
        v2.disconnectSpectrumChanged();
        v20 = v3:OnInvoke(v1.OnSpectrumChanged, v21);
        return;
    end;
end;
v2.stopAnalyzing = function() --[[ Line: 146 ]] --[[ Name: stopAnalyzing ]]
    -- upvalues: v3 (ref), v2 (copy), v1 (copy)
    if not v3 then
        return;
    else
        v2.disconnectSpectrumChanged();
        v3:SetItem(v1.IsAnalyzing, false);
        return;
    end;
end;
return v2;