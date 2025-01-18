local l_Parent_0 = script.Parent.Parent;
local l_assign_0 = require(l_Parent_0.Collections).Object.assign;
local _ = require(script.Parent.types);
local function v4(v3) --[[ Line: 29 ]] --[[ Name: linear ]]
    return v3;
end;
local function v6(v5) --[[ Line: 33 ]] --[[ Name: quad ]]
    return v5 * v5;
end;
local function v8(v7) --[[ Line: 37 ]] --[[ Name: cubic ]]
    return v7 * v7 * v7;
end;
local function v10(v9) --[[ Line: 41 ]] --[[ Name: quart ]]
    return v9 * v9 * v9 * v9;
end;
local function v12(v11) --[[ Line: 45 ]] --[[ Name: quint ]]
    return v11 * v11 * v11 * v11 * v11;
end;
local function v14(v13) --[[ Line: 49 ]] --[[ Name: exponential ]]
    if v13 == 0 then
        return 0;
    else
        return (math.pow(2, 10 * (v13 - 1)));
    end;
end;
local function v16(v15) --[[ Line: 53 ]] --[[ Name: sine ]]
    return 1 - math.cos(v15 * 3.141592653589793 / 2);
end;
local function v18(v17) --[[ Line: 57 ]] --[[ Name: elastic ]]
    if v17 == 0 then
        return 0;
    elseif v17 == 1 then
        return 1;
    else
        return -math.pow(2, 10 * v17 - 10) * math.sin((v17 * 10 - 10.75) * 2.0943951023931953);
    end;
end;
local function v20(v19) --[[ Line: 61 ]] --[[ Name: back ]]
    return 2.70158 * v19 * v19 * v19 - 1.70158 * v19 * v19;
end;
local function _(v21) --[[ Line: 67 ]] --[[ Name: easeOutBounce ]]
    if v21 < 0.36363636363636365 then
        return 7.5625 * v21 * v21;
    elseif v21 < 0.7272727272727273 then
        return 7.5625 * (v21 - 0.5454545454545454) * (v21 - 0.5454545454545454) + 0.75;
    elseif v21 < 0.9090909090909091 then
        return 7.5625 * (v21 - 0.8181818181818182) * (v21 - 0.8181818181818182) + 0.9375;
    else
        return 7.5625 * (v21 - 0.9545454545454546) * (v21 - 0.9545454545454546) + 0.984375;
    end;
end;
local v26 = {
    [Enum.EasingStyle.Linear] = v4, 
    [Enum.EasingStyle.Quad] = v6, 
    [Enum.EasingStyle.Cubic] = v8, 
    [Enum.EasingStyle.Quart] = v10, 
    [Enum.EasingStyle.Quint] = v12, 
    [Enum.EasingStyle.Exponential] = v14, 
    [Enum.EasingStyle.Sine] = v16, 
    [Enum.EasingStyle.Back] = v20, 
    [Enum.EasingStyle.Bounce] = function(v23) --[[ Line: 82 ]] --[[ Name: bounce ]]
        local v24 = 1 - v23;
        return 1 - if v24 < 0.36363636363636365 then 7.5625 * v24 * v24 else if v24 < 0.7272727272727273 then 7.5625 * (v24 - 0.5454545454545454) * (v24 - 0.5454545454545454) + 0.75 else if v24 < 0.9090909090909091 then 7.5625 * (v24 - 0.8181818181818182) * (v24 - 0.8181818181818182) + 0.9375 else 7.5625 * (v24 - 0.9545454545454546) * (v24 - 0.9545454545454546) + 0.984375;
    end, 
    [Enum.EasingStyle.Elastic] = v18, 
    [Enum.EasingStyle.Circular] = function(v25) --[[ Line: 86 ]] --[[ Name: circular ]]
        return -(math.sqrt(1 - v25 * v25) - 1);
    end
};
return function(v27, v28) --[[ Line: 104 ]] --[[ Name: ease ]]
    -- upvalues: l_assign_0 (copy), v26 (copy), v4 (copy)
    local v29 = {
        duration = 1, 
        easingStyle = Enum.EasingStyle.Linear
    };
    if v28 ~= nil then
        l_assign_0(v29, v28);
    end;
    local l_duration_0 = v29.duration;
    local v31 = v26[v29.easingStyle] or v4;
    return {
        step = function(v32, v33) --[[ Line: 118 ]] --[[ Name: step ]]
            -- upvalues: v27 (copy), l_duration_0 (copy), v31 (copy)
            local v34 = if v32.initialValue ~= nil then v32.initialValue else v32.value or 0;
            local v35 = (v32.elapsed or 0) + v33;
            if v32.goal and v27 ~= v32.goal then
                v34 = v32.value;
                v35 = 0;
            end;
            local v36 = math.min(v35 / l_duration_0, 1);
            local v37 = v31(v36);
            local v38 = v34 + (v27 - v34) * v37;
            local v39 = true;
            if l_duration_0 > v35 then
                v39 = v34 == v27;
            end;
            if v39 then
                v38 = v27;
                v34 = v27;
                v35 = 0;
            end;
            return {
                initialValue = v34, 
                goal = v27, 
                value = v38, 
                elapsed = v35, 
                complete = v39
            };
        end
    };
end;