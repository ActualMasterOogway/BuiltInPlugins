local v0 = require(script.Parent.Type);
local v1 = require(script.Parent.ElementKind);
local v2 = require(script.Parent.ElementUtils);
local v3 = require(script.Parent.PropMarkers.Children);
local v4 = require(script.Parent.Symbol);
local v5 = require(script.Parent.internalAssert);
local v6 = require(script.Parent.GlobalConfig).get();
local v7 = v4.named("InternalData");
return function(v8) --[[ Line: 24 ]] --[[ Name: createReconciler ]]
    -- upvalues: v6 (copy), v5 (copy), v0 (copy), v2 (copy), v1 (copy), v3 (copy), v7 (copy)
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local function _(v13, v14) --[[ Line: 36 ]] --[[ Name: replaceVirtualNode ]]
        -- upvalues: v12 (ref), v10 (ref)
        local l_hostParent_0 = v13.hostParent;
        local l_hostKey_0 = v13.hostKey;
        local l_depth_0 = v13.depth;
        local l_parentContext_0 = v13.parentContext;
        v12(v13);
        local v19 = v10(v14, l_hostParent_0, l_hostKey_0, l_parentContext_0);
        if v19 ~= nil then
            v19.depth = l_depth_0;
        end;
        return v19;
    end;
    local function v34(v21, v22, v23) --[[ Line: 57 ]] --[[ Name: updateChildren ]]
        -- upvalues: v6 (ref), v5 (ref), v0 (ref), v2 (ref), v11 (ref), v10 (ref)
        if v6.internalTypeChecks then
            v5(v0.of(v21) == v0.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;
        local v24 = {};
        for v25, v26 in pairs(v21.children) do
            local v27 = v2.getElementByKey(v23, v25);
            local v28 = v11(v26, v27);
            if v28 ~= nil then
                v21.children[v25] = v28;
            else
                v24[v25] = true;
            end;
        end;
        for v29 in pairs(v24) do
            v21.children[v29] = nil;
        end;
        for v30, v31 in v2.iterateElements(v23) do
            local l_v30_0 = v30;
            if v30 == v2.UseParentKey then
                l_v30_0 = v21.hostKey;
            end;
            if v21.children[v30] == nil then
                local v33 = v10(v31, v22, l_v30_0, v21.context);
                if v33 ~= nil then
                    v33.depth = v21.depth + 1;
                    v21.children[v30] = v33;
                end;
            end;
        end;
    end;
    local function v38(v35, v36, v37) --[[ Line: 99 ]] --[[ Name: updateVirtualNodeWithChildren ]]
        -- upvalues: v34 (copy)
        v34(v35, v36, v37);
    end;
    local function v42(v39, v40, v41) --[[ Line: 103 ]] --[[ Name: updateVirtualNodeWithRenderResult ]]
        -- upvalues: v0 (ref), v34 (copy)
        if v0.of(v41) == v0.Element or v41 == nil or typeof(v41) == "boolean" then
            v34(v39, v40, v41);
            return;
        else
            error(("%s\n%s"):format("Component returned invalid children:", v39.currentElement.source or "<enable element tracebacks>"), 0);
            return;
        end;
    end;
    v12 = function(v43) --[[ Line: 120 ]] --[[ Name: unmountVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v0 (ref), v1 (ref), v8 (copy), v9 (ref), v12 (ref)
        if v6.internalTypeChecks then
            v5(v0.of(v43) == v0.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;
        local v44 = v1.of(v43.currentElement);
        if v44 == v1.Host then
            v8.unmountHostNode(v9, v43);
            return;
        elseif v44 == v1.Function then
            for _, v46 in pairs(v43.children) do
                v12(v46);
            end;
            return;
        elseif v44 == v1.Stateful then
            v43.instance:__unmount();
            return;
        elseif v44 == v1.Portal then
            for _, v48 in pairs(v43.children) do
                v12(v48);
            end;
            return;
        elseif v44 == v1.Fragment then
            for _, v50 in pairs(v43.children) do
                v12(v50);
            end;
            return;
        else
            error(("Unknown ElementKind %q"):format(tostring(v44), 2));
            return;
        end;
    end;
    local function _(v51, v52) --[[ Line: 148 ]] --[[ Name: updateFunctionVirtualNode ]]
        -- upvalues: v42 (copy)
        local v53 = v52.component(v52.props);
        v42(v51, v51.hostParent, v53);
        return v51;
    end;
    local function _(v55, v56) --[[ Line: 156 ]] --[[ Name: updatePortalVirtualNode ]]
        -- upvalues: v8 (copy), v12 (ref), v10 (ref), v3 (ref), v34 (copy)
        local l_target_0 = v55.currentElement.props.target;
        local l_target_1 = v56.props.target;
        assert(v8.isHostObject(l_target_1), "Expected target to be host object");
        if l_target_1 ~= l_target_0 then
            local l_hostParent_1 = v55.hostParent;
            local l_hostKey_1 = v55.hostKey;
            local l_depth_1 = v55.depth;
            local l_parentContext_1 = v55.parentContext;
            v12(v55);
            local v63 = v10(v56, l_hostParent_1, l_hostKey_1, l_parentContext_1);
            if v63 ~= nil then
                v63.depth = l_depth_1;
            end;
            return v63;
        else
            local v64 = v56.props[v3];
            v34(v55, l_target_1, v64);
            return v55;
        end;
    end;
    local function _(v66, v67) --[[ Line: 175 ]] --[[ Name: updateFragmentVirtualNode ]]
        -- upvalues: v34 (copy)
        local l_hostParent_2 = v66.hostParent;
        local l_elements_0 = v67.elements;
        v34(v66, l_hostParent_2, l_elements_0);
        return v66;
    end;
    v11 = function(v71, v72, v73) --[[ Line: 193 ]] --[[ Name: updateVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v0 (ref), v12 (ref), v10 (ref), v1 (ref), v8 (copy), v9 (ref), v42 (copy), v3 (ref), v34 (copy)
        if v6.internalTypeChecks then
            v5(v0.of(v71) == v0.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;
        if v6.typeChecks then
            local v74 = true;
            if v0.of(v72) ~= v0.Element then
                v74 = true;
                if typeof(v72) ~= "boolean" then
                    v74 = v72 == nil;
                end;
            end;
            assert(v74, "Expected arg #2 to be of type Element, boolean, or nil");
        end;
        if v71.currentElement == v72 and v73 == nil then
            return v71;
        elseif typeof(v72) == "boolean" or v72 == nil then
            v12(v71);
            return nil;
        elseif v71.currentElement.component ~= v72.component then
            local l_v71_0 = v71;
            local l_hostParent_3 = l_v71_0.hostParent;
            local l_hostKey_2 = l_v71_0.hostKey;
            local l_depth_2 = l_v71_0.depth;
            local l_parentContext_2 = l_v71_0.parentContext;
            v12(l_v71_0);
            local v80 = v10(v72, l_hostParent_3, l_hostKey_2, l_parentContext_2);
            if v80 ~= nil then
                v80.depth = l_depth_2;
            end;
            return v80;
        else
            local v81 = v1.of(v72);
            local v82 = true;
            if v81 == v1.Host then
                v71 = v8.updateHostNode(v9, v71, v72);
            elseif v81 == v1.Function then
                local l_v71_1 = v71;
                local v84 = v72.component(v72.props);
                v42(l_v71_1, l_v71_1.hostParent, v84);
                v71 = l_v71_1;
            elseif v81 == v1.Stateful then
                v82 = v71.instance:__update(v72, v73);
            elseif v81 == v1.Portal then
                local l_v71_2 = v71;
                local l_target_2 = l_v71_2.currentElement.props.target;
                local l_target_3 = v72.props.target;
                assert(v8.isHostObject(l_target_3), "Expected target to be host object");
                if l_target_3 ~= l_target_2 then
                    local l_hostParent_4 = l_v71_2.hostParent;
                    local l_hostKey_3 = l_v71_2.hostKey;
                    local l_depth_3 = l_v71_2.depth;
                    local l_parentContext_3 = l_v71_2.parentContext;
                    v12(l_v71_2);
                    local v92 = v10(v72, l_hostParent_4, l_hostKey_3, l_parentContext_3);
                    if v92 ~= nil then
                        v92.depth = l_depth_3;
                    end;
                    v71 = v92;
                else
                    local v93 = v72.props[v3];
                    v34(l_v71_2, l_target_3, v93);
                    v71 = l_v71_2;
                end;
            elseif v81 == v1.Fragment then
                local l_v71_3 = v71;
                local l_hostParent_5 = l_v71_3.hostParent;
                local l_elements_1 = v72.elements;
                v34(l_v71_3, l_hostParent_5, l_elements_1);
                v71 = l_v71_3;
            else
                error(("Unknown ElementKind %q"):format(tostring(v81), 2));
            end;
            if not v82 then
                return v71;
            else
                v71.currentElement = v72;
                return v71;
            end;
        end;
    end;
    local function v104(v97, v98, v99, v100) --[[ Line: 250 ]] --[[ Name: createVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v8 (copy), v0 (ref)
        if v6.internalTypeChecks then
            v5(v8.isHostObject(v98) or v98 == nil, "Expected arg #2 to be a host object");
            local l_v5_0 = v5;
            local v102 = true;
            if typeof(v100) ~= "table" then
                v102 = v100 == nil;
            end;
            l_v5_0(v102, "Expected arg #4 to be of type table or nil");
        end;
        if v6.typeChecks then
            assert(v99 ~= nil, "Expected arg #3 to be non-nil");
            local v103 = true;
            if v0.of(v97) ~= v0.Element then
                v103 = typeof(v97) == "boolean";
            end;
            assert(v103, "Expected arg #1 to be of type Element or boolean");
        end;
        return {
            [v0] = v0.VirtualNode, 
            currentElement = v97, 
            depth = 1, 
            children = {}, 
            hostParent = v98, 
            hostKey = v99, 
            context = v100, 
            parentContext = v100
        };
    end;
    local function _(v105) --[[ Line: 277 ]] --[[ Name: mountFunctionVirtualNode ]]
        -- upvalues: v42 (copy)
        local l_currentElement_0 = v105.currentElement;
        local v107 = l_currentElement_0.component(l_currentElement_0.props);
        v42(v105, v105.hostParent, v107);
    end;
    local function _(v109) --[[ Line: 285 ]] --[[ Name: mountPortalVirtualNode ]]
        -- upvalues: v3 (ref), v8 (copy), v34 (copy)
        local l_currentElement_1 = v109.currentElement;
        local l_target_4 = l_currentElement_1.props.target;
        local v112 = l_currentElement_1.props[v3];
        assert(v8.isHostObject(l_target_4), "Expected target to be host object");
        v34(v109, l_target_4, v112);
    end;
    local function _(v114) --[[ Line: 296 ]] --[[ Name: mountFragmentVirtualNode ]]
        -- upvalues: v34 (copy)
        local l_elements_2 = v114.currentElement.elements;
        local l_hostParent_6 = v114.hostParent;
        v34(v114, l_hostParent_6, l_elements_2);
    end;
    v10 = function(v118, v119, v120, v121) --[[ Line: 307 ]] --[[ Name: mountVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v8 (copy), v0 (ref), v1 (ref), v104 (copy), v9 (ref), v42 (copy), v3 (ref), v34 (copy)
        if v6.internalTypeChecks then
            v5(v8.isHostObject(v119) or v119 == nil, "Expected arg #2 to be a host object");
            local l_v5_1 = v5;
            local v123 = true;
            if typeof(v121) ~= "table" then
                v123 = v121 == nil;
            end;
            l_v5_1(v123, "Expected arg #4 to be of type table or nil");
        end;
        if v6.typeChecks then
            assert(v120 ~= nil, "Expected arg #3 to be non-nil");
            local v124 = true;
            if v0.of(v118) ~= v0.Element then
                v124 = typeof(v118) == "boolean";
            end;
            assert(v124, "Expected arg #1 to be of type Element or boolean");
        end;
        if typeof(v118) == "boolean" then
            return nil;
        else
            local v125 = v1.of(v118);
            local v126 = v104(v118, v119, v120, v121);
            if v125 == v1.Host then
                v8.mountHostNode(v9, v126);
                return v126;
            elseif v125 == v1.Function then
                local l_currentElement_2 = v126.currentElement;
                local v128 = l_currentElement_2.component(l_currentElement_2.props);
                v42(v126, v126.hostParent, v128);
                return v126;
            elseif v125 == v1.Stateful then
                v118.component:__mount(v9, v126);
                return v126;
            elseif v125 == v1.Portal then
                local l_currentElement_3 = v126.currentElement;
                local l_target_5 = l_currentElement_3.props.target;
                local v131 = l_currentElement_3.props[v3];
                assert(v8.isHostObject(l_target_5), "Expected target to be host object");
                v34(v126, l_target_5, v131);
                return v126;
            elseif v125 == v1.Fragment then
                local l_elements_3 = v126.currentElement.elements;
                local l_hostParent_7 = v126.hostParent;
                v34(v126, l_hostParent_7, l_elements_3);
                return v126;
            else
                error(("Unknown ElementKind %q"):format(tostring(v125), 2));
                return v126;
            end;
        end;
    end;
    local function v138(v134, v135, v136) --[[ Line: 350 ]] --[[ Name: mountVirtualTree ]]
        -- upvalues: v6 (ref), v0 (ref), v8 (copy), v7 (ref), v10 (ref)
        if v6.typeChecks then
            assert(v0.of(v134) == v0.Element, "Expected arg #1 to be of type Element");
            assert(v8.isHostObject(v135) or v135 == nil, "Expected arg #2 to be a host object");
        end;
        if v136 == nil then
            v136 = "RoactTree";
        end;
        local v137 = {
            [v0] = v0.VirtualTree, 
            [v7] = {
                rootNode = nil, 
                mounted = true
            }
        };
        v137[v7].rootNode = v10(v134, v135, v136);
        return v137;
    end;
    local function v141(v139) --[[ Line: 381 ]] --[[ Name: unmountVirtualTree ]]
        -- upvalues: v7 (ref), v6 (ref), v0 (ref), v12 (ref)
        local v140 = v139[v7];
        if v6.typeChecks then
            assert(v0.of(v139) == v0.VirtualTree, "Expected arg #1 to be a Roact handle");
            assert(v140.mounted, "Cannot unmounted a Roact tree that has already been unmounted");
        end;
        v140.mounted = false;
        if v140.rootNode ~= nil then
            v12(v140.rootNode);
        end;
    end;
    local function v145(v142, v143) --[[ Line: 399 ]] --[[ Name: updateVirtualTree ]]
        -- upvalues: v7 (ref), v6 (ref), v0 (ref), v11 (ref)
        local v144 = v142[v7];
        if v6.typeChecks then
            assert(v0.of(v142) == v0.VirtualTree, "Expected arg #1 to be a Roact handle");
            assert(v0.of(v143) == v0.Element, "Expected arg #2 to be a Roact Element");
        end;
        v144.rootNode = v11(v144.rootNode, v143);
        return v142;
    end;
    v9 = {
        mountVirtualTree = v138, 
        unmountVirtualTree = v141, 
        updateVirtualTree = v145, 
        createVirtualNode = v104, 
        mountVirtualNode = v10, 
        unmountVirtualNode = v12, 
        updateVirtualNode = v11, 
        updateVirtualNodeWithChildren = v38, 
        updateVirtualNodeWithRenderResult = v42
    };
    return v9;
end;