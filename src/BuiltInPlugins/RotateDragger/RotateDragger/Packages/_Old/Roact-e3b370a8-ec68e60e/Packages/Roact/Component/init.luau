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
v10.__validateProps = function(v35, v36) --[[ Line: 206 ]] --[[ Name: __validateProps ]]
    -- upvalues: v6 (copy), v7 (copy)
    if not v6.propValidation then
        return;
    else
        local l_validateProps_0 = v35[v7].componentClass.validateProps;
        if l_validateProps_0 == nil then
            return;
        else
            if typeof(l_validateProps_0) ~= "function" then
                error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(l_validateProps_0), v35.__componentName));
            end;
            local v38, v39 = l_validateProps_0(v36);
            if not v38 then
                v39 = v39 or "<Validator function did not supply a message>";
                error(("Property validation failed: %s\n\n%s"):format(tostring(v39), v35:getElementTraceback() or "<enable element tracebacks>"), 0);
            end;
            return;
        end;
    end;
end;
v10.__mount = function(v40, v41, v42) --[[ Line: 239 ]] --[[ Name: __mount ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v1 (copy), v7 (copy), v0 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v40) == v2.StatefulComponentClass, "Invalid use of `__mount`");
        v5(v2.of(v42) == v2.VirtualNode, "Expected arg #2 to be of type VirtualNode");
    end;
    local l_currentElement_0 = v42.currentElement;
    local l_hostParent_0 = v42.hostParent;
    local v45 = {
        reconciler = v41, 
        virtualNode = v42, 
        componentClass = v40, 
        lifecyclePhase = v1.Init
    };
    local v46 = {
        [v2] = v2.StatefulComponentInstance, 
        [v7] = v45
    };
    setmetatable(v46, v40);
    v42.instance = v46;
    local l_props_0 = l_currentElement_0.props;
    if v40.defaultProps ~= nil then
        l_props_0 = v0({}, v40.defaultProps, l_props_0);
    end;
    v46:__validateProps(l_props_0);
    v46.props = l_props_0;
    v46._context = v0({}, v42.context);
    v46.state = v0({}, v46:__getDerivedState(v46.props, {}));
    if v46.init ~= nil then
        v46:init(v46.props);
    end;
    v42.context = v46._context;
    v45.lifecyclePhase = v1.Render;
    local v48 = v46:render();
    v45.lifecyclePhase = v1.ReconcileChildren;
    v41.updateVirtualNodeWithRenderResult(v42, l_hostParent_0, v48);
    if v46.didMount ~= nil then
        v45.lifecyclePhase = v1.DidMount;
        v46:didMount();
    end;
    if v45.pendingState ~= nil then
        v46:__update(nil, nil);
    end;
    v45.lifecyclePhase = v1.Idle;
end;
v10.__unmount = function(v49) --[[ Line: 311 ]] --[[ Name: __unmount ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v7 (copy), v1 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v49) == v2.StatefulComponentInstance, "Invalid use of `__unmount`");
    end;
    local v50 = v49[v7];
    local l_virtualNode_0 = v50.virtualNode;
    local l_reconciler_0 = v50.reconciler;
    if v49.willUnmount ~= nil then
        v50.lifecyclePhase = v1.WillUnmount;
        v49:willUnmount();
    end;
    for _, v54 in pairs(l_virtualNode_0.children) do
        l_reconciler_0.unmountVirtualNode(v54);
    end;
end;
v10.__update = function(v55, v56, v57) --[[ Line: 336 ]] --[[ Name: __update ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v7 (copy), v0 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v55) == v2.StatefulComponentInstance, "Invalid use of `__update`");
        local l_v5_0 = v5;
        local v59 = true;
        if v2.of(v56) ~= v2.Element then
            v59 = v56 == nil;
        end;
        l_v5_0(v59, "Expected arg #1 to be of type Element or nil");
        l_v5_0 = v5;
        v59 = true;
        if typeof(v57) ~= "table" then
            v59 = v57 == nil;
        end;
        l_v5_0(v59, "Expected arg #2 to be of type table or nil");
    end;
    local v60 = v55[v7];
    local l_componentClass_1 = v60.componentClass;
    local l_props_1 = v55.props;
    if v56 ~= nil then
        l_props_1 = v56.props;
        if l_componentClass_1.defaultProps ~= nil then
            l_props_1 = v0({}, l_componentClass_1.defaultProps, l_props_1);
        end;
        v55:__validateProps(l_props_1);
    end;
    local v63 = 0;
    while true do
        local v64 = nil;
        local v65 = nil;
        if v60.pendingState ~= nil then
            v65 = v60.pendingState;
            v60.pendingState = nil;
        end;
        if v57 ~= nil or l_props_1 ~= v55.props then
            v64 = if v65 == nil then v57 or v55.state else v0(v65, v57);
            local v66 = v55:__getDerivedState(l_props_1, v64);
            if v66 ~= nil then
                v64 = v0({}, v64, v66);
            end;
            v57 = nil;
        else
            v64 = v65;
        end;
        if not v55:__resolveUpdate(l_props_1, v64) then
            return false;
        else
            v63 = v63 + 1;
            if v63 > 100 then
                error(("The component %q has reached the setState update recursion limit.\nWhen using `setState` in `didUpdate`, make sure that it won't repeat infinitely!"):format((tostring(v60.componentClass))), 3);
            end;
            if v60.pendingState == nil then
                return true;
            end;
        end;
    end;
end;
v10.__resolveUpdate = function(v67, v68, v69) --[[ Line: 413 ]] --[[ Name: __resolveUpdate ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v7 (copy), v1 (copy)
    if v6.internalTypeChecks then
        v5(v2.of(v67) == v2.StatefulComponentInstance, "Invalid use of `__resolveUpdate`");
    end;
    local v70 = v67[v7];
    local l_virtualNode_1 = v70.virtualNode;
    local l_reconciler_1 = v70.reconciler;
    local l_props_2 = v67.props;
    local l_state_0 = v67.state;
    if v68 == nil then
        v68 = l_props_2;
    end;
    if v69 == nil then
        v69 = l_state_0;
    end;
    if v67.shouldUpdate ~= nil then
        v70.lifecyclePhase = v1.ShouldUpdate;
        if not v67:shouldUpdate(v68, v69) then
            v70.lifecyclePhase = v1.Idle;
            return false;
        end;
    end;
    if v67.willUpdate ~= nil then
        v70.lifecyclePhase = v1.WillUpdate;
        v67:willUpdate(v68, v69);
    end;
    v70.lifecyclePhase = v1.Render;
    v67.props = v68;
    v67.state = v69;
    local v75 = l_virtualNode_1.instance:render();
    v70.lifecyclePhase = v1.ReconcileChildren;
    l_reconciler_1.updateVirtualNodeWithRenderResult(l_virtualNode_1, l_virtualNode_1.hostParent, v75);
    if v67.didUpdate ~= nil then
        v70.lifecyclePhase = v1.DidUpdate;
        v67:didUpdate(l_props_2, l_state_0);
    end;
    v70.lifecyclePhase = v1.Idle;
    return true;
end;
return v10;