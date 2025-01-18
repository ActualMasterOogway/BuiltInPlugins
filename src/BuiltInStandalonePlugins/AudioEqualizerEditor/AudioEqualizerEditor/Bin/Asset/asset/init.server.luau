if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("AudioEqualizerEditor", l_script_FirstAncestor_0.Src);
    if v1.isCli() then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
        local v3 = require(l_script_FirstAncestor_0.Src.Util.AnalyzerUtil);
        v3.setPlugin(plugin);
        local v4 = require(l_script_FirstAncestor_0.Src.Types);
        local v5 = {};
        local v6 = nil;
        local v7 = 0;
        local v8 = nil;
        local l_GuiService_0 = game:GetService("GuiService");
        local l_SoundService_0 = game:GetService("SoundService");
        local function v13(v11) --[[ Line: 44 ]] --[[ Name: getInstanceData ]]
            -- upvalues: v4 (copy)
            local v12 = {
                InstanceType = "None", 
                Bypass = false
            };
            if v11:IsA(v4.EQUALIZER) then
                return {
                    InstanceType = v4.EQUALIZER, 
                    LowGain = v11.LowGain, 
                    MidGain = v11.MidGain, 
                    HighGain = v11.HighGain, 
                    MidRange = v11.MidRange, 
                    Bypass = v11.Bypass
                };
            elseif v11:IsA(v4.FILTER) then
                return {
                    InstanceType = v4.FILTER, 
                    FilterType = v11.FilterType, 
                    Frequency = v11.Frequency, 
                    Gain = v11.Gain, 
                    Q = v11.Q, 
                    Bypass = v11.Bypass
                };
            else
                assert(false, "Only Equalizers and Filters are supported.");
                return v12;
            end;
        end;
        local function v16(v14, v15) --[[ Line: 77 ]] --[[ Name: setInstanceData ]]
            -- upvalues: v4 (copy)
            if not v14:IsA(v15.InstanceType) then
                return;
            elseif v15.InstanceType == v4.EQUALIZER then
                v14.LowGain = v15.LowGain;
                v14.MidGain = v15.MidGain;
                v14.HighGain = v15.HighGain;
                v14.MidRange = v15.MidRange;
                v14.Bypass = v15.Bypass;
                return;
            else
                if v15.InstanceType == v4.FILTER then
                    v14.FilterType = v15.FilterType;
                    v14.Frequency = v15.Frequency;
                    v14.Gain = v15.Gain;
                    v14.Q = v15.Q;
                    v14.Bypass = v15.Bypass;
                end;
                return;
            end;
        end;
        local function v26(v17) --[[ Line: 101 ]] --[[ Name: onOpen ]]
            -- upvalues: v4 (copy), v5 (ref), v3 (copy), l_GuiService_0 (copy), v8 (ref), v13 (copy), v7 (ref), v6 (ref)
            for v18 = #v17, 1, -1 do
                local v19 = v17[v18];
                if not v19 or not v19:IsA(v4.EQUALIZER) and not v19:IsA(v4.FILTER) then
                    table.remove(v17, v18);
                end;
            end;
            if #v17 == 0 then
                return;
            else
                v5 = v17;
                local v20 = v17[1];
                local v21 = ("%* \"%*\""):format(v20.ClassName, v20.Name);
                if #v17 > 1 then
                    v21 = ("%* (%* items)"):format(v20.ClassName, #v17);
                end;
                v3.createInstances(v20, l_GuiService_0);
                v8 = v13(v20);
                plugin:Invoke("OnOpen", v8, v7, v21);
                if v6 then
                    v6:Disconnect();
                end;
                v6 = v20.Changed:Connect(function(v22) --[[ Line: 131 ]]
                    -- upvalues: v8 (ref), v20 (copy), v13 (ref)
                    if not v8 then
                        return;
                    else
                        assert(v8, "currentInstanceData was nil");
                        local l_v20_0 = v20;
                        local v24 = v8[v22];
                        local v25 = l_v20_0[v22];
                        if v24 ~= nil and v24 ~= v25 then
                            if type(v25) == "number" and math.abs(v24 - v25) < 1.0E-4 then
                                return;
                            else
                                v8 = v13(v20);
                                plugin:Invoke("OnInstanceChanged", v8);
                            end;
                        end;
                        return;
                    end;
                end);
                v7 = v7 + 1;
                return;
            end;
        end;
        local _ = l_SoundService_0.OpenAudioEqualizerEditorSignal:Connect(v26);
        plugin:OnInvoke("OnEdit", function(v28) --[[ Line: 158 ]]
            -- upvalues: v8 (ref), v5 (ref), v16 (copy)
            v8 = v28;
            for _, v30 in v5 do
                v16(v30, v28);
            end;
        end);
        plugin:OnInvoke("OnStopEditing", function() --[[ Line: 165 ]]
            -- upvalues: v5 (ref), v6 (ref), v8 (ref), v3 (copy), l_GuiService_0 (copy)
            v5 = {};
            if v6 then
                v6:Disconnect();
                v6 = nil;
            end;
            v8 = nil;
            v3.destroyInstances(l_GuiService_0);
        end);
        if v2.get() ~= v2.Asset then
            return;
        else
            local v31 = require(l_script_FirstAncestor_0.Bin.Common.setup);
            local v32 = require(l_script_FirstAncestor_0.Bin.Common.setupMain);
            v31(plugin, v32);
            return;
        end;
    end;
end;