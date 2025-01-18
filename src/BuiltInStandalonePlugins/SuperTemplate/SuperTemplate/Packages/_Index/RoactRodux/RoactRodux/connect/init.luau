local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.shallowEqual);
local v2 = require(script.Parent.join);
local v3 = require(script.Parent.StoreContext);
local _ = require(script.Parent.types);
local function _(v5, v6) --[[ Line: 27 ]] --[[ Name: formatMessage ]]
    return table.concat(v5, "\n"):format(unpack(v6 or {}));
end;
local function v8() --[[ Line: 31 ]] --[[ Name: noop ]]
    return nil;
end;
local function _(v9) --[[ Line: 38 ]] --[[ Name: isCallable ]]
    local v10 = true;
    if type(v9) ~= "function" then
        v10 = type(v9) == "table" and (getmetatable(v9) and getmetatable(v9).__call ~= nil or false);
    end;
    return v10;
end;
local function _(v12) --[[ Line: 53 ]] --[[ Name: makeStateUpdater ]]
    -- upvalues: v2 (copy)
    return function(v13, v14, v15) --[[ Line: 54 ]]
        -- upvalues: v12 (copy), v2 (ref)
        if v15 == nil then
            v15 = v14.mapStateToProps(v12:getState(), v13);
        end;
        local v16 = v2(v13, v15, v14.mappedStoreDispatch);
        return {
            mappedStoreState = v15, 
            propsForChild = v16
        };
    end;
