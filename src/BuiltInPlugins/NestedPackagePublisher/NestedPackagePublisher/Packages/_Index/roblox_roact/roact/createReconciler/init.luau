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
        local v18 = v13.originalContext or v13.context;
        local l_parentLegacyContext_0 = v13.parentLegacyContext;
        v12(v13);
        local v20 = v10(v14, l_hostParent_0, l_hostKey_0, v18, l_parentLegacyContext_0);
        if v20 ~= nil then
            v20.depth = l_depth_0;
        end;
        return v20;
    end;
    local function v35(v22, v23, v24) --[[ Line: 62 ]] --[[ Name: updateChildren ]]
        -- upvalues: v6 (ref), v5 (ref), v0 (ref), v2 (ref), v11 (ref), v10 (ref)
        if v6.internalTypeChecks then
            v5(v0.of(v22) == v0.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;
        local v25 = {};
        for v26, v27 in pairs(v22.children) do
            local v28 = v2.getElementByKey(v24, v26);
            local v29 = v11(v27, v28);
            if v29 ~= nil then
                v22.children[v26] = v29;
            else
                v25[v26] = true;
            end;
        end;
        for v30 in pairs(v25) do
            v22.children[v30] = nil;
        end;
        for v31, v32 in v2.iterateElements(v24) do
            local l_v31_0 = v31;
            if v31 == v2.UseParentKey then
                l_v31_0 = v22.hostKey;
            end;
            if v22.children[v31] == nil then
                local v34 = v10(v32, v23, l_v31_0, v22.context, v22.legacyContext);
                if v34 ~= nil then
                    v34.depth = v22.depth + 1;
                    v22.children[v31] = v34;
                end;
            end;
        end;
    end;
    local function v39(v36, v37, v38) --[[ Line: 110 ]] --[[ Name: updateVirtualNodeWithChildren ]]
        -- upvalues: v35 (copy)
        v35(v36, v37, v38);
    end;
    local function v43(v40, v41, v42) --[[ Line: 114 ]] --[[ Name: updateVirtualNodeWithRenderResult ]]
        -- upvalues: v0 (ref), v35 (copy)
        if v0.of(v42) == v0.Element or v42 == nil or typeof(v42) == "boolean" then
            v35(v40, v41, v42);
            return;
        else
            error(("%s\n%s"):format("Component returned invalid children:", v40.currentElement.source or "<enable element tracebacks>"), 0);
            return;
        end;
    end;
    v12 = function(v44) --[[ Line: 131 ]] --[[ Name: unmountVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v0 (ref), v1 (ref), v8 (copy), v9 (ref), v12 (ref)
        if v6.internalTypeChecks then
            v5(v0.of(v44) == v0.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;
        local v45 = v1.of(v44.currentElement);
        if v45 == v1.Host then
            v8.unmountHostNode(v9, v44);
            return;
        elseif v45 == v1.Function then
            for _, v47 in pairs(v44.children) do
                v12(v47);
            end;
            return;
        elseif v45 == v1.Stateful then
            v44.instance:__unmount();
            return;
        elseif v45 == v1.Portal then
            for _, v49 in pairs(v44.children) do
                v12(v49);
            end;
            return;
        elseif v45 == v1.Fragment then
            for _, v51 in pairs(v44.children) do
                v12(v51);
            end;
            return;
        else
            error(("Unknown ElementKind %q"):format(tostring(v45), 2));
            return;
        end;
    end;
    local function _(v52, v53) --[[ Line: 159 ]] --[[ Name: updateFunctionVirtualNode ]]
        -- upvalues: v43 (copy)
        local v54 = v53.component(v53.props);
        v43(v52, v52.hostParent, v54);
        return v52;
    end;
    local function _(v56, v57) --[[ Line: 167 ]] --[[ Name: updatePortalVirtualNode ]]
        -- upvalues: v8 (copy), v12 (ref), v10 (ref), v3 (ref), v35 (copy)
        local l_target_0 = v56.currentElement.props.target;
        local l_target_1 = v57.props.target;
        assert(v8.isHostObject(l_target_1), "Expected target to be host object");
        if l_target_1 ~= l_target_0 then
            local l_hostParent_1 = v56.hostParent;
            local l_hostKey_1 = v56.hostKey;
            local l_depth_1 = v56.depth;
            local v63 = v56.originalContext or v56.context;
            local l_parentLegacyContext_1 = v56.parentLegacyContext;
            v12(v56);
            local v65 = v10(v57, l_hostParent_1, l_hostKey_1, v63, l_parentLegacyContext_1);
            if v65 ~= nil then
                v65.depth = l_depth_1;
            end;
            return v65;
        else
            local v66 = v57.props[v3];
            v35(v56, l_target_1, v66);
            return v56;
        end;
    end;
    local function _(v68, v69) --[[ Line: 186 ]] --[[ Name: updateFragmentVirtualNode ]]
        -- upvalues: v35 (copy)
        local l_hostParent_2 = v68.hostParent;
        local l_elements_0 = v69.elements;
        v35(v68, l_hostParent_2, l_elements_0);
        return v68;
    end;
    v11 = function(v73, v74, v75) --[[ Line: 204 ]] --[[ Name: updateVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v0 (ref), v12 (ref), v10 (ref), v1 (ref), v8 (copy), v9 (ref), v43 (copy), v3 (ref), v35 (copy)
        if v6.internalTypeChecks then
            v5(v0.of(v73) == v0.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;
        if v6.typeChecks then
            local v76 = true;
            if v0.of(v74) ~= v0.Element then
                v76 = true;
                if typeof(v74) ~= "boolean" then
                    v76 = v74 == nil;
                end;
            end;
            assert(v76, "Expected arg #2 to be of type Element, boolean, or nil");
        end;
        if v73.currentElement == v74 and v75 == nil then
            return v73;
        elseif typeof(v74) == "boolean" or v74 == nil then
            v12(v73);
            return nil;
        elseif v73.currentElement.component ~= v74.component then
            local l_v73_0 = v73;
            local l_hostParent_3 = l_v73_0.hostParent;
            local l_hostKey_2 = l_v73_0.hostKey;
            local l_depth_2 = l_v73_0.depth;
            local v81 = l_v73_0.originalContext or l_v73_0.context;
            local l_parentLegacyContext_2 = l_v73_0.parentLegacyContext;
            v12(l_v73_0);
            local v83 = v10(v74, l_hostParent_3, l_hostKey_2, v81, l_parentLegacyContext_2);
            if v83 ~= nil then
                v83.depth = l_depth_2;
            end;
            return v83;
        else
            local v84 = v1.of(v74);
            local v85 = true;
            if v84 == v1.Host then
                v73 = v8.updateHostNode(v9, v73, v74);
            elseif v84 == v1.Function then
                local l_v73_1 = v73;
                local v87 = v74.component(v74.props);
                v43(l_v73_1, l_v73_1.hostParent, v87);
                v73 = l_v73_1;
            elseif v84 == v1.Stateful then
                v85 = v73.instance:__update(v74, v75);
            elseif v84 == v1.Portal then
                local l_v73_2 = v73;
                local l_target_2 = l_v73_2.currentElement.props.target;
                local l_target_3 = v74.props.target;
                assert(v8.isHostObject(l_target_3), "Expected target to be host object");
                if l_target_3 ~= l_target_2 then
                    local l_hostParent_4 = l_v73_2.hostParent;
                    local l_hostKey_3 = l_v73_2.hostKey;
                    local l_depth_3 = l_v73_2.depth;
                    local v94 = l_v73_2.originalContext or l_v73_2.context;
                    local l_parentLegacyContext_3 = l_v73_2.parentLegacyContext;
                    v12(l_v73_2);
                    local v96 = v10(v74, l_hostParent_4, l_hostKey_3, v94, l_parentLegacyContext_3);
                    if v96 ~= nil then
                        v96.depth = l_depth_3;
                    end;
                    v73 = v96;
                else
                    local v97 = v74.props[v3];
                    v35(l_v73_2, l_target_3, v97);
                    v73 = l_v73_2;
                end;
            elseif v84 == v1.Fragment then
                local l_v73_3 = v73;
                local l_hostParent_5 = l_v73_3.hostParent;
                local l_elements_1 = v74.elements;
                v35(l_v73_3, l_hostParent_5, l_elements_1);
                v73 = l_v73_3;
            else
                error(("Unknown ElementKind %q"):format(tostring(v84), 2));
            end;
            if not v85 then
                return v73;
            else
                v73.currentElement = v74;
                return v73;
            end;
        end;
    end;
    local function v109(v101, v102, v103, v104, v105) --[[ Line: 261 ]] --[[ Name: createVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v8 (copy), v0 (ref)
        if v6.internalTypeChecks then
            v5(v8.isHostObject(v102) or v102 == nil, "Expected arg #2 to be a host object");
            local l_v5_0 = v5;
            local v107 = true;
            if typeof(v104) ~= "table" then
                v107 = v104 == nil;
            end;
            l_v5_0(v107, "Expected arg #4 to be of type table or nil");
            l_v5_0 = v5;
            v107 = true;
            if typeof(v105) ~= "table" then
                v107 = v105 == nil;
            end;
            l_v5_0(v107, "Expected arg #5 to be of type table or nil");
        end;
        if v6.typeChecks then
            assert(v103 ~= nil, "Expected arg #3 to be non-nil");
            local v108 = true;
            if v0.of(v101) ~= v0.Element then
                v108 = typeof(v101) == "boolean";
            end;
            assert(v108, "Expected arg #1 to be of type Element or boolean");
        end;
        return {
            [v0] = v0.VirtualNode, 
            currentElement = v101, 
            depth = 1, 
            children = {}, 
            hostParent = v102, 
            hostKey = v103, 
            legacyContext = v105, 
            parentLegacyContext = v105, 
            context = v104 or {}, 
            originalContext = nil
        };
    end;
    local function _(v110) --[[ Line: 303 ]] --[[ Name: mountFunctionVirtualNode ]]
        -- upvalues: v43 (copy)
        local l_currentElement_0 = v110.currentElement;
        local v112 = l_currentElement_0.component(l_currentElement_0.props);
        v43(v110, v110.hostParent, v112);
    end;
    local function _(v114) --[[ Line: 311 ]] --[[ Name: mountPortalVirtualNode ]]
        -- upvalues: v3 (ref), v8 (copy), v35 (copy)
        local l_currentElement_1 = v114.currentElement;
        local l_target_4 = l_currentElement_1.props.target;
        local v117 = l_currentElement_1.props[v3];
        assert(v8.isHostObject(l_target_4), "Expected target to be host object");
        v35(v114, l_target_4, v117);
    end;
    local function _(v119) --[[ Line: 322 ]] --[[ Name: mountFragmentVirtualNode ]]
        -- upvalues: v35 (copy)
        local l_elements_2 = v119.currentElement.elements;
        local l_hostParent_6 = v119.hostParent;
        v35(v119, l_hostParent_6, l_elements_2);
    end;
    v10 = function(v123, v124, v125, v126, v127) --[[ Line: 333 ]] --[[ Name: mountVirtualNode ]]
        -- upvalues: v6 (ref), v5 (ref), v8 (copy), v0 (ref), v1 (ref), v109 (copy), v9 (ref), v43 (copy), v3 (ref), v35 (copy)
        if v6.internalTypeChecks then
            v5(v8.isHostObject(v124) or v124 == nil, "Expected arg #2 to be a host object");
            local l_v5_1 = v5;
            local v129 = true;
            if typeof(v127) ~= "table" then
                v129 = v127 == nil;
            end;
            l_v5_1(v129, "Expected arg #5 to be of type table or nil");
        end;
        if v6.typeChecks then
            assert(v125 ~= nil, "Expected arg #3 to be non-nil");
            local v130 = true;
            if v0.of(v123) ~= v0.Element then
                v130 = typeof(v123) == "boolean";
            end;
            assert(v130, "Expected arg #1 to be of type Element or boolean");
        end;
        if typeof(v123) == "boolean" then
            return nil;
        else
            local v131 = v1.of(v123);
            local v132 = v109(v123, v124, v125, v126, v127);
            if v131 == v1.Host then
                v8.mountHostNode(v9, v132);
                return v132;
            elseif v131 == v1.Function then
                local l_currentElement_2 = v132.currentElement;
                local v134 = l_currentElement_2.component(l_currentElement_2.props);
                v43(v132, v132.hostParent, v134);
                return v132;
            elseif v131 == v1.Stateful then
                v123.component:__mount(v9, v132);
                return v132;
            elseif v131 == v1.Portal then
                local l_currentElement_3 = v132.currentElement;
                local l_target_5 = l_currentElement_3.props.target;
                local v137 = l_currentElement_3.props[v3];
                assert(v8.isHostObject(l_target_5), "Expected target to be host object");
                v35(v132, l_target_5, v137);
                return v132;
            elseif v131 == v1.Fragment then
                local l_elements_3 = v132.currentElement.elements;
                local l_hostParent_7 = v132.hostParent;
                v35(v132, l_hostParent_7, l_elements_3);
                return v132;
            else
                error(("Unknown ElementKind %q"):format(tostring(v131), 2));
                return v132;
            end;
        end;
    end;
    local function v144(v140, v141, v142) --[[ Line: 379 ]] --[[ Name: mountVirtualTree ]]
        -- upvalues: v6 (ref), v0 (ref), v8 (copy), v7 (ref), v10 (ref)
        if v6.typeChecks then
            assert(v0.of(v140) == v0.Element, "Expected arg #1 to be of type Element");
            assert(v8.isHostObject(v141) or v141 == nil, "Expected arg #2 to be a host object");
        end;
        if v142 == nil then
            v142 = "RoactTree";
        end;
        local v143 = {
            [v0] = v0.VirtualTree, 
            [v7] = {
                rootNode = nil, 
                mounted = true
            }
        };
        v143[v7].rootNode = v10(v140, v141, v142);
        return v143;
    end;
    local function v147(v145) --[[ Line: 410 ]] --[[ Name: unmountVirtualTree ]]
        -- upvalues: v7 (ref), v6 (ref), v0 (ref), v12 (ref)
        local v146 = v145[v7];
        if v6.typeChecks then
            assert(v0.of(v145) == v0.VirtualTree, "Expected arg #1 to be a Roact handle");
            assert(v146.mounted, "Cannot unmounted a Roact tree that has already been unmounted");
        end;
        v146.mounted = false;
        if v146.rootNode ~= nil then
            v12(v146.rootNode);
        end;
    end;
    local function v151(v148, v149) --[[ Line: 428 ]] --[[ Name: updateVirtualTree ]]
        -- upvalues: v7 (ref), v6 (ref), v0 (ref), v11 (ref)
        local v150 = v148[v7];
        if v6.typeChecks then
            assert(v0.of(v148) == v0.VirtualTree, "Expected arg #1 to be a Roact handle");
            assert(v0.of(v149) == v0.Element, "Expected arg #2 to be a Roact Element");
        end;
        v150.rootNode = v11(v150.rootNode, v149);
        return v148;
    end;
    v9 = {
        mountVirtualTree = v144, 
        unmountVirtualTree = v147, 
        updateVirtualTree = v151, 
        createVirtualNode = v109, 
        mountVirtualNode = v10, 
        unmountVirtualNode = v12, 
        updateVirtualNode = v11, 
        updateVirtualNodeWithChildren = v39, 
        updateVirtualNodeWithRenderResult = v43
    };
    return v9;
end;