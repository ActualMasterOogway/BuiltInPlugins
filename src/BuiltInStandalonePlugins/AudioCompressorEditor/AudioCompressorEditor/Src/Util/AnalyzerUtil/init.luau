local l_RunService_0 = game:GetService("RunService");
local v1 = {
    OnStartAnalyzing = "OnStartAnalyzing", 
    OnPeakChanged = "OnPeakChanged", 
    IsAnalyzing = "IsAnalyzing", 
    InstanceContainer = "AudioCompressorEditor_Container", 
    Folder = "Folder", 
    Analyzer = "AudioAnalyzer", 
    InAnalyzer = "AudioAnalyzerIn", 
    OutAnalyzer = "AudioAnalyzerOut", 
    SidechainAnalyzer = "AudioAnalyzerSidechain", 
    Wire = "Wire"
};
local v2 = {};
local v3 = nil;
v2.setPlugin = function(v4) --[[ Line: 27 ]] --[[ Name: setPlugin ]]
    -- upvalues: v3 (ref)
    assert(v4, "Plugin doesn't exist");
    v3 = v4;
end;
local v5 = nil;
v2.disconnectStartAnalyzing = function() --[[ Line: 34 ]] --[[ Name: disconnectStartAnalyzing ]]
    -- upvalues: v5 (ref)
    if v5 then
        v5:Disconnect();
        v5 = nil;
    end;
end;
local v6 = nil;
v2.disconnectRunService = function() --[[ Line: 43 ]] --[[ Name: disconnectRunService ]]
    -- upvalues: v6 (ref)
    if v6 then
        v6:Disconnect();
        v6 = nil;
    end;
end;
local v7 = {};
local v8 = {};
local v9 = nil;
v2.clearInstances = function(v10) --[[ Line: 54 ]] --[[ Name: clearInstances ]]
    -- upvalues: v9 (ref), v1 (copy), v7 (ref), v8 (ref)
    if v9 then
        v9:Disconnect();
        v9 = nil;
    end;
    local l_v10_FirstChild_0 = v10:FindFirstChild(v1.InstanceContainer);
    if l_v10_FirstChild_0 then
        l_v10_FirstChild_0:Destroy();
    end;
    v7 = {};
    v8 = {};
end;
v2.createInstances = function(v12, v13) --[[ Line: 71 ]] --[[ Name: createInstances ]]
    -- upvalues: v3 (ref), v2 (copy), v1 (copy), v7 (ref), v8 (ref), v9 (ref), v5 (ref), v6 (ref), l_RunService_0 (copy)
    if not v3 then
        return;
    else
        v2.clearInstances(v13);
        local v14 = Instance.new(v1.Folder);
        v14.Name = v1.InstanceContainer;
        v14.Parent = v13;
        local v15 = Instance.new(v1.Analyzer);
        local v16 = Instance.new(v1.Analyzer);
        local v17 = Instance.new(v1.Analyzer);
        v15.Name = "InAnalyzer";
        v16.Name = "OutAnalyzer";
        v17.Name = "SidechainAnalyzer";
        v15.SpectrumEnabled = false;
        v16.SpectrumEnabled = false;
        v17.SpectrumEnabled = false;
        v15.Parent = v14;
        v16.Parent = v14;
        v17.Parent = v14;
        local v18 = Instance.new(v1.Wire);
        v18.Parent = v14;
        v18.SourceInstance = v12;
        v18.TargetInstance = v16;
        for _, v20 in v12:GetConnectedWires("Input") do
            if v20.SourceInstance then
                local v21 = Instance.new(v1.Wire);
                v21.Parent = v14;
                v21.SourceInstance = v20.SourceInstance;
                v21.TargetInstance = v15;
                v7[v20.SourceInstance] = v21;
            end;
        end;
        for _, v23 in v12:GetConnectedWires("Sidechain") do
            if v23.SourceInstance then
                local v24 = Instance.new(v1.Wire);
                v24.Parent = v14;
                v24.SourceInstance = v23.SourceInstance;
                v24.TargetInstance = v17;
                v8[v23.SourceInstance] = v24;
            end;
        end;
        v9 = v12.WiringChanged:Connect(function(v25, v26, _, v28) --[[ Line: 131 ]]
            -- upvalues: v7 (ref), v8 (ref), v15 (copy), v17 (copy), v1 (ref), v14 (copy)
            if v26 ~= "Input" and v26 ~= "Sidechain" then
                return;
            else
                local v29 = if v26 == "Input" then v7 else v8;
                local v30 = if v26 == "Input" then v15 else v17;
                if v25 and not v29[v28] then
                    local v31 = Instance.new(v1.Wire);
                    v31.Parent = v14;
                    v31.SourceInstance = v28;
                    v31.TargetInstance = v30;
                    v29[v28] = v31;
                    return;
                else
                    if not v25 and v29[v28] then
                        v29[v28]:Destroy();
                        v29[v28] = nil;
                    end;
                    return;
                end;
            end;
        end);
        v2.disconnectStartAnalyzing();
        v5 = v3:OnInvoke(v1.OnStartAnalyzing, function() --[[ Line: 153 ]]
            -- upvalues: v3 (ref), v1 (ref), v2 (ref), v6 (ref), l_RunService_0 (ref), v15 (copy), v16 (copy), v17 (copy)
            v3:SetItem(v1.IsAnalyzing, true);
            v2.disconnectRunService();
            v6 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 157 ]]
                -- upvalues: v3 (ref), v1 (ref), v2 (ref), v15 (ref), v16 (ref), v17 (ref)
                if not v3:GetItem(v1.IsAnalyzing) then
                    v2.disconnectRunService();
                    return;
                else
                    v3:Invoke(v1.OnPeakChanged, v15.PeakLevel, v16.PeakLevel, v17.PeakLevel);
                    return;
                end;
            end);
        end);
        return;
    end;
end;
v2.destroyInstances = function(v32) --[[ Line: 169 ]] --[[ Name: destroyInstances ]]
    -- upvalues: v3 (ref), v1 (copy), v2 (copy)
    if not v3 then
        return;
    else
        v3:SetItem(v1.IsAnalyzing, false);
        v2.clearInstances(v32);
        return;
    end;
end;
local v33 = nil;
v2.disconnectChanged = function() --[[ Line: 180 ]] --[[ Name: disconnectChanged ]]
    -- upvalues: v33 (ref)
    if v33 then
        v33:Disconnect();
        v33 = nil;
    end;
end;
v2.startAnalyzing = function(v34) --[[ Line: 188 ]] --[[ Name: startAnalyzing ]]
    -- upvalues: v3 (ref), v1 (copy), v2 (copy), v33 (ref)
    if not v3 then
        return;
    else
        v3:Invoke(v1.OnStartAnalyzing);
        v2.disconnectChanged();
        v33 = v3:OnInvoke(v1.OnPeakChanged, v34);
        return;
    end;
end;
v2.stopAnalyzing = function() --[[ Line: 200 ]] --[[ Name: stopAnalyzing ]]
    -- upvalues: v3 (ref), v2 (copy), v1 (copy)
    if not v3 then
        return;
    else
        v2.disconnectChanged();
        v3:SetItem(v1.IsAnalyzing, false);
        return;
    end;
end;
return v2;