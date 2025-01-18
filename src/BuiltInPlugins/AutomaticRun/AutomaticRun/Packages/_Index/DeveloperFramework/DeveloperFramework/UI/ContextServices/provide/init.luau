local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices.Context);
local v3 = require(l_Parent_0.Parent.Dash);
local l_iterable_0 = v3.iterable;
local l_join_0 = v3.join;
local l_collect_0 = v3.collect;
local l_filter_0 = v3.filter;
local l_forEach_0 = v3.forEach;
local l_insert_0 = table.insert;
local v10 = v1.PureComponent:extend("MultipleProvider");
local v11 = require(l_Parent_0.SharedFlags.getFFlagGiveContextProvidersKeys)();
v10.init = function(v12, v13) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: l_iterable_0 (copy), l_insert_0 (copy), l_collect_0 (copy), l_filter_0 (copy), l_forEach_0 (copy), v1 (copy), l_join_0 (copy), v2 (copy), v11 (copy)
    local v14 = l_iterable_0(v13.ContextItems);
    local v15 = {};
    local v16 = {};
    for v17, v18 in v14 do
        l_insert_0(v15, v18);
        v16[#v15] = v17;
    end;
    v12.state = {
        count = 0
    };
    v12.connections = {};
    local v21 = l_collect_0(v15, function(v19, v20) --[[ Line: 58 ]]
        -- upvalues: v16 (copy)
        assert(v20.Key, string.format("provide: item at %s was not a ContextItem.", (tostring(v16[v19]))));
        return v20.Key, v20;
    end);
    v12.filteredItems = l_filter_0(v15, function(v22) --[[ Line: 63 ]]
        -- upvalues: v21 (copy)
        return v21[v22.Key] == v22;
    end);
    l_forEach_0(v12.filteredItems, function(v23) --[[ Line: 66 ]]
        -- upvalues: v12 (copy)
        local l_Key_0 = v23.Key;
        v12.state[l_Key_0] = v23;
    end);
    v12.onRender = function(v25) --[[ Line: 70 ]]
        -- upvalues: v12 (copy), v1 (ref), l_join_0 (ref), v2 (ref), l_forEach_0 (ref), v11 (ref)
        local l_props_0 = v12.props;
        local v27 = l_props_0[v1.Children];
        local v28 = l_join_0(v25, v12.state);
        local v29 = v1.createElement(v2.Provider, {
            key = "Provider", 
            value = v28
        }, v27);
        l_forEach_0(v12.filteredItems, function(v30) --[[ Line: 78 ]]
            -- upvalues: l_props_0 (copy), v29 (ref), v11 (ref)
            if l_props_0.Roact17 or not l_props_0.Roact17 and v30.getProvider then
                v29 = v30:getProvider({
                    v29
                });
                if v11 and v29.key == nil then
                    v29.key = v30.Key;
                end;
            end;
        end);
        return v29;
    end;
end;
v10.didMount = function(v31) --[[ Line: 90 ]] --[[ Name: didMount ]]
    -- upvalues: l_forEach_0 (copy)
    l_forEach_0(v31.filteredItems, function(v32) --[[ Line: 91 ]]
        -- upvalues: v31 (copy)
        local l_Key_1 = v32.Key;
        v31.state[l_Key_1] = v32;
        v31:addConnection(l_Key_1, v32);
    end);
end;
v10.addConnection = function(v34, v35, v36) --[[ Line: 98 ]] --[[ Name: addConnection ]]
    local v37 = v36:getSignal();
    if v37 then
        v34.connections[v35] = v37:Connect(function(_) --[[ Line: 101 ]]
            -- upvalues: v34 (copy)
            v34:setState({
                count = v34.state.count + 1
            });
        end);
    end;
end;
v10.render = function(v39) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Consumer, {
        render = v39.onRender
    });
end;
v10.willUnmount = function(v40) --[[ Line: 115 ]] --[[ Name: willUnmount ]]
    for _, v42 in pairs(v40.connections) do
        v42:Disconnect();
    end;
end;
return function(v43, v44, v45) --[[ Line: 122 ]] --[[ Name: provide ]]
    -- upvalues: v1 (copy), v10 (copy)
    assert(v43, "provide: Expected a ContextItems list to provide.");
    assert(v44, "provide: Expected a table of children.");
    return v1.createElement(v10, {
        ContextItems = v43, 
        Roact17 = v45
    }, v44);
end;