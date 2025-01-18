local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getChildAtKey);
local v3 = require(l_Parent_1.Dash);
local _ = v3.Types;
local l_assign_0 = v3.assign;
local l_class_0 = v3.class;
local l_collect_0 = v3.collect;
local l_copy_0 = v3.copy;
local l_keys_0 = v3.keys;
local l_pretty_0 = v3.pretty;
local l_reduce_0 = v3.reduce;
local l_shallowEqual_0 = v3.shallowEqual;
local l_insert_0 = table.insert;
local _ = table.sort;
local v16 = l_class_0("FieldWatcher", function(v15) --[[ Line: 28 ]]
    return {
        onFieldsChanged = v15
    };
end);
v16._init = function(v17) --[[ Line: 34 ]] --[[ Name: _init ]]
    v17.onPoll = function() --[[ Line: 36 ]]
        -- upvalues: v17 (copy)
        if v17.root and v17.polling then
            v17:_checkFields();
            delay(0.5, v17.onPoll);
        end;
    end;
end;
v16.monitor = function(v18) --[[ Line: 45 ]] --[[ Name: monitor ]]
    if not v18.polling then
        v18.polling = true;
        spawn(v18.onPoll);
    end;
end;
v16._checkFields = function(v19) --[[ Line: 53 ]] --[[ Name: _checkFields ]]
    -- upvalues: l_collect_0 (copy), l_shallowEqual_0 (copy), l_assign_0 (copy), l_keys_0 (copy)
    local v23 = l_collect_0(v19.activeFields, function(v20, v21) --[[ Line: 55 ]]
        -- upvalues: v19 (copy), l_shallowEqual_0 (ref)
        local v22 = v19:walk(v19.root, v20);
        if not l_shallowEqual_0(v21, v22) then
            return v20, v22;
        else
            return;
        end;
    end);
    l_assign_0(v19.activeFields, v23);
    local v24 = l_keys_0(v23);
    if #v24 > 0 then
        v19.onFieldsChanged(v24);
    end;
end;
v16.collect = function(v25, v26, v27, v28) --[[ Line: 71 ]] --[[ Name: collect ]]
    -- upvalues: l_collect_0 (copy), l_copy_0 (copy), l_insert_0 (copy), l_pretty_0 (copy)
    if typeof(v26) ~= "table" then
        return {};
    else
        return (l_collect_0(v26, function(v29, v30) --[[ Line: 75 ]]
            -- upvalues: l_copy_0 (ref), v28 (copy), l_insert_0 (ref), v27 (copy), v25 (copy), l_pretty_0 (ref)
            local v31 = typeof(v29) == "number" and v29 or tostring(v29);
            local v32 = l_copy_0(v28);
            l_insert_0(v32, v31);
            local v33 = typeof(v30) == "table" and v27 > 0 and v25:collect(v30, v27 - 1, v32) or {};
            return v31, {
                Name = v31, 
                Summary = l_pretty_0(v30, {
                    depth = 2, 
                    arrayLength = true
                }), 
                Path = v32, 
                Children = v33
            };
        end));
    end;
end;
v16.walk = function(v34, _, v36) --[[ Line: 96 ]] --[[ Name: walk ]]
    -- upvalues: l_reduce_0 (copy), v2 (copy), l_pretty_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 98 ]]
        -- upvalues: l_reduce_0 (ref), v36 (copy), v2 (ref), v34 (copy)
        return l_reduce_0(v36, function(v37, v38) --[[ Line: 99 ]]
            -- upvalues: v2 (ref)
            return v2(v37, v38);
        end, v34.root);
    end);
    if not l_status_0 then
        warn(("Cannot walk path %s: %s "):format(l_pretty_0(v36), l_result_0));
        l_result_0 = nil;
    end;
    return l_result_0;
end;
v16.setRoot = function(v41, v42) --[[ Line: 111 ]] --[[ Name: setRoot ]]
    v41.activeFields = {};
    v41.root = v42;
    v41:monitor();
end;
v16.addPath = function(v43, v44) --[[ Line: 119 ]] --[[ Name: addPath ]]
    -- upvalues: l_copy_0 (copy)
    local v45 = v43:walk(v43.root, v44);
    v43.activeFields[v44] = v45 and l_copy_0(v45) or {};
end;
v16.destroy = function(v46) --[[ Line: 126 ]] --[[ Name: destroy ]]
    v46.root = nil;
    v46.polling = false;
end;
return v16;