local v0 = require(script.Parent.Parent.Cryo);
local v1 = {};
v1.__index = v1;
v1.get = function(v2, v3) --[[ Line: 27 ]] --[[ Name: get ]]
    assert(type(v2) == "table", "state must be a table");
    assert(type(v3) == "string", "key must be a string");
    for _, v5 in ipairs(v2.routes) do
        if v5.key == v3 then
            return v5;
        end;
    end;
    return nil;
end;
v1.getAtIndex = function(v6, v7) --[[ Line: 41 ]] --[[ Name: getAtIndex ]]
    assert(type(v6) == "table", "state must be a table");
    assert(type(v7) == "number", "index must be a number");
    assert(v7 >= 0, "index must be non-negative");
    return v6.routes[v7];
end;
v1.getActiveRoute = function(v8) --[[ Line: 50 ]] --[[ Name: getActiveRoute ]]
    assert(type(v8) == "table", "state must be a table");
    local l_index_0 = v8.index;
    if l_index_0 <= 0 then
        return nil;
    else
        return v8.routes[l_index_0];
    end;
end;
v1.indexOf = function(v10, v11) --[[ Line: 62 ]] --[[ Name: indexOf ]]
    assert(type(v10) == "table", "state must be a table");
    assert(type(v11) == "string", "key must be a string");
    for v12, v13 in ipairs(v10.routes) do
        if v13.key == v11 then
            return v12;
        end;
    end;
    return nil;
end;
v1.has = function(v14, v15) --[[ Line: 76 ]] --[[ Name: has ]]
    assert(type(v14) == "table", "state must be a table");
    assert(type(v15) == "string", "key must be a string");
    for _, v17 in ipairs(v14.routes) do
        if v17.key == v15 then
            return true;
        end;
    end;
    return false;
end;
v1.push = function(v18, v19) --[[ Line: 90 ]] --[[ Name: push ]]
    -- upvalues: v1 (copy), v0 (copy)
    assert(type(v18) == "table", "state must be a table");
    assert(type(v19) == "table", "route must be a table");
    assert(v1.indexOf(v18, v19.key) == nil, string.format("route with key '%s' already exists", v19.key));
    local v20 = v0.List.join(v18.routes, {
        v19
    });
    return v0.Dictionary.join(v18, {
        index = #v20, 
        routes = v20
    });
end;
v1.pop = function(v21) --[[ Line: 106 ]] --[[ Name: pop ]]
    -- upvalues: v0 (copy)
    assert(type(v21) == "table", "state must be a table");
    if #v21.routes == 0 then
        return v21;
    else
        local v22 = v0.List.removeIndex(v21.routes, #v21.routes);
        return v0.Dictionary.join(v21, {
            index = #v22, 
            routes = v22
        });
    end;
end;
v1.jumpToIndex = function(v23, v24) --[[ Line: 122 ]] --[[ Name: jumpToIndex ]]
    -- upvalues: v0 (copy)
    assert(type(v23) == "table", "state must be a table");
    assert(type(v24) == "number", "index must be a number");
    if v24 == v23.index then
        return v23;
    else
        assert(v23.routes[v24] ~= nil, string.format("cannot jump to out-of-range index '%d'", v24));
        return v0.Dictionary.join(v23, {
            index = v24
        });
    end;
end;
v1.jumpTo = function(v25, v26) --[[ Line: 139 ]] --[[ Name: jumpTo ]]
    -- upvalues: v1 (copy)
    assert(type(v25) == "table", "state must be a table");
    assert(type(v26) == "string", "key must be a string");
    local v27 = v1.indexOf(v25, v26);
    return v1.jumpToIndex(v25, v27);
end;
v1.back = function(v28) --[[ Line: 148 ]] --[[ Name: back ]]
    -- upvalues: v1 (copy)
    assert(type(v28) == "table", "state must be a table");
    local v29 = v28.index - 1;
    if not v28.routes[v29] then
        return v28;
    else
        return v1.jumpToIndex(v28, v29);
    end;
end;
v1.forward = function(v30) --[[ Line: 160 ]] --[[ Name: forward ]]
    -- upvalues: v1 (copy)
    assert(type(v30) == "table", "state must be a table");
    local v31 = v30.index + 1;
    if not v30.routes[v31] then
        return v30;
    else
        return v1.jumpToIndex(v30, v31);
    end;
end;
v1.replaceAndPrune = function(v32, v33, v34) --[[ Line: 173 ]] --[[ Name: replaceAndPrune ]]
    -- upvalues: v1 (copy), v0 (copy)
    assert(type(v32) == "table", "state must be a table");
    assert(type(v33) == "string", "key must be a string");
    assert(type(v34) == "table", "route must be a table");
    local v35 = v1.indexOf(v32, v33);
    local v36 = v1.replaceAtIndex(v32, v35, v34);
    return v0.Dictionary.join(v36, {
        routes = {
            unpack(v36.routes, 1, v35)
        }
    });
end;
v1.replaceAt = function(v37, v38, v39, v40) --[[ Line: 189 ]] --[[ Name: replaceAt ]]
    -- upvalues: v1 (copy)
    assert(type(v37) == "table", "state must be a table");
    assert(type(v38) == "string", "key must be a string");
    assert(type(v39) == "table", "route must be a table");
    local v41 = true;
    if v40 ~= nil then
        v41 = type(v40) == "boolean";
    end;
    assert(v41, "preserveIndex must be nil or a boolean");
    local v42 = v1.indexOf(v37, v38);
    v41 = v40 and v37.index or v42;
    local v43 = v1.replaceAtIndex(v37, v42, v39);
    v43.index = v41;
    return v43;
end;
v1.replaceAtIndex = function(v44, v45, v46) --[[ Line: 205 ]] --[[ Name: replaceAtIndex ]]
    -- upvalues: v0 (copy)
    assert(type(v44) == "table", "state must be a table");
    assert(type(v45) == "number", "index must be a number");
    assert(type(v46) == "table", "route must be a table");
    assert(v44.routes[v45] ~= nil, string.format("index '%d' does not exist in route '%s'", v45, v46.key));
    if v44.routes[v45] == v46 and v45 == v44.index then
        return v44;
    else
        local v47 = v0.List.join(v44.routes);
        v47[v45] = v46;
        return v0.Dictionary.join(v44, {
            index = v45, 
            routes = v47
        });
    end;
end;
v1.reset = function(v48, v49, v50) --[[ Line: 229 ]] --[[ Name: reset ]]
    -- upvalues: v0 (copy)
    assert(type(v48) == "table", "state must be a table");
    local v51 = false;
    if type(v49) == "table" then
        v51 = #v49 > 0;
    end;
    assert(v51, "routes must be a list with at least one element");
    v51 = true;
    if v50 ~= nil then
        v51 = type(v50) == "number";
    end;
    assert(v51, "index must be a number or nil");
    local v52 = v50 or #v49 or v50;
    if #v48.routes == #v49 and v48.index == v52 then
        v51 = true;
        for v53 = 1, #v49 do
            if v48.routes[v53] ~= v49[v53] then
                v51 = false;
                break;
            end;
        end;
        if v51 then
            return v48;
        end;
    end;
    assert(v49[v52] ~= nil, string.format("cannot reset index '%d' that does not exist", v52));
    return v0.Dictionary.join(v48, {
        index = v52, 
        routes = v49
    });
end;
return v1;