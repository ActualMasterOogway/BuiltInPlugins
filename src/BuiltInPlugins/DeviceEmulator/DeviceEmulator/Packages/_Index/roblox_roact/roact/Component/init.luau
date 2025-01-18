local v0 = require(script.Parent.assign);
local v1 = require(script.Parent.ComponentLifecyclePhase);
local v2 = require(script.Parent.Type);
local v3 = require(script.Parent.Symbol);
local v4 = require(script.Parent.invalidSetStateMessages);
local v5 = require(script.Parent.internalAssert);
local v6 = require(script.Parent.GlobalConfig).get();
local v7 = v3.named("InternalData");
local v9 = {
    __tostring = function(v8) --[[ Line: 29 ]] --[[ Name: __tostring ]]
        return v8.__componentName;
    end
};
local v10 = {};
setmetatable(v10, v9);
v10[v2] = v2.StatefulComponentClass;
v10.__index = v10;
v10.__componentName = "Component";
v10.extend = function(v11, v12) --[[ Line: 45 ]] --[[ Name: extend ]]
    -- upvalues: v6 (copy), v2 (copy), v9 (copy)
    if v6.typeChecks then
        assert(v2.of(v11) == v2.StatefulComponentClass, "Invalid `self` argument to `extend`.");
        assert(typeof(v12) == "string", "Component class name must be a string");
    end;
    local v13 = {};
    for v14, v15 in pairs(v11) do
        if v14 ~= "extend" then
            v13[v14] = v15;
        end;
    end;
    v13[v2] = v2.StatefulComponentClass;
    v13.__index = v13;
    v13.__componentName = v12;
    setmetatable(v13, v9);
    return v13;
end;
v10.__getDerivedState = function(v16, v17, v18) --[[ Line: 71 ]] --[[ Name: __getDerivedState ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v7 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v16) == v2.StatefulComponentInstance, "Invalid use of `__getDerivedState`");
    end;
    local l_componentClass_0 = v16[v7].componentClass;
    if l_componentClass_0.getDerivedStateFromProps ~= nil then
        local v20 = l_componentClass_0.getDerivedStateFromProps(v17, v18);
        if v20 ~= nil then
            if v6.typeChecks then
                assert(typeof(v20) == "table", "getDerivedStateFromProps must return a table!");
            end;
            return v20;
        end;
    end;
    return nil;
end;
v10.setState = function(v21, v22) --[[ Line: 94 ]] --[[ Name: setState ]]
    -- upvalues: v6 (copy), v2 (copy), v7 (copy), v1 (copy), v4 (copy), v0 (copy)
    if v6.typeChecks then
        assert(v2.of(v21) == v2.StatefulComponentInstance, "Invalid `self` argument to `extend`.");
    end;
    local v23 = v21[v7];
    local l_lifecyclePhase_0 = v23.lifecyclePhase;
    if l_lifecyclePhase_0 == v1.ShouldUpdate or l_lifecyclePhase_0 == v1.WillUpdate or l_lifecyclePhase_0 == v1.Render or l_lifecyclePhase_0 == v1.WillUnmount then
        local v25 = v4[v23.lifecyclePhase]:format((tostring(v23.componentClass)));
        error(v25, 2);
    end;
    local l_pendingState_0 = v23.pendingState;
    local v27 = nil;
    if typeof(v22) == "function" then
        v27 = v22(l_pendingState_0 or v21.state, v21.props);
        if v27 == nil then
            return;
        end;
    elseif typeof(v22) == "table" then
        v27 = v22;
    else
        error("Invalid argument to setState, expected function or table", 2);
    end;
    local v28 = nil;
    v28 = if l_pendingState_0 ~= nil then v0(l_pendingState_0, v27) else v0({}, v21.state, v27);
    if l_lifecyclePhase_0 == v1.Init then
        local v29 = v21:__getDerivedState(v21.props, v28);
        v21.state = v0(v28, v29);
        return;
    elseif l_lifecyclePhase_0 == v1.DidMount or l_lifecyclePhase_0 == v1.DidUpdate or l_lifecyclePhase_0 == v1.ReconcileChildren then
        local v30 = v21:__getDerivedState(v21.props, v28);
        v23.pendingState = v0(v28, v30);
        return;
    elseif l_lifecyclePhase_0 == v1.Idle then
        v21:__update(nil, v28);
        return;
    else
        local v31 = v4.default:format((tostring(v23.componentClass)));
        error(v31, 2);
        return;
    end;