end;
return function(v18, v19) --[[ Line: 77 ]] --[[ Name: connect ]]
    -- upvalues: v8 (copy), v0 (copy), v2 (copy), v1 (copy), v3 (copy)
    if v18 ~= nil then
        local l_v18_0 = v18;
        local v21 = true;
        if type(l_v18_0) ~= "function" then
            v21 = type(l_v18_0) == "table" and (getmetatable(l_v18_0) and getmetatable(l_v18_0).__call ~= nil or false);
        end;
        assert(v21, "mapStateToProps must be a function or nil!");
    else
        v18 = v8;
    end;
    local v22 = typeof(v19);
    if v19 ~= nil then
        local v23 = true;
        if v22 ~= "function" then
            v23 = v22 == "table";
        end;
        assert(v23, "mapDispatchToProps must be a function, table, or nil!");
    else
        v19 = v8;
    end;
    return function(v24) --[[ Line: 104 ]]
        -- upvalues: v0 (ref), v18 (ref), v19 (ref), v22 (copy), v2 (ref), v1 (ref), v3 (ref)
        if v24 == nil then
            local v25 = debug.traceback();
            local v26 = table.concat({
                "connect returns a function that must be passed a component.", 
                "Check the connection at:", 
                "%s"
            }, "\n"):format(unpack({
                v25
            } or {}));
            error(v26, 2);
        end;
        local v27 = ("RoduxConnection(%s)"):format((tostring(v24)));
        local v28 = v0.Component:extend(v27);
        v28.getDerivedStateFromProps = function(v29, v30) --[[ Line: 122 ]] --[[ Name: getDerivedStateFromProps ]]
            if v30.stateUpdater ~= nil then
                return v30.stateUpdater(v29.innerProps, v30);
            else
                return nil;
            end;
        end;
        v28.init = function(v31, v32) --[[ Line: 129 ]] --[[ Name: init ]]
            -- upvalues: v24 (copy), v18 (ref), v19 (ref), v22 (ref), v2 (ref)
            v31.store = v32.store;
            if v31.store == nil then
                local v33 = {
                    "Cannot initialize Roact-Rodux connection without being a descendent of StoreProvider!", 
                    "Tried to wrap component %q", 
                    "Make sure there is a StoreProvider above this component in the tree."
                };
                local v34 = {
                    (tostring(v24))
                };
                local v35 = table.concat(v33, "\n"):format(unpack(v34 or {}));
                error(v35);
            end;
            local v36 = v31.store:getState();
            local l_v18_1 = v18;
            local v38 = l_v18_1(v36, v31.props.innerProps);
            local l_v38_0 = v38;
            local v40 = true;
            if type(l_v38_0) ~= "function" then
                v40 = type(l_v38_0) == "table" and (getmetatable(l_v38_0) and getmetatable(l_v38_0).__call ~= nil or false);
            end;
            if v40 then
                l_v18_1 = v38;
                v38 = l_v18_1(v36, v31.props.innerProps);
            end;
            if v38 ~= nil and typeof(v38) ~= "table" then
                l_v38_0 = {
                    "mapStateToProps must either return a table, or return another function that returns a table.", 
                    "Instead, it returned %q, which is of type %s."
                };
                local v41 = {
                    tostring(v38), 
                    (typeof(v38))
                };
                v40 = table.concat(l_v38_0, "\n"):format(unpack(v41 or {}));
                error(v40);
            end;
            v40 = function(...) --[[ Line: 171 ]] --[[ Name: dispatch ]]
                -- upvalues: v31 (copy)
                return v31.store:dispatch(...);
            end;
            l_v38_0 = nil;
            local l_v19_0 = v19;
            local v43 = true;
            if type(l_v19_0) ~= "function" then
                v43 = type(l_v19_0) == "table" and (getmetatable(l_v19_0) and getmetatable(l_v19_0).__call ~= nil or false);
            end;
            if v43 then
                l_v38_0 = v19(v40);
            elseif v22 == "table" then
                l_v38_0 = {};
                for v44, v45 in pairs(v19) do
                    local v46 = true;
                    if type(v45) ~= "function" then
                        v46 = type(v45) == "table" and (getmetatable(v45) and getmetatable(v45).__call ~= nil or false);
                    end;
                    assert(v46, "mapDispatchToProps must contain function values");
                    l_v38_0[v44] = function(...) --[[ Line: 186 ]]
                        -- upvalues: v40 (copy), v45 (copy)
                        v40(v45(...));
                    end;
                end;
            end;
            l_v19_0 = v31.store;
            local l_l_v19_0_0 = l_v19_0 --[[ copy: 8 -> 14 ]];
            v43 = function(v48, v49, v50) --[[ Line: 54 ]]
                -- upvalues: l_l_v19_0_0 (copy), v2 (ref)
                if v50 == nil then
                    v50 = v49.mapStateToProps(l_l_v19_0_0:getState(), v48);
                end;
                local v51 = v2(v48, v50, v49.mappedStoreDispatch);
                return {
                    mappedStoreState = v50, 
                    propsForChild = v51
                };
            end;
            v31.state = {
                stateUpdater = v43, 
                mapStateToProps = l_v18_1, 
                mappedStoreDispatch = l_v38_0, 
                propsForChild = nil
            };
            l_v19_0 = v43(v31.props.innerProps, v31.state, v38);
            for v52, v53 in pairs(l_v19_0) do
                v31.state[v52] = v53;
            end;
        end;
        v28.didMount = function(v54) --[[ Line: 219 ]] --[[ Name: didMount ]]
            -- upvalues: v1 (ref)
            local function v59(v55) --[[ Line: 220 ]]
                -- upvalues: v54 (copy), v1 (ref)
                v54:setState(function(v56, v57) --[[ Line: 221 ]]
                    -- upvalues: v55 (copy), v1 (ref)
                    local v58 = v56.mapStateToProps(v55, v57.innerProps);
                    if v1(v58, v56.mappedStoreState) then
                        return nil;
                    else
                        return v56.stateUpdater(v57.innerProps, v56, v58);
                    end;
                end);
            end;
            local v60 = v54.store:getState();
            v54:setState(function(v61, v62) --[[ Line: 221 ]]
                -- upvalues: v60 (copy), v1 (ref)
                local v63 = v61.mapStateToProps(v60, v62.innerProps);
                if v1(v63, v61.mappedStoreState) then
                    return nil;
                else
                    return v61.stateUpdater(v62.innerProps, v61, v63);
                end;
            end);
            v54.storeChangedConnection = v54.store.changed:connect(v59);
        end;
        v28.willUnmount = function(v64) --[[ Line: 243 ]] --[[ Name: willUnmount ]]
            if v64.storeChangedConnection then
                v64.storeChangedConnection:disconnect();
                v64.storeChangedConnection = nil;
            end;
        end;
        v28.render = function(v65) --[[ Line: 250 ]] --[[ Name: render ]]
            -- upvalues: v0 (ref), v24 (copy)
            return v0.createElement(v24, v65.state.propsForChild);
        end;
        local v66 = v0.Component:extend(v27);
        v66.render = function(v67) --[[ Line: 256 ]] --[[ Name: render ]]
            -- upvalues: v0 (ref), v3 (ref), v28 (copy)
            return v0.createElement(v3.Consumer, {
                render = function(v68) --[[ Line: 258 ]] --[[ Name: render ]]
                    -- upvalues: v0 (ref), v28 (ref), v67 (copy)
                    return v0.createElement(v28, {
                        innerProps = v67.props, 
                        store = v68
                    });
                end
            });
        end;
        return v66;
    end;
end;