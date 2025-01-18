local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getChildAtKey);
local v3 = require(l_Parent_1.Dash);
local l_assign_0 = v3.assign;
local l_class_0 = v3.class;
local l_collect_0 = v3.collect;
local l_copy_0 = v3.copy;
local l_keys_0 = v3.keys;
local l_pretty_0 = v3.pretty;
local l_reduce_0 = v3.reduce;
local l_shallowEqual_0 = v3.shallowEqual;
local l_insert_0 = table.insert;
local v15 = l_class_0("FieldWatcher", function(v13, v14) --[[ Line: 27 ]]
    return {
        onFieldsChanged = v13, 
        activeFields = {}, 
        rootKey = v14
    };
end);
v15._init = function(v16) --[[ Line: 35 ]] --[[ Name: _init ]]
    v16.onPoll = function() --[[ Line: 37 ]]
        -- upvalues: v16 (copy)
        if v16.root and v16.polling then
            v16:checkFields();
            delay(0.5, v16.onPoll);
        end;
    end;
end;
v15.monitor = function(v17) --[[ Line: 46 ]] --[[ Name: monitor ]]
    if not v17.polling then
        v17.polling = true;
        spawn(v17.onPoll);
    end;
end;
v15.checkFields = function(v18) --[[ Line: 54 ]] --[[ Name: checkFields ]]
    -- upvalues: l_collect_0 (copy), l_shallowEqual_0 (copy), l_assign_0 (copy), l_keys_0 (copy)
    local v22 = l_collect_0(v18.activeFields, function(v19, v20) --[[ Line: 56 ]]
        -- upvalues: v18 (copy), l_shallowEqual_0 (ref)
        local v21 = v18:walk(v18.root, v19);
        if not l_shallowEqual_0(v20, v21) then
            return v19, v21;
        else
            return nil;
        end;
    end);
    l_assign_0(v18.activeFields, v22);
    local v23 = l_keys_0(v22);
    if #v23 > 0 then
        v18.onFieldsChanged(v23);
    end;
end;
v15.collect = function(v24, v25, v26, v27) --[[ Line: 73 ]] --[[ Name: collect ]]
    -- upvalues: l_collect_0 (copy), l_copy_0 (copy), l_insert_0 (copy), l_pretty_0 (copy)
    if typeof(v25) ~= "table" then
        return {};
    else
        return (l_collect_0(v25, function(v28, v29) --[[ Line: 77 ]]
            -- upvalues: l_copy_0 (ref), v27 (copy), l_insert_0 (ref), v26 (copy), v24 (copy), l_pretty_0 (ref)
            local v30 = typeof(v28) == "number" and v28 or tostring(v28);
            local v31 = l_copy_0(v27);
            l_insert_0(v31, v30);
            local v32 = typeof(v29) == "table" and v26 > 0 and v24:collect(v29, v26 - 1, v31) or {};
            return v30, {
                Name = v30, 
                Summary = l_pretty_0(v29, {
                    depth = 2, 
                    arrayLength = true
                }), 
                Path = v31, 
                Children = v32
            };
        end));
    end;
end;
v15.walk = function(v33, _, v35) --[[ Line: 98 ]] --[[ Name: walk ]]
    -- upvalues: l_reduce_0 (copy), v2 (copy), l_pretty_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 100 ]]
        -- upvalues: l_reduce_0 (ref), v35 (copy), v2 (ref), v33 (copy)
        return l_reduce_0(v35, function(v36, v37, v38) --[[ Line: 101 ]]
            -- upvalues: v2 (ref), v33 (ref)
            local v39 = v2(v36, v37);
            if v39 and v38 == 1 and v33.rootKey then
                return v39[v33.rootKey];
            else
                return v39;
            end;
        end, v33.root);
    end);
    if not l_status_0 then
        warn(("Cannot walk path %s: %s "):format(l_pretty_0(v35), l_result_0));
        l_result_0 = nil;
    end;
    return l_result_0;
end;
v15.setRoot = function(v42, v43) --[[ Line: 118 ]] --[[ Name: setRoot ]]
    v42.root = v43;
end;
v15.clear = function(v44) --[[ Line: 123 ]] --[[ Name: clear ]]
    v44.activeFields = {};
    v44:monitor();
end;
v15.addPath = function(v45, v46) --[[ Line: 130 ]] --[[ Name: addPath ]]
    -- upvalues: l_copy_0 (copy)
    local v47 = v45:walk(v45.root, v46);
    v45.activeFields[v46] = v47 and l_copy_0(v47) or {};
end;
v15.destroy = function(v48) --[[ Line: 137 ]] --[[ Name: destroy ]]
    v48.root = nil;
    v48.polling = false;
end;
return v15;