end;
v10.getElementTraceback = function(v32) --[[ Line: 178 ]] --[[ Name: getElementTraceback ]]
    -- upvalues: v7 (copy)
    return v32[v7].virtualNode.currentElement.source;
end;
v10.render = function(v33) --[[ Line: 189 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy)
    local v34 = ("The component %q is missing the `render` method.\n`render` must be defined when creating a Roact component!"):format((tostring(v33[v7].componentClass)));
    error(v34, 0);
end;
v10.__getContext = function(v35, v36) --[[ Line: 203 ]] --[[ Name: __getContext ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v7 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v35) == v2.StatefulComponentInstance, "Invalid use of `__getContext`");
        v5(v36 ~= nil, "Context key cannot be nil");
    end;
    return v35[v7].virtualNode.context[v36];
end;
v10.__addContext = function(v37, v38, v39) --[[ Line: 219 ]] --[[ Name: __addContext ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v7 (copy), v0 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v37) == v2.StatefulComponentInstance, "Invalid use of `__addContext`");
    end;
    local l_virtualNode_0 = v37[v7].virtualNode;
    if l_virtualNode_0.originalContext == nil then
        l_virtualNode_0.originalContext = l_virtualNode_0.context;
    end;
    local l_context_0 = l_virtualNode_0.context;
    l_virtualNode_0.context = v0({}, l_context_0, {
        [v38] = v39
    });
end;
v10.__validateProps = function(v42, v43) --[[ Line: 246 ]] --[[ Name: __validateProps ]]
    -- upvalues: v6 (copy), v7 (copy)
    if not v6.propValidation then
        return;
    else
        local l_validateProps_0 = v42[v7].componentClass.validateProps;
        if l_validateProps_0 == nil then
            return;
        else
            if typeof(l_validateProps_0) ~= "function" then
                error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(l_validateProps_0), v42.__componentName));
            end;
            local v45, v46 = l_validateProps_0(v43);
            if not v45 then
                v46 = v46 or "<Validator function did not supply a message>";
                error(("Property validation failed in %s: %s\n\n%s"):format(v42.__componentName, tostring(v46), v42:getElementTraceback() or "<enable element tracebacks>"), 0);
            end;
            return;
        end;
    end;
end;
v10.__mount = function(v47, v48, v49) --[[ Line: 280 ]] --[[ Name: __mount ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v1 (copy), v7 (copy), v0 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v47) == v2.StatefulComponentClass, "Invalid use of `__mount`");
        v5(v2.of(v49) == v2.VirtualNode, "Expected arg #2 to be of type VirtualNode");
    end;
    local l_currentElement_0 = v49.currentElement;
    local l_hostParent_0 = v49.hostParent;
    local v52 = {
        reconciler = v48, 
        virtualNode = v49, 
        componentClass = v47, 
        lifecyclePhase = v1.Init
    };
    local v53 = {
        [v2] = v2.StatefulComponentInstance, 
        [v7] = v52
    };
    setmetatable(v53, v47);
    v49.instance = v53;
    local l_props_0 = l_currentElement_0.props;
    if v47.defaultProps ~= nil then
        l_props_0 = v0({}, v47.defaultProps, l_props_0);
    end;
    v53:__validateProps(l_props_0);
    v53.props = l_props_0;
    v53._context = v0({}, v49.legacyContext);
    v53.state = v0({}, v53:__getDerivedState(v53.props, {}));
    if v53.init ~= nil then
        v53:init(v53.props);
        v0(v53.state, v53:__getDerivedState(v53.props, v53.state));
    end;
    v49.legacyContext = v53._context;
    v52.lifecyclePhase = v1.Render;
    local v55 = v53:render();
    v52.lifecyclePhase = v1.ReconcileChildren;
    v48.updateVirtualNodeWithRenderResult(v49, l_hostParent_0, v55);
    if v53.didMount ~= nil then
        v52.lifecyclePhase = v1.DidMount;
        v53:didMount();
    end;
    if v52.pendingState ~= nil then
        v53:__update(nil, nil);
    end;
    v52.lifecyclePhase = v1.Idle;
