if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("AttenuationCurveEditor", l_script_FirstAncestor_0.Src);
    if v1.isCli() then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
        local _ = require(l_script_FirstAncestor_0.Src.Types);
        local v4 = require(l_script_FirstAncestor_0.Src.Util.AttenuationUtil);
        local v5 = {};
        local v6 = nil;
        local v7 = nil;
        local function v15(v8) --[[ Line: 36 ]] --[[ Name: onOpen ]]
            -- upvalues: v5 (ref), v7 (ref), v4 (copy), v6 (ref)
            for v9 = #v8, 1, -1 do
                local v10 = v8[v9];
                if not v10 or not v10:IsA("AudioEmitter") and not v10:IsA("AudioListener") then
                    table.remove(v8, v9);
                end;
            end;
            if #v8 == 0 then
                return;
            else
                v5 = v8;
                local v11 = v8[1];
                local v12 = ("%* \"%*\""):format(v11.ClassName, v11.Name);
                if #v8 > 1 then
                    v12 = ("%* (%* items)"):format(v11.ClassName, #v8);
                end;
                v7 = v4.getDistanceAttenuation(v11);
                assert(v7, "currentCurve was nil");
                plugin:Invoke("OnOpen", v4.stringifyCurveTable(v7), v12);
                if v6 then
                    v6:Disconnect();
                end;
                v6 = v11.Changed:Connect(function(v13) --[[ Line: 64 ]]
                    -- upvalues: v7 (ref), v4 (ref), v11 (copy)
                    if v13 ~= "DistanceAttenuation" then
                        return;
                    elseif not v7 then
                        return;
                    else
                        assert(v7, "currentCurve was nil");
                        local v14 = v4.getDistanceAttenuation(v11);
                        if v4.areCurvesEqual(v7, v14) then
                            return;
                        else
                            v7 = v14;
                            plugin:Invoke("OnInstanceChanged", v4.stringifyCurveTable(v14));
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end;
        plugin:OnInvoke("OnEdit", function(v16) --[[ Line: 84 ]]
            -- upvalues: v4 (copy), v7 (ref), v5 (ref)
            local v17 = v4.destringifyCurveTable(v16);
            v7 = v17;
            for _, v19 in v5 do
                if v19 and (v19:IsA("AudioEmitter") or v19:IsA("AudioListener")) then
                    v4.setDistanceAttenuation(v19, v17);
                end;
            end;
        end);
        plugin:OnInvoke("OnStopEditing", function() --[[ Line: 96 ]]
            -- upvalues: v5 (ref), v6 (ref), v7 (ref)
            v5 = {};
            if v6 then
                v6:Disconnect();
                v6 = nil;
            end;
            v7 = nil;
        end);
        local v20 = nil;
        v20 = game:GetService("SoundService").OpenAttenuationCurveEditorSignal:Connect(v15);
        if v2.get() ~= v2.asset then
            return;
        else
            local v21 = require(l_script_FirstAncestor_0.Bin.Common.setup);
            local v22 = require(l_script_FirstAncestor_0.Bin.Common.setupMain);
            v21(plugin, v22);
            return;
        end;
    end;
end;