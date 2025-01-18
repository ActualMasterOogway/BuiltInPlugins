local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
local v3 = require(l_script_FirstAncestor_0.Src.Util.LocalizationUtil);
local v4 = require(l_script_FirstAncestor_0.Src.Util.SoundUtil);
local v5 = require(l_script_FirstAncestor_0.Src.Util.WiringUtil);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v11(v7, v8) --[[ Line: 15 ]] --[[ Name: addToGraph ]]
    -- upvalues: v4 (copy)
    if v8[v7] then
        return v8;
    else
        local l_v7_0 = v7;
        local v10 = v4.getDestination(l_v7_0);
        while v10 ~= nil do
            v8[l_v7_0] = v10;
            l_v7_0 = v10;
            v10 = v4.getDestination(l_v7_0);
        end;
        return v8;
    end;
end;
local function _(v12, v13) --[[ Line: 31 ]] --[[ Name: linkByWire ]]
    -- upvalues: v5 (copy)
    if #v12 == 0 or #v13 == 0 then
        return nil;
    else
        local v14 = v12[#v12];
        local v15 = v13[1];
        return v5.connectByWire(v14, v15);
    end;
end;
local function v29(v17) --[[ Line: 41 ]] --[[ Name: convertSoundEffectToAudioEffect ]]
    -- upvalues: v4 (copy)
    local l_Parent_0 = v17.Parent;
    local v19 = nil;
    if v17:IsA("EchoSoundEffect") then
        local v20 = Instance.new("AudioEcho", l_Parent_0);
        v20.DryLevel = v17.DryLevel;
        v20.WetLevel = v17.WetLevel;
        v20.Feedback = v17.Feedback;
        v20.DelayTime = v17.Delay;
        v20.Bypass = not v17.Enabled;
        v19 = v20;
    elseif v17:IsA("ChorusSoundEffect") then
        local v21 = Instance.new("AudioChorus", l_Parent_0);
        v21.Mix = v17.Mix;
        v21.Rate = v17.Rate;
        v21.Depth = v17.Depth;
        v21.Bypass = not v17.Enabled;
        v19 = v21;
    elseif v17:IsA("FlangeSoundEffect") then
        local v22 = Instance.new("AudioFlanger", l_Parent_0);
        v22.Mix = v17.Mix;
        v22.Rate = v17.Rate;
        v22.Depth = v17.Depth;
        v22.Bypass = not v17.Enabled;
        v19 = v22;
    elseif v17:IsA("ReverbSoundEffect") then
        local v23 = Instance.new("AudioReverb", l_Parent_0);
        v23.Diffusion = v17.Diffusion;
        v23.Density = v17.Density;
        v23.WetLevel = v17.WetLevel;
        v23.DryLevel = v17.DryLevel;
        v23.DecayTime = v17.DecayTime;
        v23.Bypass = not v17.Enabled;
        v19 = v23;
    elseif v17:IsA("EqualizerSoundEffect") then
        local v24 = Instance.new("AudioEqualizer", l_Parent_0);
        v24.LowGain = v17.LowGain;
        v24.MidGain = v17.MidGain;
        v24.HighGain = v17.HighGain;
        v24.Bypass = not v17.Enabled;
        v19 = v24;
    elseif v17:IsA("CompressorSoundEffect") then
        local v25 = Instance.new("AudioCompressor", l_Parent_0);
        v25.Threshold = v17.Threshold;
        v25.Ratio = v17.Ratio;
        v25.Attack = v17.Attack;
        v25.Release = v17.Release;
        v25.MakeupGain = v17.GainMakeup;
        v25.Bypass = not v17.Enabled;
        v19 = v25;
    elseif v17:IsA("DistortionSoundEffect") then
        local v26 = Instance.new("AudioDistortion", l_Parent_0);
        v26.Level = v17.Level;
        v26.Bypass = not v17.Enabled;
        v19 = v26;
    elseif v17:IsA("PitchShiftSoundEffect") then
        local v27 = Instance.new("AudioPitchShifter", l_Parent_0);
        v27.Pitch = v17.Octave;
        v27.Bypass = not v17.Enabled;
        v19 = v27;
    elseif v17:IsA("TremoloSoundEffect") then
        local v28 = Instance.new("AudioFader", l_Parent_0);
        v28:SetAttribute("Duty", v17.Duty);
        v28:SetAttribute("Depth", v17.Depth);
        v28:SetAttribute("Frequency", v17.Frequency);
        v28.Bypass = not v17.Enabled;
        v4.makeTremoloScript(v28);
        v19 = v28;
    end;
    return {
        v19
    };
end;
local function v46(v30) --[[ Line: 114 ]] --[[ Name: convertSoundGroupToFader ]]
    -- upvalues: v4 (copy), v29 (copy), v5 (copy)
    local v31 = {};
    local l_Parent_1 = v30.Parent;
    while l_Parent_1 ~= nil and l_Parent_1:IsA("SoundGroup") do
        l_Parent_1 = l_Parent_1.Parent;
    end;
    local v33 = Instance.new("AudioFader", l_Parent_1);
    v33.Volume = v30.Volume;
    if v30.Name ~= "SoundGroup" then
        v33.Name = v30.Name;
    end;
    for _, v35 in (v4.getEffects(v30)) do
        local v36 = v29(v35);
        if #v31 ~= 0 and #v36 ~= 0 then
            local v37 = v31[#v31];
            local v38 = v36[1];
            local _ = v5.connectByWire(v37, v38);
        end;
        for _, v41 in v36 do
            v41.Parent = v33;
            table.insert(v31, v41);
        end;
    end;
    local v42 = {
        v33
    };
    if #v31 ~= 0 and #v42 ~= 0 then
        local v43 = v31[#v31];
        local v44 = v42[1];
        local _ = v5.connectByWire(v43, v44);
    end;
    table.insert(v31, v33);
    return v31;
end;
local function v70(v47) --[[ Line: 145 ]] --[[ Name: convertSoundToAudioPlayer ]]
    -- upvalues: v4 (copy), v29 (copy), v5 (copy)
    local v48 = {};
    local l_Parent_2 = v47.Parent;
    local v50 = Instance.new("AudioFader", l_Parent_2);
    local v51 = Instance.new("AudioPlayer", v50);
    table.insert(v48, v51);
    v51.AssetId = v47.SoundId;
    v51.PlaybackSpeed = v47.PlaybackSpeed;
    v51.Looping = v47.Looped;
    v51.TimePosition = v47.TimePosition;
    if v47.Name ~= "Sound" then
        v51.Name = v47.Name;
        v50.Name = v47.Name .. " Fader";
    end;
    if v47.Playing then
        v4.makeAutoplayScript(v51);
    end;
    if v47.PlaybackRegionsEnabled then
        v51.PlaybackRegion = v47.PlaybackRegion;
        v51.LoopRegion = v47.LoopRegion;
    end;
    for _, v53 in (v4.getEffects(v47)) do
        local v54 = v29(v53);
        if #v48 ~= 0 and #v54 ~= 0 then
            local v55 = v48[#v48];
            local v56 = v54[1];
            local _ = v5.connectByWire(v55, v56);
        end;
        for _, v59 in v54 do
            v59.Parent = v50;
            table.insert(v48, v59);
        end;
    end;
    v50.Volume = v47.Volume;
    local v60 = {
        v50
    };
    if #v48 ~= 0 and #v60 ~= 0 then
        local v61 = v48[#v48];
        local v62 = v60[1];
        local _ = v5.connectByWire(v61, v62);
    end;
    table.insert(v48, v50);
    if v4.is3d(v47) then
        v60 = Instance.new("AudioEmitter", l_Parent_2);
        v51.Parent = v60;
        v50.Parent = v60;
        if v47.Name ~= "Sound" then
            v60.Name = v47.Name .. " Emitter";
        end;
        v60:SetDistanceAttenuation((v4.serializeRolloffMode(v47.RollOffMode, v47.RollOffMinDistance, v47.RollOffMaxDistance)));
        local v64 = {
            v60
        };
        if #v48 ~= 0 and #v64 ~= 0 then
            local v65 = v48[#v48];
            local v66 = v64[1];
            local _ = v5.connectByWire(v65, v66);
        end;
        table.insert(v48, v60);
        v64 = v4.getDestination(v47);
        local v68 = if v64 then v64.Name else "";
        local l_workspace_FirstChild_0 = workspace:FindFirstChild(v68 .. " Listener");
        if not l_workspace_FirstChild_0 then
            l_workspace_FirstChild_0 = Instance.new("AudioListener", workspace);
            assert(l_workspace_FirstChild_0, "audioListener was nil");
            l_workspace_FirstChild_0.Name = v68 .. " Listener";
            l_workspace_FirstChild_0.AudioInteractionGroup = v68 .. " Interactions";
            v4.makeListenerScript(l_workspace_FirstChild_0);
        end;
        v60.AudioInteractionGroup = v68 .. " Interactions";
        table.insert(v48, l_workspace_FirstChild_0);
    end;
    return v48;
end;
local function v73(v71) --[[ Line: 224 ]] --[[ Name: convertSoundServiceToDeviceOutput ]]
    local l_AudioDeviceOutput_0 = v71:FindFirstChildWhichIsA("AudioDeviceOutput");
    if not l_AudioDeviceOutput_0 then
        l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
        assert(l_AudioDeviceOutput_0, "output was nil");
        l_AudioDeviceOutput_0.Parent = v71;
    end;
    assert(l_AudioDeviceOutput_0, "output was nil");
    return {
        l_AudioDeviceOutput_0
    };
end;
local function v75(v74) --[[ Line: 235 ]] --[[ Name: convertInstance ]]
    -- upvalues: v70 (copy), v46 (copy), v73 (copy)
    if v74:IsA("Sound") then
        return (v70(v74));
    elseif v74:IsA("SoundGroup") then
        return (v46(v74));
    elseif v74:IsA("SoundService") then
        return (v73(v74));
    else
        return {};
    end;
end;
local function v97(v76) --[[ Line: 247 ]] --[[ Name: convertSoundsToAudioPlayers ]]
    -- upvalues: v11 (copy), v75 (copy), v5 (copy), v29 (copy)
    local v77 = {};
    for _, v79 in v76 do
        v77 = v11(v79, v77);
        for _, _ in v79:GetChildren() do
            v77 = v11(v79, v77);
        end;
    end;
    local v82 = {};
    for v83, v84 in v77 do
        if not v82[v83] then
            v82[v83] = v75(v83);
        end;
        if not v82[v84] then
            v82[v84] = v75(v84);
        end;
        local v85 = v82[v83];
        local v86 = v82[v84];
        if #v85 ~= 0 and #v86 ~= 0 then
            local v87 = v85[#v85];
            local v88 = v86[1];
            local _ = v5.connectByWire(v87, v88);
        end;
    end;
    for _, v91 in v76 do
        if v91:IsA("SoundEffect") and (not v91.Parent or not v77[v91.Parent]) then
            v82[v91] = v29(v91);
        end;
    end;
    local v92 = {};
    for _, v94 in v82 do
        for _, v96 in v94 do
            table.insert(v92, v96);
        end;
    end;
    return v92;
end;
local function v102() --[[ Line: 285 ]] --[[ Name: migrateInstances ]]
    -- upvalues: l_ChangeHistoryService_0 (copy), v97 (copy), l_Selection_0 (copy)
    local v98 = l_ChangeHistoryService_0:TryBeginRecording("Migrate Sounds");
    local v99 = v97(l_Selection_0:Get());
    local v100 = #v99 > 0;
    if v100 then
        l_Selection_0:Set(v99);
    end;
    if v98 then
        local v101 = if v100 then Enum.FinishRecordingOperation.Commit else Enum.FinishRecordingOperation.Cancel;
        l_ChangeHistoryService_0:FinishRecording(v98, v101);
    end;
end;
local v103 = nil;
local v104 = nil;
return {
    register = function(v105) --[[ Line: 306 ]] --[[ Name: register ]]
        -- upvalues: l_Selection_0 (copy), v4 (copy), v3 (copy), v103 (ref), v102 (copy), v104 (ref)
        local l_v105_PluginComponent_0 = v105:GetPluginComponent("Actions");
        local function v111() --[[ Line: 309 ]] --[[ Name: updateAction ]]
            -- upvalues: l_Selection_0 (ref), v4 (ref), v3 (ref), v103 (ref), l_v105_PluginComponent_0 (copy), v102 (ref)
            local v107 = false;
            for _, v109 in l_Selection_0:Get() do
                if v4.isSoundApi(v109) then
                    v107 = true;
                    break;
                end;
            end;
            local v110 = {
                Uri = {
                    DataModel = "Standalone", 
                    PluginId = "Audio", 
                    Category = "Actions", 
                    ItemId = "Migrate"
                }, 
                Enabled = v107, 
                Visible = true, 
                Text = v3.action("MigrateSounds"), 
                Tooltip = v3.tooltip("MigrateSounds"), 
                Icon = "Sound", 
                Shortcuts = {}
            };
            if v103 then
                v103:Disconnect();
                v103 = nil;
            end;
            v103 = l_v105_PluginComponent_0:CreateAsync(v110, true)[1]:Connect(function() --[[ Line: 337 ]]
                -- upvalues: v102 (ref)
                v102();
            end);
        end;
        v111();
        v104 = l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 343 ]]
            -- upvalues: v111 (copy)
            v111();
        end);
    end, 
    deregister = function() --[[ Line: 348 ]] --[[ Name: deregister ]]
        -- upvalues: v104 (ref), v103 (ref)
        if v104 then
            v104:Disconnect();
            v104 = nil;
        end;
        if v103 then
            v103:Disconnect();
            v103 = nil;
        end;
    end
};