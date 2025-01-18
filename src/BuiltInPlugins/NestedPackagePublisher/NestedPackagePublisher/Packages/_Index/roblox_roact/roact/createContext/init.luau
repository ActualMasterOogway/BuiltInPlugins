local v0 = require(script.Parent.Symbol);
local v1 = require(script.Parent.createFragment);
local v2 = require(script.Parent.createSignal);
local v3 = require(script.Parent.PropMarkers.Children);
local v4 = require(script.Parent.Component);
local function _(v5) --[[ Line: 10 ]] --[[ Name: createContextEntry ]]
    -- upvalues: v2 (copy)
    return {
        value = v5, 
        onUpdate = v2()
    };
end;
local function v16(v7) --[[ Line: 17 ]] --[[ Name: createProvider ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy), v3 (copy)
    local v8 = v4:extend("Provider");
    v8.init = function(v9, v10) --[[ Line: 20 ]] --[[ Name: init ]]
        -- upvalues: v2 (ref), v7 (copy)
        v9.contextEntry = {
            value = v10.value, 
            onUpdate = v2()
        };
        v9:__addContext(v7.key, v9.contextEntry);
    end;
    v8.willUpdate = function(v11, v12) --[[ Line: 25 ]] --[[ Name: willUpdate ]]
        if v12.value ~= v11.props.value then
            v11.contextEntry.value = v12.value;
        end;
    end;
    v8.didUpdate = function(v13, v14) --[[ Line: 36 ]] --[[ Name: didUpdate ]]
        if v14.value ~= v13.props.value then
            v13.contextEntry.onUpdate:fire(v13.props.value);
        end;
    end;
    v8.render = function(v15) --[[ Line: 51 ]] --[[ Name: render ]]
        -- upvalues: v1 (ref), v3 (ref)
        return v1(v15.props[v3]);
    end;
    return v8;
end;
local function v28(v17) --[[ Line: 58 ]] --[[ Name: createConsumer ]]
    -- upvalues: v4 (copy)
    local v18 = v4:extend("Consumer");
    v18.validateProps = function(v19) --[[ Line: 61 ]] --[[ Name: validateProps ]]
        if type(v19.render) ~= "function" then
            return false, "Consumer expects a `render` function";
        else
            return true;
        end;
    end;
    v18.init = function(v20, _) --[[ Line: 69 ]] --[[ Name: init ]]
        -- upvalues: v17 (copy)
        v20.contextEntry = v20:__getContext(v17.key);
    end;
    v18.render = function(v22) --[[ Line: 75 ]] --[[ Name: render ]]
        -- upvalues: v17 (copy)
        local v23 = nil;
        v23 = if v22.contextEntry ~= nil then v22.contextEntry.value else v17.defaultValue;
        return v22.props.render(v23);
    end;
    v18.didUpdate = function(v24) --[[ Line: 90 ]] --[[ Name: didUpdate ]]
        if v24.contextEntry ~= nil then
            v24.lastValue = v24.contextEntry.value;
        end;
    end;
    v18.didMount = function(v25) --[[ Line: 99 ]] --[[ Name: didMount ]]
        if v25.contextEntry ~= nil then
            v25.disconnect = v25.contextEntry.onUpdate:subscribe(function(v26) --[[ Line: 110 ]]
                -- upvalues: v25 (copy)
                if v26 ~= v25.lastValue then
                    v25:setState({});
                end;
            end);
        end;
    end;
    v18.willUnmount = function(v27) --[[ Line: 119 ]] --[[ Name: willUnmount ]]
        if v27.disconnect ~= nil then
            v27.disconnect();
        end;
    end;
    return v18;
end;
local v29 = {};
v29.__index = v29;
v29.new = function(v30) --[[ Line: 131 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v29 (copy)
    return (setmetatable({
        defaultValue = v30, 
        key = v0.named("ContextKey")
    }, v29));
end;
v29.__tostring = function(_) --[[ Line: 138 ]] --[[ Name: __tostring ]]
    return "RoactContext";
end;
return function(v32) --[[ Line: 142 ]] --[[ Name: createContext ]]
    -- upvalues: v29 (copy), v16 (copy), v28 (copy)
    local v33 = v29.new(v32);
    return {
        Provider = v16(v33), 
        Consumer = v28(v33)
    };
end;