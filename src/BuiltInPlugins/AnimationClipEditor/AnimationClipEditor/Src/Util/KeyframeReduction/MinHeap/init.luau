local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v3 = {
        array = {}
    };
    setmetatable(v3, v2);
    return v3;
end;
compare = function(v4, v5) --[[ Line: 20 ]] --[[ Name: compare ]]
    return v4.area - v5.area;
end;
v2.push = function(v6, v7) --[[ Line: 24 ]] --[[ Name: push ]]
    table.insert(v6.array, v7);
    v7._order = #v6.array;
    v6:up(#v6.array);
    return #v6.array;
end;
v2.pop = function(v8) --[[ Line: 31 ]] --[[ Name: pop ]]
    local v9 = v8.array[1];
    local v10 = table.remove(v8.array);
    if v10 and #v8.array > 0 then
        v10._order = 1;
        v8.array[1] = v10;
        v8:down(1);
    end;
    return v9;
end;
v2.remove = function(v11, v12) --[[ Line: 42 ]] --[[ Name: remove ]]
    local l__order_0 = v12._order;
    local v14 = table.remove(v11.array);
    if v14 and l__order_0 ~= #v11.array + 1 then
        v11.array[l__order_0] = v14;
        v14._order = l__order_0;
        if compare(v14, v12) < 0 then
            v11:up(l__order_0);
            return;
        else
            v11:down(l__order_0);
        end;
    end;
end;
v2.up = function(v15, v16) --[[ Line: 56 ]] --[[ Name: up ]]
    while v16 > 1 do
        local v17 = math.floor(v16 / 2);
        if compare(v15.array[v16], v15.array[v17]) < 0 then
            local l_array_0 = v15.array;
            local l_array_1 = v15.array;
            local v20 = v15.array[v16];
            local v21 = v15.array[v17];
            l_array_0[v17] = v20;
            l_array_1[v16] = v21;
            l_array_0 = v15.array[v17];
            l_array_1 = v15.array[v16];
            l_array_0._order = v17;
            l_array_1._order = v16;
            v16 = v17;
        else
            break;
        end;
    end;
end;
v2.down = function(v22, v23) --[[ Line: 68 ]] --[[ Name: down ]]
    while true do
        local v24 = v23 * 2;
        local v25 = v24 + 1;
        local l_v23_0 = v23;
        if v24 <= #v22.array and compare(v22.array[v24], v22.array[l_v23_0]) < 0 then
            l_v23_0 = v24;
        end;
        if v25 <= #v22.array and compare(v22.array[v25], v22.array[l_v23_0]) < 0 then
            l_v23_0 = v25;
        end;
        if l_v23_0 ~= v23 then
            local l_array_2 = v22.array;
            local l_array_3 = v22.array;
            local v29 = v22.array[l_v23_0];
            local v30 = v22.array[v23];
            l_array_2[v23] = v29;
            l_array_3[l_v23_0] = v30;
            l_array_2 = v22.array[v23];
            l_array_3 = v22.array[l_v23_0];
            l_array_2._order = v23;
            l_array_3._order = l_v23_0;
            v23 = l_v23_0;
        else
            break;
        end;
    end;
end;
return v2;