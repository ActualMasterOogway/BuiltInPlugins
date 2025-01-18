if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("DirectionalCurveEditor", l_script_FirstAncestor_0.Src);
    if v1.isCli() then
        return;
    elseif not require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagCLI_109818() then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
        local v3 = require(l_script_FirstAncestor_0.Src.Types);
        local v4 = require(l_script_FirstAncestor_0.Src.Util.AttenuationUtil);
        local v5 = {};
        local v6 = nil;
        local v7 = 0;
        local v8 = nil;
        local function v20(v9, v10) --[[ Line: 44 ]] --[[ Name: onOpenByProperty ]]
            -- upvalues: v5 (ref), v3 (copy), v8 (ref), v4 (copy), v7 (ref), v6 (ref)
            v5 = {};
            for v11 = #v9, 1, -1 do
                local v12 = v9[v11];
                if v12 and (v12:IsA(v3.EMITTER) or v12:IsA(v3.LISTENER)) then
                    table.insert(v5, v12);
                end;
            end;
            if #v5 == 0 then
                return;
            else
                local v13 = v5[1];
                local v14 = ("%* \"%*\""):format(v13.ClassName, v13.Name);
                if #v5 > 1 then
                    v14 = ("%* (%* items)"):format(v13.ClassName, #v9);
                end;
                v8 = v4.getInstanceData(v13);
                plugin:Invoke("OnOpen", v8, v10, v7, v14);
                if v6 then
                    v6:Disconnect();
                end;
                local l_v7_0 = v7;
                v6 = v13.Changed:Connect(function(v16) --[[ Line: 71 ]]
                    -- upvalues: v8 (ref), v3 (ref), v4 (ref), v13 (copy), l_v7_0 (copy), v14 (ref)
                    if not v8 then
                        return;
                    else
                        assert(v8, "currentInstanceData was nil");
                        if v16 ~= v3.DISTANCE and v16 ~= v3.ANGLE then
                            return;
                        else
                            local v17 = v4.getInstanceData(v13);
                            local v18 = if v16 == v3.DISTANCE then v17.DistanceCurve else v17.AngleCurve;
                            local v19 = if v16 == v3.DISTANCE then v8.DistanceCurve else v8.AngleCurve;
                            if v4.areKeypointsEqual(v4.strTableToKeypoints(v18), v4.strTableToKeypoints(v19)) then
                                return;
                            else
                                v8 = v17;
                                plugin:Invoke("OnInstanceChanged", v17, l_v7_0, v14);
                                return;
                            end;
                        end;
                    end;
                end);
                v7 = v7 + 1;
                return;
            end;
        end;
        local function v22(v21) --[[ Line: 101 ]] --[[ Name: onOpenDirectionalEditor ]]
            -- upvalues: v20 (copy)
            v20(v21, "AngleAttenuation");
        end;
        plugin:OnInvoke("OnEdit", function(v23, v24) --[[ Line: 105 ]]
            -- upvalues: v8 (ref), v3 (copy), v4 (copy), v5 (ref)
            if v8 then
                if v24 == v3.DISTANCE then
                    v8.DistanceCurve = v23;
                elseif v24 == v3.ANGLE then
                    v8.AngleCurve = v23;
                end;
            end;
            local v25 = v4.destringifyCurveTable(v23);
            for _, v27 in v5 do
                if v24 == v3.DISTANCE then
                    v4.setDistanceAttenuation(v27, v25);
                elseif v24 == v3.ANGLE then
                    v4.setAngleAttenuation(v27, v25);
                end;
            end;
        end);
        plugin:OnInvoke("OnStopEditing", function() --[[ Line: 124 ]]
            -- upvalues: v5 (ref), v6 (ref), v8 (ref)
            v5 = {};
            if v6 then
                v6:Disconnect();
                v6 = nil;
            end;
            v8 = nil;
        end);
        local v28 = nil;
        v28 = game:GetService("SoundService").OpenDirectionalCurveEditorSignal:Connect(v22);
        if v2.get() ~= v2.asset then
            return;
        else
            local v29 = require(l_script_FirstAncestor_0.Bin.Common.setup);
            local v30 = require(l_script_FirstAncestor_0.Bin.Common.setupMain);
            v29(plugin, v30);
            return;
        end;
    end;
end;