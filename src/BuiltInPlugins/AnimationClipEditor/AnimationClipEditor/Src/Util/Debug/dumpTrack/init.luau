local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local function _(v3, v4) --[[ Line: 6 ]] --[[ Name: traverseComponents ]]
    if not v3 then
        return;
    else
        local function v5(v6, v7, v8) --[[ Line: 11 ]] --[[ Name: traverseComponentsRec ]]
            -- upvalues: v5 (copy)
            if v6.Components then
                for v9, v10 in pairs(v6.Components) do
                    v5(v10, (v7 ~= "" and v7 .. "." or "") .. v9, v8);
                end;
                return;
            else
                v8(v6, v7);
                return;
            end;
        end;
        if v3.Components then
            for v11, v12 in pairs(v3.Components) do
                v5(v12, "" .. v11, v4);
            end;
            return;
        else
            v4(v3, "");
            return;
        end;
    end;
end;
local _ = function(v14) --[[ Line: 25 ]] --[[ Name: getTrackExtents ]]
    local v15 = 0;
    local function v18(v16, _) --[[ Line: 28 ]]
        -- upvalues: v15 (ref)
        if v16.Keyframes and #v16.Keyframes > 0 then
            v15 = math.max(v15, v16.Keyframes[#v16.Keyframes]);
        end;
    end;
    if v14 then
        local function v19(v20, v21, v22) --[[ Line: 11 ]] --[[ Name: traverseComponentsRec ]]
            -- upvalues: v19 (copy)
            if v20.Components then
                for v23, v24 in pairs(v20.Components) do
                    v19(v24, (v21 ~= "" and v21 .. "." or "") .. v23, v22);
                end;
                return;
            else
                v22(v20, v21);
                return;
            end;
        end;
        if v14.Components then
            for v25, v26 in pairs(v14.Components) do
                v19(v26, "" .. v25, v18);
            end;
        else
            v18(v14, "");
        end;
    end;
    return v15;
end;
local function _(v28) --[[ Line: 37 ]] --[[ Name: format ]]
    return (tostring(math.round(v28 * 10000) / 10000));
end;
local function v38(v30, v31, v32) --[[ Line: 42 ]] --[[ Name: getValues ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v33 = {};
    if v30.Type == v2.TRACK_TYPES.Facs then
        return {
            (tostring(math.round(v1.getValue(v30, v31, v32) * 10000) / 10000))
        };
    else
        if v30.Type == v2.TRACK_TYPES.CFrame then
            local v34 = v1.getValue(v30, v31, v32);
            local v35, v36, v37 = v34:ToEulerAnglesXYZ();
            v33 = {
                tostring(math.round(v34.X * 10000) / 10000), 
                tostring(math.round(v34.Y * 10000) / 10000), 
                tostring(math.round(v34.Z * 10000) / 10000), 
                tostring(math.round(math.deg(v35) * 10000) / 10000), 
                tostring(math.round(math.deg(v36) * 10000) / 10000), 
                (tostring(math.round(math.deg(v37) * 10000) / 10000))
            };
        end;
        return v33;
    end;
end;
local function _(v39, v40) --[[ Line: 61 ]] --[[ Name: makeRow ]]
    -- upvalues: v2 (copy)
    return (tostring(math.round(v39 / v2.TICK_FREQUENCY * 10000) / 10000) .. ",") .. table.concat(v40, ",") .. "\n";
end;
return function(v42, v43, v44) --[[ Line: 67 ]] --[[ Name: dump ]]
    -- upvalues: v2 (copy), v38 (copy)
    local v45 = 0;
    local v46;
    do
        local l_v45_0 = v45;
        local function v50(v48, _) --[[ Line: 28 ]]
            -- upvalues: l_v45_0 (ref)
            if v48.Keyframes and #v48.Keyframes > 0 then
                l_v45_0 = math.max(l_v45_0, v48.Keyframes[#v48.Keyframes]);
            end;
        end;
        if v42 then
            local function v51(v52, v53, v54) --[[ Line: 11 ]] --[[ Name: traverseComponentsRec ]]
                -- upvalues: v51 (copy)
                if v52.Components then
                    for v55, v56 in pairs(v52.Components) do
                        v51(v56, (v53 ~= "" and v53 .. "." or "") .. v55, v54);
                    end;
                    return;
                else
                    v54(v52, v53);
                    return;
                end;
            end;
            if v42.Components then
                for v57, v58 in pairs(v42.Components) do
                    v51(v58, "" .. v57, v50);
                end;
            else
                v50(v42, "");
            end;
        end;
        v46 = l_v45_0;
    end;
    v45 = nil;
    v45 = if v42 and v42.Type == v2.TRACK_TYPES.Facs then {
        v43 or "FACS", 
        "Value"
    } else {
        v43 or "CFrame", 
        "Px1", 
        "Py1", 
        "Pz1", 
        "Rx1", 
        "Ry1", 
        "Rz1"
    };
    local v59 = "\n" .. table.concat(v45, ",") .. "\n";
    if v42 then
        for v60 = 0, v46, 20 do
            local v61 = v38(v42, v60, v44);
            v59 = v59 .. (tostring(math.round(v60 / v2.TICK_FREQUENCY * 10000) / 10000) .. ",") .. table.concat(v61, ",") .. "\n";
        end;
    end;
    print(v59);
end;