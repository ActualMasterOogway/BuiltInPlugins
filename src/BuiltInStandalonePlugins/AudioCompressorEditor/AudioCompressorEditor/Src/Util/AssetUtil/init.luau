local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.AnalyzerUtil);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_GuiService_0 = game:GetService("GuiService");
local l_SoundService_0 = game:GetService("SoundService");
local v8 = {
    getInstanceData = function(v5) --[[ Line: 14 ]] --[[ Name: getInstanceData ]]
        if v5:IsA("AudioCompressor") then
            return {
                Type = "AudioCompressor", 
                Threshold = v5.Threshold, 
                Ratio = v5.Ratio, 
                Attack = v5.Attack, 
                Release = v5.Release, 
                MakeupGain = v5.MakeupGain, 
                Bypass = v5.Bypass
            };
        elseif v5:IsA("AudioLimiter") then
            return {
                Type = "AudioLimiter", 
                Threshold = v5.MaxLevel, 
                Ratio = 1000000, 
                Attack = 0, 
                Release = v5.Release, 
                MakeupGain = 0, 
                Bypass = v5.Bypass
            };
        else
            assert(false, "Unknown instance type");
            return {
                Type = "AudioLimiter", 
                Threshold = 0, 
                Ratio = 1, 
                Attack = 0, 
                Release = 0, 
                MakeupGain = 0, 
                Bypass = true
            };
        end;
    end, 
    setInstanceData = function(v6, v7) --[[ Line: 51 ]] --[[ Name: setInstanceData ]]
        if v6:IsA("AudioCompressor") then
            v6.Threshold = v7.Threshold;
            v6.Ratio = v7.Ratio;
            v6.Attack = v7.Attack;
            v6.Release = v7.Release;
            v6.MakeupGain = v7.MakeupGain;
            v6.Bypass = v7.Bypass;
            return;
        elseif v6:IsA("AudioLimiter") then
            v6.MaxLevel = v7.Threshold;
            v6.Release = v7.Release;
            v6.Bypass = v7.Bypass;
            return;
        else
            assert(false, "Unknown instance type");
            return;
        end;
    end
};
local v9 = nil;
local v10 = {};
local v11 = nil;
local v12 = nil;
v8.onOpen = function(v13) --[[ Line: 75 ]] --[[ Name: onOpen ]]
    -- upvalues: v9 (ref), v10 (ref), v1 (copy), l_GuiService_0 (copy), v12 (ref), v8 (copy), v11 (ref)
    assert(v9, "plugin was nil");
    for v14 = #v13, 1, -1 do
        local v15 = v13[v14];
        if not v15 or not v15:IsA("AudioCompressor") and not v15:IsA("AudioLimiter") then
            table.remove(v13, v14);
        end;
    end;
    if #v13 == 0 then
        return;
    else
        v10 = v13;
        local v16 = v13[1];
        local v17 = ("%* \"%*\""):format(v16.ClassName, v16.Name);
        if #v13 > 1 then
            v17 = ("%* (%* items)"):format(v16.ClassName, #v13);
        end;
        v1.createInstances(v16, l_GuiService_0);
        v12 = v8.getInstanceData(v16);
        v9:Invoke("OnOpen", v12, v17);
        if v11 then
            v11:Disconnect();
        end;
        v11 = v16.Changed:Connect(function(v18) --[[ Line: 106 ]]
            -- upvalues: v12 (ref), v16 (copy), v8 (ref), v9 (ref)
            if not v12 then
                return;
            else
                assert(v12, "currentInstanceData was nil");
                local l_v16_0 = v16;
                local l_v12_0 = v12;
                local v21 = l_v12_0[v18];
                local v22 = l_v16_0[v18];
                if v18 == "MaxLevel" then
                    v21 = l_v12_0.Threshold;
                end;
                if v21 ~= nil and v21 ~= v22 then
                    if type(v22) == "number" and math.abs(v21 - v22) < 1.0E-4 then
                        return;
                    else
                        v12 = v8.getInstanceData(v16);
                        v9:Invoke("OnInstanceChanged", v12);
                    end;
                end;
                return;
            end;
        end);
        return;
    end;
end;
v8.onEdit = function(v23) --[[ Line: 136 ]] --[[ Name: onEdit ]]
    -- upvalues: v12 (ref), v10 (ref), v8 (copy)
    v12 = v23;
    for _, v25 in v10 do
        v8.setInstanceData(v25, v23);
    end;
end;
v8.onStopEditing = function() --[[ Line: 143 ]] --[[ Name: onStopEditing ]]
    -- upvalues: v10 (ref), v11 (ref), v12 (ref), v1 (copy), l_GuiService_0 (copy)
    v10 = {};
    if v11 then
        v11:Disconnect();
        v11 = nil;
    end;
    v12 = nil;
    v1.destroyInstances(l_GuiService_0);
end;
v8.setup = function(v26) --[[ Line: 155 ]] --[[ Name: setup ]]
    -- upvalues: v9 (ref), v1 (copy), l_SoundService_0 (copy), v8 (copy)
    v9 = v26;
    assert(v9, "plugin was nil");
    v1.setPlugin(v9);
    local _ = l_SoundService_0.OpenAudioCompressorEditorSignal:Connect(v8.onOpen);
    v9:OnInvoke("OnEdit", v8.onEdit);
    v9:OnInvoke("OnStopEditing", v8.onStopEditing);
end;
return v8;