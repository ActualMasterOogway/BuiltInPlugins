local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.getStore);
local v2 = require(script.Parent.shallowEqual);
local v3 = require(script.Parent.join);
local v4 = require(script.Parent.TempConfig);
local function _(v5, v6) --[[ Line: 11 ]] --[[ Name: formatMessage ]]
    return table.concat(v5, "\n"):format(unpack(v6 or {}));
end;
local function v8() --[[ Line: 15 ]] --[[ Name: noop ]]
    return nil;
end;
local function _(v9) --[[ Line: 28 ]] --[[ Name: makeStateUpdater ]]
    -- upvalues: v3 (copy)
    return function(v10, v11, v12) --[[ Line: 29 ]]
        -- upvalues: v9 (copy), v3 (ref)
        if v12 == nil then
            v12 = v11.mapStateToProps(v9:getState(), v10);
        end;
        local v13 = v3(v10, v12, v11.mappedStoreDispatch);
        return {
            mappedStoreState = v12, 
            propsForChild = v13
        };
    end;
end;
return function(v15, v16) --[[ Line: 52 ]] --[[ Name: connect ]]
    -- upvalues: v8 (copy), v0 (copy), v2 (copy), v1 (copy), v3 (copy), v4 (copy)
    local v17 = debug.traceback();
    if v15 ~= nil then
        assert(typeof(v15) == "function", "mapStateToProps must be a function or nil!");
    else
        v15 = v8;
    end;
    if v16 ~= nil then
        assert(typeof(v16) == "function", "mapDispatchToProps must be a function or nil!");
    else
        v16 = v8;
    end;
    return function(v18) --[[ Line: 67 ]]
        -- upvalues: v17 (copy), v0 (ref), v2 (ref), v1 (ref), v15 (ref), v16 (ref), v3 (ref), v4 (ref)
        if v18 == nil then
            local v19 = {
                "connect returns a function that must be passed a component.", 
                "Check the connection at:", 
                "%s"
            };
            local v20 = {
                v17
            };
            local v21 = table.concat(v19, "\n"):format(unpack(v20 or {}));
            error(v21, 2);
        end;
        local v22 = ("RoduxConnection(%s)"):format((tostring(v18)));
        local v23 = v0.Component:extend(v22);
        v23.getDerivedStateFromProps = function(v24, v25) --[[ Line: 84 ]] --[[ Name: getDerivedStateFromProps ]]
            if v25.stateUpdater ~= nil then
                return v25.stateUpdater(v24, v25);
            else
                return;
            end;
        end;
        v23.createStoreConnection = function(v26) --[[ Line: 90 ]] --[[ Name: createStoreConnection ]]
            -- upvalues: v2 (ref)
            v26.storeChangedConnection = v26.store.changed:connect(function(v27) --[[ Line: 91 ]]
                -- upvalues: v26 (copy), v2 (ref)
                v26:setState(function(v28, v29) --[[ Line: 92 ]]
                    -- upvalues: v27 (copy), v2 (ref)
                    local v30 = v28.mapStateToProps(v27, v29);
                    if v2(v30, v28.mappedStoreState) then
                        return nil;
                    else
                        return v28.stateUpdater(v29, v28, v30);
                    end;
                end);
            end);
        end;
        v23.init = function(v31) --[[ Line: 107 ]] --[[ Name: init ]]
            -- upvalues: v1 (ref), v18 (copy), v15 (ref), v16 (ref), v3 (ref), v4 (ref)
            v31.store = v1(v31);
            if v31.store == nil then
                local v32 = {
                    "Cannot initialize Roact-Rodux connection without being a descendent of StoreProvider!", 
                    "Tried to wrap component %q", 
                    "Make sure there is a StoreProvider above this component in the tree."
                };
                local v33 = {
                    (tostring(v18))
                };
                local v34 = table.concat(v32, "\n"):format(unpack(v33 or {}));
                error(v34);
            end;
            local v35 = v31.store:getState();
            local l_v15_0 = v15;
            local v37 = l_v15_0(v35, v31.props);
            if typeof(v37) == "function" then
                l_v15_0 = v37;
                v37 = l_v15_0(v35, v31.props);
            end;
            if v37 ~= nil and typeof(v37) ~= "table" then
                local v38 = {
                    "mapStateToProps must either return a table, or return another function that returns a table.", 
                    "Instead, it returned %q, which is of type %s."
                };
                local v39 = {
                    tostring(v37), 
                    (typeof(v37))
                };
                local v40 = table.concat(v38, "\n"):format(unpack(v39 or {}));
                error(v40);
            end;
            local v41 = v16(function(...) --[[ Line: 148 ]]
                -- upvalues: v31 (copy)
                return v31.store:dispatch(...);
            end);
            local l_store_0 = v31.store;
            local l_l_store_0_0 = l_store_0 --[[ copy: 6 -> 12 ]];
            local function v48(v44, v45, v46) --[[ Line: 29 ]]
                -- upvalues: l_l_store_0_0 (copy), v3 (ref)
                if v46 == nil then
                    v46 = v45.mapStateToProps(l_l_store_0_0:getState(), v44);
                end;
                local v47 = v3(v44, v46, v45.mappedStoreDispatch);
                return {
                    mappedStoreState = v46, 
                    propsForChild = v47
                };
            end;
            v31.state = {
                stateUpdater = v48, 
                mapStateToProps = l_v15_0, 
                mappedStoreDispatch = v41, 
                propsForChild = nil
            };
            l_store_0 = v48(v31.props, v31.state, v37);
            for v49, v50 in pairs(l_store_0) do
                v31.state[v49] = v50;
            end;
            if v4.newConnectionOrder then
                v31:createStoreConnection();
            end;
        end;
        v23.didMount = function(v51) --[[ Line: 183 ]] --[[ Name: didMount ]]
            -- upvalues: v4 (ref)
            if not v4.newConnectionOrder then
                v51:createStoreConnection();
            end;
        end;
        v23.willUnmount = function(v52) --[[ Line: 189 ]] --[[ Name: willUnmount ]]
            v52.storeChangedConnection:disconnect();
        end;
        v23.render = function(v53) --[[ Line: 193 ]] --[[ Name: render ]]
            -- upvalues: v0 (ref), v18 (copy)
            return v0.createElement(v18, v53.state.propsForChild);
        end;
        return v23;
    end;
end;