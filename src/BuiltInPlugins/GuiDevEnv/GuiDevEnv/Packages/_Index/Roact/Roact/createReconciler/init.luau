local v0 = require(script.Parent.Type);
local v1 = require(script.Parent.ElementKind);
local v2 = require(script.Parent.ElementUtils);
local v3 = require(script.Parent.PropMarkers.Children);
local v4 = require(script.Parent.Symbol);
local v5 = require(script.Parent.internalAssert);
local v6 = require(script.Parent.GlobalConfig).get();
local v7 = v4.named("InternalData");
return function(v8) --[[ Line: 25 ]] --[[ Name: createReconciler ]]
    -- upvalues: v6 (copy), v5 (copy), v0 (copy), v2 (copy), v1 (copy), v3 (copy), v7 (copy)
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local function _(v13, v14) --[[ Line: 37 ]] --[[ Name: replaceVirtualNode ]]
        -- upvalues: v12 (ref), v10 (ref)
        local l_hostParent_0 = v13.hostParent;
        local l_hostKey_0 = v13.hostKey;
        local l_depth_0 = v13.depth;
        local l_parent_0 = v13.parent;
        local v19 = v13.originalContext or v13.context;
        local l_parentLegacyContext_0 = v13.parentLegacyContext;
        if not v13.wasUnmounted then
            v12(v13);
        end;
        local v21 = v10(v14, l_hostParent_0, l_hostKey_0, v19, l_parentLegacyContext_0);
        if v21 ~= nil then
            v21.depth = l_depth_0;
            v21.parent = l_parent_0;
        end;
        return v21;
    end;
    local function v37(v23, v24, v25) --[[ Line: 70 ]] --[[ Name: updateChildren ]]
        -- upvalues: v6 (ref), v5 (ref), v0 (ref), v2 (ref), v11 (ref), v12 (ref), v10 (ref)
        if v6.internalTypeChecks then
            v5(v0.of(v23) == v0.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;
        v23.updateChildrenCount = v23.updateChildrenCount + 1;
        local l_updateChildrenCount_0 = v23.updateChildrenCount;
        local v27 = {};
        for v28, v29 in pairs(v23.children) do
            local v30 = v2.getElementByKey(v25, v28);
            local v31 = v11(v29, v30);
            if v23.updateChildrenCount ~= l_updateChildrenCount_0 then
                if v31 and v31 ~= v23.children[v28] then
                    v12(v31);
                end;
                return;
            elseif v31 ~= nil then
                v23.children[v28] = v31;
            else
                v27[v28] = true;
            end;
        end;
        for v32 in pairs(v27) do
            v23.children[v32] = nil;
        end;
        for v33, v34 in v2.iterateElements(v25) do
            local l_v33_0 = v33;
            if v33 == v2.UseParentKey then
                l_v33_0 = v23.hostKey;
            end;
            if v23.children[v33] == nil then
                local v36 = v10(v34, v24, l_v33_0, v23.context, v23.legacyContext);
                if v23.updateChildrenCount ~= l_updateChildrenCount_0 then
                    if v36 then
                        v12(v36);
                    end;
                    return;
                elseif v36 ~= nil then
                    v36.depth = v23.depth + 1;
                    v36.parent = v23;
                    v23.children[v33] = v36;
                end;
            end;
        end;
    end;
    local function v41(v38, v39, v40) --[[ Line: 143 ]] --[[ Name: updateVirtualNodeWithChildren ]]
        -- upvalues: v37 (copy)
        v37(v38, v39, v40);
    end;
    local function v45(v42, v43, v44) --[[ Line: 147 ]] --[[ Name: updateVirtualNodeWithRenderResult ]]
        -- upvalues: v0 (ref), v37 (copy)
        if v0.of(v44) == v0.Element or v44 == nil or typeof(v44) == "boolean" then
            v37(v42, v43, v44);
            return;
        else
            error(("%s\n%s"):format("Component returned invalid children:", v42.currentElement.source or "<enable element tracebacks>"), 0);
            return;
        end;
    end;
    v12 = function(v46) --[[ Line: 164 ]] --[[ Name: unmountVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v0 (ref), v1 (ref), v8 (copy), v9 (ref), v12 (ref)
        if v6.internalTypeChecks then
            v5(v0.of(v46) == v0.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;
        v46.wasUnmounted = true;
        local v47 = v1.of(v46.currentElement);
        if v47 == v1.Host then
            v8.unmountHostNode(v9, v46);
            return;
        elseif v47 == v1.Function then
            for _, v49 in pairs(v46.children) do
                v12(v49);
            end;
            return;
        elseif v47 == v1.Stateful then
            v46.instance:__unmount();
            return;
        elseif v47 == v1.Portal then
            for _, v51 in pairs(v46.children) do
                v12(v51);
            end;
            return;
        elseif v47 == v1.Fragment then
            for _, v53 in pairs(v46.children) do
                v12(v53);
            end;
            return;
        else
            error(("Unknown ElementKind %q"):format((tostring(v47))), 2);
            return;
        end;
    end;
    local function _(v54, v55) --[[ Line: 195 ]] --[[ Name: updateFunctionVirtualNode ]]
        -- upvalues: v45 (copy)
        local v56 = v55.component(v55.props);
        v45(v54, v54.hostParent, v56);
        return v54;
    end;
    local function _(v58, v59) --[[ Line: 203 ]] --[[ Name: updatePortalVirtualNode ]]
        -- upvalues: v8 (copy), v12 (ref), v10 (ref), v3 (ref), v37 (copy)
        local l_target_0 = v58.currentElement.props.target;
        local l_target_1 = v59.props.target;
        assert(v8.isHostObject(l_target_1), "Expected target to be host object");
        if l_target_1 ~= l_target_0 then
            local l_hostParent_1 = v58.hostParent;
            local l_hostKey_1 = v58.hostKey;
            local l_depth_1 = v58.depth;
            local l_parent_1 = v58.parent;
            local v66 = v58.originalContext or v58.context;
            local l_parentLegacyContext_1 = v58.parentLegacyContext;
            if not v58.wasUnmounted then
                v12(v58);
            end;
            local v68 = v10(v59, l_hostParent_1, l_hostKey_1, v66, l_parentLegacyContext_1);
            if v68 ~= nil then
                v68.depth = l_depth_1;
                v68.parent = l_parent_1;
            end;
            return v68;
        else
            local v69 = v59.props[v3];
            v37(v58, l_target_1, v69);
            return v58;
        end;
    end;
    local function _(v71, v72) --[[ Line: 222 ]] --[[ Name: updateFragmentVirtualNode ]]
        -- upvalues: v37 (copy)
        local l_hostParent_2 = v71.hostParent;
        local l_elements_0 = v72.elements;
        v37(v71, l_hostParent_2, l_elements_0);
        return v71;
    end;
    v11 = function(v76, v77, v78) --[[ Line: 240 ]] --[[ Name: updateVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v0 (ref), v12 (ref), v10 (ref), v1 (ref), v8 (copy), v9 (ref), v45 (copy), v3 (ref), v37 (copy)
        if v6.internalTypeChecks then
            v5(v0.of(v76) == v0.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;
        if v6.typeChecks then
            local v79 = true;
            if v0.of(v77) ~= v0.Element then
                v79 = true;
                if typeof(v77) ~= "boolean" then
                    v79 = v77 == nil;
                end;
            end;
            assert(v79, "Expected arg #2 to be of type Element, boolean, or nil");
        end;
        if v76.currentElement == v77 and v78 == nil then
            return v76;
        elseif typeof(v77) == "boolean" or v77 == nil then
            v12(v76);
            return nil;
        elseif v76.currentElement.component ~= v77.component then
            local l_v76_0 = v76;
            local l_hostParent_3 = l_v76_0.hostParent;
            local l_hostKey_2 = l_v76_0.hostKey;
            local l_depth_2 = l_v76_0.depth;
            local l_parent_2 = l_v76_0.parent;
            local v85 = l_v76_0.originalContext or l_v76_0.context;
            local l_parentLegacyContext_2 = l_v76_0.parentLegacyContext;
            if not l_v76_0.wasUnmounted then
                v12(l_v76_0);
            end;
            local v87 = v10(v77, l_hostParent_3, l_hostKey_2, v85, l_parentLegacyContext_2);
            if v87 ~= nil then
                v87.depth = l_depth_2;
                v87.parent = l_parent_2;
            end;
            return v87;
        else
            local v88 = v1.of(v77);
            local v89 = true;
            if v88 == v1.Host then
                v76 = v8.updateHostNode(v9, v76, v77);
            elseif v88 == v1.Function then
                local l_v76_1 = v76;
                local v91 = v77.component(v77.props);
                v45(l_v76_1, l_v76_1.hostParent, v91);
                v76 = l_v76_1;
            elseif v88 == v1.Stateful then
                v89 = v76.instance:__update(v77, v78);
            elseif v88 == v1.Portal then
                local l_v76_2 = v76;
                local l_target_2 = l_v76_2.currentElement.props.target;
                local l_target_3 = v77.props.target;
                assert(v8.isHostObject(l_target_3), "Expected target to be host object");
                if l_target_3 ~= l_target_2 then
                    local l_hostParent_4 = l_v76_2.hostParent;
                    local l_hostKey_3 = l_v76_2.hostKey;
                    local l_depth_3 = l_v76_2.depth;
                    local l_parent_3 = l_v76_2.parent;
                    local v99 = l_v76_2.originalContext or l_v76_2.context;
                    local l_parentLegacyContext_3 = l_v76_2.parentLegacyContext;
                    if not l_v76_2.wasUnmounted then
                        v12(l_v76_2);
                    end;
                    local v101 = v10(v77, l_hostParent_4, l_hostKey_3, v99, l_parentLegacyContext_3);
                    if v101 ~= nil then
                        v101.depth = l_depth_3;
                        v101.parent = l_parent_3;
                    end;
                    v76 = v101;
                else
                    local v102 = v77.props[v3];
                    v37(l_v76_2, l_target_3, v102);
                    v76 = l_v76_2;
                end;
            elseif v88 == v1.Fragment then
                local l_v76_3 = v76;
                local l_hostParent_5 = l_v76_3.hostParent;
                local l_elements_1 = v77.elements;
                v37(l_v76_3, l_hostParent_5, l_elements_1);
                v76 = l_v76_3;
            else
                error(("Unknown ElementKind %q"):format((tostring(v88))), 2);
            end;
            if not v89 then
                return v76;
            else
                v76.currentElement = v77;
                return v76;
            end;
        end;
    end;
    local function v114(v106, v107, v108, v109, v110) --[[ Line: 297 ]] --[[ Name: createVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v8 (copy), v0 (ref)
        if v6.internalTypeChecks then
            v5(v8.isHostObject(v107) or v107 == nil, "Expected arg #2 to be a host object");
            local l_v5_0 = v5;
            local v112 = true;
            if typeof(v109) ~= "table" then
                v112 = v109 == nil;
            end;
            l_v5_0(v112, "Expected arg #4 to be of type table or nil");
            l_v5_0 = v5;
            v112 = true;
            if typeof(v110) ~= "table" then
                v112 = v110 == nil;
            end;
            l_v5_0(v112, "Expected arg #5 to be of type table or nil");
        end;
        if v6.typeChecks then
            assert(v108 ~= nil, "Expected arg #3 to be non-nil");
            local v113 = true;
            if v0.of(v106) ~= v0.Element then
                v113 = typeof(v106) == "boolean";
            end;
            assert(v113, "Expected arg #1 to be of type Element or boolean");
        end;
        return {
            [v0] = v0.VirtualNode, 
            currentElement = v106, 
            depth = 1, 
            parent = nil, 
            children = {}, 
            hostParent = v107, 
            hostKey = v108, 
            updateChildrenCount = 0, 
            wasUnmounted = false, 
            legacyContext = v110, 
            parentLegacyContext = v110, 
            context = v109 or {}, 
            originalContext = nil
        };
    end;
    local function _(v115) --[[ Line: 345 ]] --[[ Name: mountFunctionVirtualNode ]]
        -- upvalues: v45 (copy)
        local l_currentElement_0 = v115.currentElement;
        local v117 = l_currentElement_0.component(l_currentElement_0.props);
        v45(v115, v115.hostParent, v117);
    end;
    local function _(v119) --[[ Line: 353 ]] --[[ Name: mountPortalVirtualNode ]]
        -- upvalues: v3 (ref), v8 (copy), v37 (copy)
        local l_currentElement_1 = v119.currentElement;
        local l_target_4 = l_currentElement_1.props.target;
        local v122 = l_currentElement_1.props[v3];
        assert(v8.isHostObject(l_target_4), "Expected target to be host object");
        v37(v119, l_target_4, v122);
    end;
    local function _(v124) --[[ Line: 364 ]] --[[ Name: mountFragmentVirtualNode ]]
        -- upvalues: v37 (copy)
        local l_elements_2 = v124.currentElement.elements;
        local l_hostParent_6 = v124.hostParent;
        v37(v124, l_hostParent_6, l_elements_2);
    end;
    v10 = function(v128, v129, v130, v131, v132) --[[ Line: 375 ]] --[[ Name: mountVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v8 (copy), v0 (ref), v1 (ref), v114 (copy), v9 (ref), v45 (copy), v3 (ref), v37 (copy)
        if v6.internalTypeChecks then
            v5(v8.isHostObject(v129) or v129 == nil, "Expected arg #2 to be a host object");
            local l_v5_1 = v5;
            local v134 = true;
            if typeof(v132) ~= "table" then
                v134 = v132 == nil;
            end;
            l_v5_1(v134, "Expected arg #5 to be of type table or nil");
        end;
        if v6.typeChecks then
            assert(v130 ~= nil, "Expected arg #3 to be non-nil");
            local v135 = true;
            if v0.of(v128) ~= v0.Element then
                v135 = typeof(v128) == "boolean";
            end;
            assert(v135, "Expected arg #1 to be of type Element or boolean");
        end;
        if typeof(v128) == "boolean" then
            return nil;
        else
            local v136 = v1.of(v128);
            local v137 = v114(v128, v129, v130, v131, v132);
            if v136 == v1.Host then
                v8.mountHostNode(v9, v137);
                return v137;
            elseif v136 == v1.Function then
                local l_currentElement_2 = v137.currentElement;
                local v139 = l_currentElement_2.component(l_currentElement_2.props);
                v45(v137, v137.hostParent, v139);
                return v137;
            elseif v136 == v1.Stateful then
                v128.component:__mount(v9, v137);
                return v137;
            elseif v136 == v1.Portal then
                local l_currentElement_3 = v137.currentElement;
                local l_target_5 = l_currentElement_3.props.target;
                local v142 = l_currentElement_3.props[v3];
                assert(v8.isHostObject(l_target_5), "Expected target to be host object");
                v37(v137, l_target_5, v142);
                return v137;
            elseif v136 == v1.Fragment then
                local l_elements_3 = v137.currentElement.elements;
                local l_hostParent_7 = v137.hostParent;
                v37(v137, l_hostParent_7, l_elements_3);
                return v137;
            else
                error(("Unknown ElementKind %q"):format((tostring(v136))), 2);
                return v137;
            end;
        end;
    end;
    local function v149(v145, v146, v147) --[[ Line: 424 ]] --[[ Name: mountVirtualTree ]]
        -- upvalues: v6 (ref), v0 (ref), v8 (copy), v7 (ref), v10 (ref)
        if v6.typeChecks then
            assert(v0.of(v145) == v0.Element, "Expected arg #1 to be of type Element");
            assert(v8.isHostObject(v146) or v146 == nil, "Expected arg #2 to be a host object");
        end;
        if v147 == nil then
            v147 = "RoactTree";
        end;
        local v148 = {
            [v0] = v0.VirtualTree, 
            [v7] = {
                rootNode = nil, 
                mounted = true
            }
        };
        v148[v7].rootNode = v10(v145, v146, v147);
        return v148;
    end;
    local function v152(v150) --[[ Line: 455 ]] --[[ Name: unmountVirtualTree ]]
        -- upvalues: v7 (ref), v6 (ref), v0 (ref), v12 (ref)
        local v151 = v150[v7];
        if v6.typeChecks then
            assert(v0.of(v150) == v0.VirtualTree, "Expected arg #1 to be a Roact handle");
            assert(v151.mounted, "Cannot unmounted a Roact tree that has already been unmounted");
        end;
        v151.mounted = false;
        if v151.rootNode ~= nil then
            v12(v151.rootNode);
        end;
    end;
    local function v156(v153, v154) --[[ Line: 473 ]] --[[ Name: updateVirtualTree ]]
        -- upvalues: v7 (ref), v6 (ref), v0 (ref), v11 (ref)
        local v155 = v153[v7];
        if v6.typeChecks then
            assert(v0.of(v153) == v0.VirtualTree, "Expected arg #1 to be a Roact handle");
            assert(v0.of(v154) == v0.Element, "Expected arg #2 to be a Roact Element");
        end;
        v155.rootNode = v11(v155.rootNode, v154);
        return v153;
    end;
    v9 = {
        mountVirtualTree = v149, 
        unmountVirtualTree = v152, 
        updateVirtualTree = v156, 
        createVirtualNode = v114, 
        mountVirtualNode = v10, 
        unmountVirtualNode = v12, 
        updateVirtualNode = v11, 
        updateVirtualNodeWithChildren = v41, 
        updateVirtualNodeWithRenderResult = v45
    };
    return v9;
end;