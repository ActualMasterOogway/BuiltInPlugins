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
    local function v22(v13, v14) --[[ Line: 36 ]] --[[ Name: replaceVirtualNode ]]
        -- upvalues: v6 (ref), v12 (ref), v10 (ref)
        local l_hostParent_0 = v13.hostParent;
        local l_hostKey_0 = v13.hostKey;
        local l_depth_0 = v13.depth;
        local l_parent_0 = v13.parent;
        local v19 = v13.originalContext or v13.context;
        local l_parentLegacyContext_0 = v13.parentLegacyContext;
        if v6.tempFixUpdateChildrenReEntrancy then
            if not v13.wasUnmounted then
                v12(v13);
            end;
        else
            v12(v13);
        end;
        local v21 = v10(v14, l_hostParent_0, l_hostKey_0, v19, l_parentLegacyContext_0);
        if v21 ~= nil then
            v21.depth = l_depth_0;
            v21.parent = l_parent_0;
        end;
        return v21;
    end;
    local function v37(v23, v24, v25) --[[ Line: 73 ]] --[[ Name: updateChildren ]]
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
            if v6.tempFixUpdateChildrenReEntrancy and v23.updateChildrenCount ~= l_updateChildrenCount_0 then
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
                if v6.tempFixUpdateChildrenReEntrancy and v23.updateChildrenCount ~= l_updateChildrenCount_0 then
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
    local function v41(v38, v39, v40) --[[ Line: 150 ]] --[[ Name: updateVirtualNodeWithChildren ]]
        -- upvalues: v37 (copy)
        v37(v38, v39, v40);
    end;
    local function v45(v42, v43, v44) --[[ Line: 154 ]] --[[ Name: updateVirtualNodeWithRenderResult ]]
        -- upvalues: v0 (ref), v37 (copy)
        if v0.of(v44) == v0.Element or v44 == nil or typeof(v44) == "boolean" then
            v37(v42, v43, v44);
            return;
        else
            error(("%s\n%s"):format("Component returned invalid children:", v42.currentElement.source or "<enable element tracebacks>"), 0);
            return;
        end;
    end;
    v12 = function(v46) --[[ Line: 171 ]] --[[ Name: unmountVirtualNode ]]
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
    local function _(v54, v55) --[[ Line: 201 ]] --[[ Name: updateFunctionVirtualNode ]]
        -- upvalues: v45 (copy)
        local v56 = v55.component(v55.props);
        v45(v54, v54.hostParent, v56);
        return v54;
    end;
    local function _(v58, v59) --[[ Line: 209 ]] --[[ Name: updatePortalVirtualNode ]]
        -- upvalues: v8 (copy), v22 (copy), v3 (ref), v37 (copy)
        local l_target_0 = v58.currentElement.props.target;
        local l_target_1 = v59.props.target;
        assert(v8.isHostObject(l_target_1), "Expected target to be host object");
        if l_target_1 ~= l_target_0 then
            return (v22(v58, v59));
        else
            local v62 = v59.props[v3];
            v37(v58, l_target_1, v62);
            return v58;
        end;
    end;
    local function _(v64, v65) --[[ Line: 228 ]] --[[ Name: updateFragmentVirtualNode ]]
        -- upvalues: v37 (copy)
        local l_hostParent_1 = v64.hostParent;
        local l_elements_0 = v65.elements;
        v37(v64, l_hostParent_1, l_elements_0);
        return v64;
    end;
    v11 = function(v69, v70, v71) --[[ Line: 246 ]] --[[ Name: updateVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v0 (ref), v12 (ref), v22 (copy), v1 (ref), v8 (copy), v9 (ref), v45 (copy), v3 (ref), v37 (copy)
        if v6.internalTypeChecks then
            v5(v0.of(v69) == v0.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;
        if v6.typeChecks then
            local v72 = true;
            if v0.of(v70) ~= v0.Element then
                v72 = true;
                if typeof(v70) ~= "boolean" then
                    v72 = v70 == nil;
                end;
            end;
            assert(v72, "Expected arg #2 to be of type Element, boolean, or nil");
        end;
        if v69.currentElement == v70 and v71 == nil then
            return v69;
        elseif typeof(v70) == "boolean" or v70 == nil then
            v12(v69);
            return nil;
        elseif v69.currentElement.component ~= v70.component then
            return (v22(v69, v70));
        else
            local v73 = v1.of(v70);
            local v74 = true;
            if v73 == v1.Host then
                v69 = v8.updateHostNode(v9, v69, v70);
            elseif v73 == v1.Function then
                local l_v69_0 = v69;
                local v76 = v70.component(v70.props);
                v45(l_v69_0, l_v69_0.hostParent, v76);
                v69 = l_v69_0;
            elseif v73 == v1.Stateful then
                v74 = v69.instance:__update(v70, v71);
            elseif v73 == v1.Portal then
                local l_v69_1 = v69;
                local l_target_2 = l_v69_1.currentElement.props.target;
                local l_target_3 = v70.props.target;
                assert(v8.isHostObject(l_target_3), "Expected target to be host object");
                if l_target_3 ~= l_target_2 then
                    v69 = v22(l_v69_1, v70);
                else
                    local v80 = v70.props[v3];
                    v37(l_v69_1, l_target_3, v80);
                    v69 = l_v69_1;
                end;
            elseif v73 == v1.Fragment then
                local l_v69_2 = v69;
                local l_hostParent_2 = l_v69_2.hostParent;
                local l_elements_1 = v70.elements;
                v37(l_v69_2, l_hostParent_2, l_elements_1);
                v69 = l_v69_2;
            else
                error(("Unknown ElementKind %q"):format((tostring(v73))), 2);
            end;
            if not v74 then
                return v69;
            else
                v69.currentElement = v70;
                return v69;
            end;
        end;
    end;
    local function v92(v84, v85, v86, v87, v88) --[[ Line: 303 ]] --[[ Name: createVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v8 (copy), v0 (ref)
        if v6.internalTypeChecks then
            v5(v8.isHostObject(v85) or v85 == nil, "Expected arg #2 to be a host object");
            local l_v5_0 = v5;
            local v90 = true;
            if typeof(v87) ~= "table" then
                v90 = v87 == nil;
            end;
            l_v5_0(v90, "Expected arg #4 to be of type table or nil");
            l_v5_0 = v5;
            v90 = true;
            if typeof(v88) ~= "table" then
                v90 = v88 == nil;
            end;
            l_v5_0(v90, "Expected arg #5 to be of type table or nil");
        end;
        if v6.typeChecks then
            assert(v86 ~= nil, "Expected arg #3 to be non-nil");
            local v91 = true;
            if v0.of(v84) ~= v0.Element then
                v91 = typeof(v84) == "boolean";
            end;
            assert(v91, "Expected arg #1 to be of type Element or boolean");
        end;
        return {
            [v0] = v0.VirtualNode, 
            currentElement = v84, 
            depth = 1, 
            parent = nil, 
            children = {}, 
            hostParent = v85, 
            hostKey = v86, 
            updateChildrenCount = 0, 
            wasUnmounted = false, 
            legacyContext = v88, 
            parentLegacyContext = v88, 
            context = v87 or {}, 
            originalContext = nil
        };
    end;
    local function _(v93) --[[ Line: 348 ]] --[[ Name: mountFunctionVirtualNode ]]
        -- upvalues: v45 (copy)
        local l_currentElement_0 = v93.currentElement;
        local v95 = l_currentElement_0.component(l_currentElement_0.props);
        v45(v93, v93.hostParent, v95);
    end;
    local function _(v97) --[[ Line: 356 ]] --[[ Name: mountPortalVirtualNode ]]
        -- upvalues: v3 (ref), v8 (copy), v37 (copy)
        local l_currentElement_1 = v97.currentElement;
        local l_target_4 = l_currentElement_1.props.target;
        local v100 = l_currentElement_1.props[v3];
        assert(v8.isHostObject(l_target_4), "Expected target to be host object");
        v37(v97, l_target_4, v100);
    end;
    local function _(v102) --[[ Line: 367 ]] --[[ Name: mountFragmentVirtualNode ]]
        -- upvalues: v37 (copy)
        local l_elements_2 = v102.currentElement.elements;
        local l_hostParent_3 = v102.hostParent;
        v37(v102, l_hostParent_3, l_elements_2);
    end;
    v10 = function(v106, v107, v108, v109, v110) --[[ Line: 378 ]] --[[ Name: mountVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v8 (copy), v0 (ref), v1 (ref), v92 (copy), v9 (ref), v45 (copy), v3 (ref), v37 (copy)
        if v6.internalTypeChecks then
            v5(v8.isHostObject(v107) or v107 == nil, "Expected arg #2 to be a host object");
            local l_v5_1 = v5;
            local v112 = true;
            if typeof(v110) ~= "table" then
                v112 = v110 == nil;
            end;
            l_v5_1(v112, "Expected arg #5 to be of type table or nil");
        end;
        if v6.typeChecks then
            assert(v108 ~= nil, "Expected arg #3 to be non-nil");
            local v113 = true;
            if v0.of(v106) ~= v0.Element then
                v113 = typeof(v106) == "boolean";
            end;
            assert(v113, "Expected arg #1 to be of type Element or boolean");
        end;
        if typeof(v106) == "boolean" then
            return nil;
        else
            local v114 = v1.of(v106);
            local v115 = v92(v106, v107, v108, v109, v110);
            if v114 == v1.Host then
                v8.mountHostNode(v9, v115);
                return v115;
            elseif v114 == v1.Function then
                local l_currentElement_2 = v115.currentElement;
                local v117 = l_currentElement_2.component(l_currentElement_2.props);
                v45(v115, v115.hostParent, v117);
                return v115;
            elseif v114 == v1.Stateful then
                v106.component:__mount(v9, v115);
                return v115;
            elseif v114 == v1.Portal then
                local l_currentElement_3 = v115.currentElement;
                local l_target_5 = l_currentElement_3.props.target;
                local v120 = l_currentElement_3.props[v3];
                assert(v8.isHostObject(l_target_5), "Expected target to be host object");
                v37(v115, l_target_5, v120);
                return v115;
            elseif v114 == v1.Fragment then
                local l_elements_3 = v115.currentElement.elements;
                local l_hostParent_4 = v115.hostParent;
                v37(v115, l_hostParent_4, l_elements_3);
                return v115;
            else
                error(("Unknown ElementKind %q"):format((tostring(v114))), 2);
                return v115;
            end;
        end;
    end;
    local function v127(v123, v124, v125) --[[ Line: 424 ]] --[[ Name: mountVirtualTree ]]
        -- upvalues: v6 (ref), v0 (ref), v8 (copy), v7 (ref), v10 (ref)
        if v6.typeChecks then
            assert(v0.of(v123) == v0.Element, "Expected arg #1 to be of type Element");
            assert(v8.isHostObject(v124) or v124 == nil, "Expected arg #2 to be a host object");
        end;
        if v125 == nil then
            v125 = "RoactTree";
        end;
        local v126 = {
            [v0] = v0.VirtualTree, 
            [v7] = {
                rootNode = nil, 
                mounted = true
            }
        };
        v126[v7].rootNode = v10(v123, v124, v125);
        return v126;
    end;
    local function v130(v128) --[[ Line: 455 ]] --[[ Name: unmountVirtualTree ]]
        -- upvalues: v7 (ref), v6 (ref), v0 (ref), v12 (ref)
        local v129 = v128[v7];
        if v6.typeChecks then
            assert(v0.of(v128) == v0.VirtualTree, "Expected arg #1 to be a Roact handle");
            assert(v129.mounted, "Cannot unmounted a Roact tree that has already been unmounted");
        end;
        v129.mounted = false;
        if v129.rootNode ~= nil then
            v12(v129.rootNode);
        end;
    end;
    local function v134(v131, v132) --[[ Line: 473 ]] --[[ Name: updateVirtualTree ]]
        -- upvalues: v7 (ref), v6 (ref), v0 (ref), v11 (ref)
        local v133 = v131[v7];
        if v6.typeChecks then
            assert(v0.of(v131) == v0.VirtualTree, "Expected arg #1 to be a Roact handle");
            assert(v0.of(v132) == v0.Element, "Expected arg #2 to be a Roact Element");
        end;
        v133.rootNode = v11(v133.rootNode, v132);
        return v131;
    end;
    v9 = {
        mountVirtualTree = v127, 
        unmountVirtualTree = v130, 
        updateVirtualTree = v134, 
        createVirtualNode = v92, 
        mountVirtualNode = v10, 
        unmountVirtualNode = v12, 
        updateVirtualNode = v11, 
        updateVirtualNodeWithChildren = v41, 
        updateVirtualNodeWithRenderResult = v45
    };
    return v9;
end;