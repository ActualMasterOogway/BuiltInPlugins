local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_join_0 = v2.join;
local l_copy_0 = v2.copy;
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v5.useCallback;
local l_useEffect_0 = v5.useEffect;
local l_useState_0 = v5.useState;
local v9 = require(l_script_FirstAncestor_0.Src.Util.AttenuationUtil);
local v10 = require(l_script_FirstAncestor_0.Src.Util.roundDecimal);
local v11 = require(l_script_FirstAncestor_0.Src.Types);
local v12 = v1.getFIntDistanceAttenuationMaxPoints();
return function(v13, v14, v15, v16) --[[ Line: 30 ]]
    -- upvalues: l_useState_0 (copy), v11 (copy), v9 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy), v12 (copy), v10 (copy), l_join_0 (copy), l_copy_0 (copy)
    local v17, v18 = l_useState_0(v13);
    local v19, v20 = l_useState_0(v13);
    local v21, v22 = l_useState_0(1);
    local v23 = 1;
    if v14 == v11.DISTANCE then
        v23 = if #v19 > 0 then math.max(100, v19[#v19].X * 1.1) else 100;
    elseif v14 == v11.ANGLE then
        v23 = 180;
    end;
    local v24, v25 = l_useState_0(Rect.new(0, 0, v23, 1));
    local v26, v27 = l_useState_0(v11.INVERSE);
    if not v9.areKeypointsEqual(v13, v17) then
        v18(v13);
        v20(v13);
        if v19 ~= nil and #v19 < v21 then
            v22(#v19);
        end;
        if v16 ~= nil then
            v16();
        end;
    end;
    local v28, v29 = l_useState_0(false);
    l_useEffect_0(function() --[[ Line: 71 ]]
        -- upvalues: v28 (copy), v29 (copy), v15 (copy), v9 (ref), v19 (copy)
        if not v28 then
            v29(true);
            return;
        else
            if v15 ~= nil then
                v15(v9.keypointsToStrTable(v19));
            end;
            return;
        end;
    end, {
        v19
    });
    local v31 = l_useCallback_0(function(v30) --[[ Line: 85 ]]
        -- upvalues: v20 (copy), v22 (copy)
        v20(v30);
        v22(1);
    end, {
        v19
    });
    local v54 = l_useCallback_0(function(v32, v33) --[[ Line: 90 ]]
        -- upvalues: v12 (ref)
        local l_v33_0 = v33;
        if l_v33_0 < 1 or #v32 < l_v33_0 then
            return l_v33_0;
        else
            local function _(v35, v36) --[[ Line: 97 ]] --[[ Name: swap ]]
                -- upvalues: v32 (copy)
                local l_v32_0 = v32;
                local l_v32_1 = v32;
                local v39 = v32[v36];
                local v40 = v32[v35];
                l_v32_0[v35] = v39;
                l_v32_1[v36] = v40;
            end;
            for _ = 0, v12 do
                local v43 = v32[l_v33_0];
                local v44 = v32[l_v33_0 - 1];
                if v44 and v44.X > v43.X then
                    local v45 = l_v33_0 - 1;
                    local l_l_v33_0_0 = l_v33_0;
                    local v47 = v32[l_l_v33_0_0];
                    local v48 = v32[v45];
                    v32[v45] = v47;
                    v32[l_l_v33_0_0] = v48;
                    l_v33_0 = l_v33_0 - 1;
                else
                    local v49 = v32[l_v33_0 + 1];
                    if v49 and v49.X < v43.X then
                        local l_l_v33_0_1 = l_v33_0;
                        local v51 = l_v33_0 + 1;
                        local v52 = v32[v51];
                        local v53 = v32[l_l_v33_0_1];
                        v32[l_l_v33_0_1] = v52;
                        v32[v51] = v53;
                        l_v33_0 = l_v33_0 + 1;
                    else
                        break;
                    end;
                end;
            end;
            return l_v33_0;
        end;
    end, {});
    local v58 = l_useCallback_0(function(v55, v56) --[[ Line: 124 ]]
        -- upvalues: v10 (ref)
        local v57 = v10(v55[v56].X, 3);
        if v56 >= 2 and v10(v55[v56 - 1].X, 3) == v57 then
            table.remove(v55, v56 - 1);
            return v56 - 1;
        elseif v56 <= #v55 - 1 and v10(v55[v56 + 1].X, 3) == v57 then
            table.remove(v55, v56 + 1);
            return v56;
        else
            return v56;
        end;
    end, {});
    local v65 = l_useCallback_0(function(v59, v60) --[[ Line: 150 ]]
        -- upvalues: v10 (ref), l_join_0 (ref), v19 (copy), v21 (copy), v54 (copy), v58 (copy), v22 (copy), v20 (copy), v16 (copy)
        local v61 = v10(v59.X, 3);
        local v62 = v10(v59.Y, 3);
        v59 = Vector2.new(math.clamp(v61, 0, 180), (math.clamp(v62, 0, 1)));
        local v63 = l_join_0(v19, {
            [v21] = v59
        });
        local v64 = v54(v63, v21);
        if v60 then
            v64 = v58(v63, v64);
        end;
        v22(v64);
        v20(v63);
        if v16 ~= nil then
            v16();
        end;
    end, {
        v19, 
        v21
    });
    local v70 = l_useCallback_0(function(v66) --[[ Line: 171 ]]
        -- upvalues: v19 (copy)
        local v67 = 1;
        local v68 = #v19;
        while true do
            if v67 <= v68 then
                local v69 = math.floor((v67 + v68) / 2);
                if v19[v69].X == v66.X then
                    return v69;
                elseif v66.X < v19[v69].X then
                    v68 = v69 - 1;
                else
                    v67 = v69 + 1;
                end;
            else
                return v67;
            end;
        end;
    end, {
        v19
    });
    local v74 = l_useCallback_0(function(v71) --[[ Line: 191 ]]
        -- upvalues: v19 (copy), v12 (ref), l_copy_0 (ref), v70 (copy), v20 (copy), v22 (copy), v16 (copy)
        if #v19 >= v12 then
            return false;
        else
            local v72 = l_copy_0(v19);
            local v73 = v70(v71);
            if v73 <= #v72 and v72[v73].X == v71.X then
                v72[v73] = v71;
            else
                table.insert(v72, v73, v71);
            end;
            v20(v72);
            v22(v73);
            if v16 ~= nil then
                v16();
            end;
            return true;
        end;
    end, {
        v19, 
        v21, 
        v70
    });
    local v76 = l_useCallback_0(function() --[[ Line: 213 ]]
        -- upvalues: l_copy_0 (ref), v19 (copy), v21 (copy), v20 (copy), v22 (copy), v16 (copy)
        local v75 = l_copy_0(v19);
        table.remove(v75, v21);
        v20(v75);
        if #v75 < v21 then
            v22(#v75);
        end;
        if v16 ~= nil then
            v16();
        end;
    end, {
        v19, 
        v21
    });
    local v78 = l_useCallback_0(function(v77) --[[ Line: 226 ]]
        -- upvalues: v22 (copy)
        v22(v77);
    end, {});
    local v79 = l_useCallback_0(function() --[[ Line: 230 ]]
        -- upvalues: v21 (copy), v19 (copy)
        if v21 <= 0 or v21 > #v19 then
            return nil;
        else
            return v19[v21];
        end;
    end, {
        v19, 
        v21
    });
    local v81 = l_useCallback_0(function(v80) --[[ Line: 237 ]]
        -- upvalues: v25 (copy)
        v25(v80);
    end, {});
    return {
        keypoints = v19, 
        selectedIndex = v21, 
        plotRect = v24, 
        curveType = v26, 
        reset = v31, 
        update = v65, 
        add = v74, 
        remove = v76, 
        select = v78, 
        getSelectedKeypoint = v79, 
        setPlotRect = v81, 
        setCurveType = v27
    };
end;