end;
v10.__unmount = function(v56) --[[ Line: 353 ]] --[[ Name: __unmount ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v7 (copy), v1 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v56) == v2.StatefulComponentInstance, "Invalid use of `__unmount`");
    end;
    local v57 = v56[v7];
    local l_virtualNode_1 = v57.virtualNode;
    local l_reconciler_0 = v57.reconciler;
    if v56.willUnmount ~= nil then
        v57.lifecyclePhase = v1.WillUnmount;
        v56:willUnmount();
    end;
    for _, v61 in pairs(l_virtualNode_1.children) do
        l_reconciler_0.unmountVirtualNode(v61);
    end;
end;
v10.__update = function(v62, v63, v64) --[[ Line: 378 ]] --[[ Name: __update ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v7 (copy), v0 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v62) == v2.StatefulComponentInstance, "Invalid use of `__update`");
        local l_v5_0 = v5;
        local v66 = true;
        if v2.of(v63) ~= v2.Element then
            v66 = v63 == nil;
        end;
        l_v5_0(v66, "Expected arg #1 to be of type Element or nil");
        l_v5_0 = v5;
        v66 = true;
        if typeof(v64) ~= "table" then
            v66 = v64 == nil;
        end;
        l_v5_0(v66, "Expected arg #2 to be of type table or nil");
    end;
    local v67 = v62[v7];
    local l_componentClass_1 = v67.componentClass;
    local l_props_1 = v62.props;
    if v63 ~= nil then
        l_props_1 = v63.props;
        if l_componentClass_1.defaultProps ~= nil then
            l_props_1 = v0({}, l_componentClass_1.defaultProps, l_props_1);
        end;
        v62:__validateProps(l_props_1);
    end;
    local v70 = 0;
    while true do
        local v71 = nil;
        local v72 = nil;
        if v67.pendingState ~= nil then
            v72 = v67.pendingState;
            v67.pendingState = nil;
        end;
        if v64 ~= nil or l_props_1 ~= v62.props then
            v71 = if v72 == nil then v64 or v62.state else v0(v72, v64);
            local v73 = v62:__getDerivedState(l_props_1, v71);
            if v73 ~= nil then
                v71 = v0({}, v71, v73);
            end;
            v64 = nil;
        else
            v71 = v72;
        end;
        if not v62:__resolveUpdate(l_props_1, v71) then
            return false;
        else
            v70 = v70 + 1;
            if v70 > 100 then
                error(("The component %q has reached the setState update recursion limit.\nWhen using `setState` in `didUpdate`, make sure that it won't repeat infinitely!"):format((tostring(v67.componentClass))), 3);
            end;
            if v67.pendingState == nil then
                return true;
            end;
        end;
    end;
end;
v10.__resolveUpdate = function(v74, v75, v76) --[[ Line: 455 ]] --[[ Name: __resolveUpdate ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v7 (copy), v1 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v74) == v2.StatefulComponentInstance, "Invalid use of `__resolveUpdate`");
    end;
    local v77 = v74[v7];
    local l_virtualNode_2 = v77.virtualNode;
    local l_reconciler_1 = v77.reconciler;
    local l_props_2 = v74.props;
    local l_state_0 = v74.state;
    if v75 == nil then
        v75 = l_props_2;
    end;
    if v76 == nil then
        v76 = l_state_0;
    end;
    if v74.shouldUpdate ~= nil then
        v77.lifecyclePhase = v1.ShouldUpdate;
        if not v74:shouldUpdate(v75, v76) then
            v77.lifecyclePhase = v1.Idle;
            return false;
        end;
    end;
    if v74.willUpdate ~= nil then
        v77.lifecyclePhase = v1.WillUpdate;
        v74:willUpdate(v75, v76);
    end;
    v77.lifecyclePhase = v1.Render;
    v74.props = v75;
    v74.state = v76;
    local v82 = l_virtualNode_2.instance:render();
    v77.lifecyclePhase = v1.ReconcileChildren;
    l_reconciler_1.updateVirtualNodeWithRenderResult(l_virtualNode_2, l_virtualNode_2.hostParent, v82);
    if v74.didUpdate ~= nil then
        v77.lifecyclePhase = v1.DidUpdate;
        v74:didUpdate(l_props_2, l_state_0);
    end;
    v77.lifecyclePhase = v1.Idle;
    return true;
end;
return v10;