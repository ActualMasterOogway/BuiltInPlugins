local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_join_0 = v2.join;
local l_copy_0 = v2.copy;
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v5.useCallback;
local l_useEffect_0 = v5.useEffect;
local l_useState_0 = v5.useState;
local v9 = require(l_script_FirstAncestor_0.Src.Util.roundDecimal);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = v1.getFIntDistanceAttenuationMaxPoints();
return function(v12, v13) --[[ Line: 30 ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy), v11 (copy), v9 (copy), l_join_0 (copy), l_copy_0 (copy)
    local v14, v15 = l_useState_0(v12.Keypoints);
    local v16, v17 = l_useState_0(1);
    local v18, v19 = l_useState_0(false);
    l_useEffect_0(function() --[[ Line: 35 ]]
        -- upvalues: v18 (copy), v19 (copy), v13 (copy), v14 (copy)
        if not v18 then
            v19(true);
            return;
        else
            if v13 then
                v13({
                    Keypoints = v14
                });
            end;
            return;
        end;
    end, {
        v14
    });
    local v21 = l_useCallback_0(function(v20) --[[ Line: 50 ]]
        -- upvalues: v15 (copy)
        v15(v20.Keypoints);
    end, {});
    local v43 = l_useCallback_0(function(v22, v23) --[[ Line: 54 ]]
        -- upvalues: v11 (ref)
        if v23 < 1 or #v22 < v23 then
            return v23;
        else
            local function _(v24, v25) --[[ Line: 59 ]] --[[ Name: swap ]]
                -- upvalues: v22 (copy)
                local l_v22_0 = v22;
                local l_v22_1 = v22;
                local v28 = v22[v25];
                local v29 = v22[v24];
                l_v22_0[v24] = v28;
                l_v22_1[v25] = v29;
            end;
            for _ = 0, v11 do
                local v32 = v22[v23];
                local v33 = v22[v23 - 1];
                if v33 and v33.X > v32.X then
                    local v34 = v23 - 1;
                    local l_v23_0 = v23;
                    local v36 = v22[l_v23_0];
                    local v37 = v22[v34];
                    v22[v34] = v36;
                    v22[l_v23_0] = v37;
                    v23 = v23 - 1;
                else
                    local v38 = v22[v23 + 1];
                    if v38 and v38.X < v32.X then
                        local l_v23_1 = v23;
                        local v40 = v23 + 1;
                        local v41 = v22[v40];
                        local v42 = v22[l_v23_1];
                        v22[l_v23_1] = v41;
                        v22[v40] = v42;
                        v23 = v23 + 1;
                    else
                        break;
                    end;
                end;
            end;
            return v23;
        end;
    end, {});
    local v47 = l_useCallback_0(function(v44, v45) --[[ Line: 86 ]]
        -- upvalues: v9 (ref)
        local v46 = v9(v44[v45].X, 3);
        if v45 >= 2 and v9(v44[v45 - 1].X, 3) == v46 then
            table.remove(v44, v45 - 1);
            return v45 - 1;
        elseif v45 <= #v44 - 1 and v9(v44[v45 + 1].X, 3) == v46 then
            table.remove(v44, v45 + 1);
            return v45;
        else
            return v45;
        end;
    end, {});
    local v54 = l_useCallback_0(function(v48, v49) --[[ Line: 112 ]]
        -- upvalues: v9 (ref), l_join_0 (ref), v14 (copy), v16 (copy), v43 (copy), v47 (copy), v17 (copy), v15 (copy)
        local v50 = v9(v48.X, 3);
        local v51 = v9(v48.Y, 3);
        v48 = Vector2.new(math.clamp(v50, 0, 1e999), (math.clamp(v51, 0, 1)));
        local v52 = l_join_0(v14, {
            [v16] = v48
        });
        local v53 = v43(v52, v16);
        if v49 then
            v53 = v47(v52, v53);
        end;
        v17(v53);
        v15(v52);
    end, {
        v14, 
        v16
    });
    local v59 = l_useCallback_0(function(v55) --[[ Line: 130 ]]
        -- upvalues: v14 (copy)
        local v56 = 1;
        local v57 = #v14;
        while true do
            if v56 <= v57 then
                local v58 = math.floor((v56 + v57) / 2);
                if v14[v58].X == v55.X then
                    return v58;
                elseif v55.X < v14[v58].X then
                    v57 = v58 - 1;
                else
                    v56 = v58 + 1;
                end;
            else
                return v56;
            end;
        end;
    end, {
        v14
    });
    local v63 = l_useCallback_0(function(v60) --[[ Line: 150 ]]
        -- upvalues: v14 (copy), v11 (ref), l_copy_0 (ref), v59 (copy), v15 (copy), v17 (copy)
        if #v14 >= v11 then
            return false;
        else
            local v61 = l_copy_0(v14);
            local v62 = v59(v60);
            if v62 <= #v61 and v61[v62].X == v60.X then
                v61[v62] = v60;
            else
                table.insert(v61, v62, v60);
            end;
            v15(v61);
            v17(v62);
            return true;
        end;
    end, {
        v14, 
        v16, 
        v59
    });
    local v65 = l_useCallback_0(function() --[[ Line: 170 ]]
        -- upvalues: l_copy_0 (ref), v14 (copy), v16 (copy), v15 (copy), v17 (copy)
        local v64 = l_copy_0(v14);
        table.remove(v64, v16);
        v15(v64);
        if #v64 < v16 then
            v17(#v64);
        end;
    end, {
        v14, 
        v16
    });
    local v67 = l_useCallback_0(function(v66) --[[ Line: 180 ]]
        -- upvalues: v17 (copy)
        v17(v66);
    end, {});
    local v68 = l_useCallback_0(function() --[[ Line: 184 ]]
        -- upvalues: v16 (copy), v14 (copy)
        if v16 <= 0 or v16 > #v14 then
            return nil;
        else
            return v14[v16];
        end;
    end, {
        v14, 
        v16
    });
    return {
        keypoints = v14, 
        selectedIndex = v16, 
        reset = v21, 
        update = v54, 
        add = v63, 
        remove = v65, 
        select = v67, 
        getSelectedKeypoint = v68, 
        getIndexForPoint = v59
    };
end;