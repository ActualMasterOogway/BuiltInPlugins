local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.React);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactFiberLane);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v11 = require(script.Parent.ReactFiberFlags);
local l_Placement_0 = v11.Placement;
local l_Deletion_0 = v11.Deletion;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = l_ReactSymbols_0.REACT_PORTAL_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l_REACT_BLOCK_TYPE_0 = l_ReactSymbols_0.REACT_BLOCK_TYPE;
local v21 = require(script.Parent.ReactWorkTags);
local _ = v21.FunctionComponent;
local _ = v21.ClassComponent;
local l_HostText_0 = v21.HostText;
local l_HostPortal_0 = v21.HostPortal;
local _ = v21.ForwardRef;
local l_Fragment_0 = v21.Fragment;
local _ = v21.SimpleMemoComponent;
local l_Block_0 = v21.Block;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableLazyElements_0 = l_ReactFeatureFlags_0.enableLazyElements;
local l_enableBlocksAPI_0 = l_ReactFeatureFlags_0.enableBlocksAPI;
local v34 = require(script.Parent["ReactFiber.new"]);
local l_createWorkInProgress_0 = v34.createWorkInProgress;
local l_resetWorkInProgress_0 = v34.resetWorkInProgress;
local l_createFiberFromElement_0 = v34.createFiberFromElement;
local l_createFiberFromFragment_0 = v34.createFiberFromFragment;
local l_createFiberFromText_0 = v34.createFiberFromText;
local l_createFiberFromPortal_0 = v34.createFiberFromPortal;
local v41 = {};
local v42 = nil;
local v43 = nil;
local v44 = nil;
local function v47(_, _) --[[ Line: 91 ]]

end;
if _G.__DEV__ then
    v42 = false;
    v43 = {};
    v44 = {};
    v47 = function(v48, v49) --[[ Line: 113 ]]
        -- upvalues: l_invariant_0 (copy), l_getComponentName_0 (copy), v43 (ref), l_console_0 (copy)
        if v48 == nil or typeof(v48) ~= "table" then
            return;
        elseif not v48._store or v48._store.validated or v48.key ~= nil then
            return;
        else
            local l_l_invariant_0_0 = l_invariant_0;
            local v51 = false;
            if v48._store ~= nil then
                v51 = typeof(v48._store) == "table";
            end;
            l_l_invariant_0_0(v51, "React Component in warnForMissingKey should have a _store. " .. "This error is likely caused by a bug in React. Please file an issue.");
            v48._store.validated = true;
            l_l_invariant_0_0 = l_getComponentName_0(v49.type) or "Component";
            if v43[l_l_invariant_0_0] then
                return;
            else
                v43[l_l_invariant_0_0] = true;
                l_console_0.error("Each child in a list should have a unique " .. "\"key\" prop. See https://reactjs.org/link/warning-keys for " .. "more information.");
                return;
            end;
        end;
    end;
end;
local l_isArray_0 = l_Array_0.isArray;
coerceRef = function(v53, _, v55) --[[ Line: 144 ]] --[[ Name: coerceRef ]]
    -- upvalues: l_getComponentName_0 (copy), l_Error_0 (copy)
    local l_ref_0 = v55.ref;
    if l_ref_0 ~= nil and typeof(l_ref_0) == "string" then
        if not v55._owner or not v55._self or v55._owner.stateNode == v55._self then
            local v57 = nil;
            v57 = if _G.__DEV__ then l_getComponentName_0(v53.type) or "Component" else "<enable __DEV__ mode for component names>";
            error(l_Error_0.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs " .. "has been removed. We recommend using " .. "useRef() or createRef() instead. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-string-ref", v57, (tostring(l_ref_0)))));
        end;
        if not v55._owner then
            error("Expected ref to be a function or an object returned by React.createRef(), or nil.");
        end;
    end;
    return l_ref_0;
end;
local function _(v58) --[[ Line: 311 ]] --[[ Name: warnOnFunctionType ]]
    -- upvalues: l_getComponentName_0 (copy), v44 (ref), l_console_0 (copy)
    if _G.__DEV__ then
        local v59 = l_getComponentName_0(v58.type) or "Component";
        if v44[v59] then
            return;
        else
            v44[v59] = true;
            l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
        end;
    end;
end;
resolveLazyType = function(v61) --[[ Line: 330 ]] --[[ Name: resolveLazyType ]]
    -- upvalues: l_describeError_0 (copy)
    local l__payload_0 = v61._payload;
    local l__init_0 = v61._init;
    local v64, v65 = xpcall(l__init_0, l_describeError_0, l__payload_0);
    if not v64 then
        return v61;
    else
        return v65;
    end;
end;
local function v381(v66) --[[ Line: 350 ]] --[[ Name: ChildReconciler ]]
    -- upvalues: l_Deletion_0 (copy), l_createWorkInProgress_0 (copy), l_Placement_0 (copy), l_HostText_0 (copy), l_createFiberFromText_0 (copy), l_enableBlocksAPI_0 (copy), l_Block_0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_createFiberFromElement_0 (copy), l_HostPortal_0 (copy), l_createFiberFromPortal_0 (copy), l_Fragment_0 (copy), l_createFiberFromFragment_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_enableLazyElements_0 (copy), l_getComponentName_0 (copy), v44 (ref), l_console_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v47 (ref), v42 (ref), l_isArray_0 (copy), l_getIteratorFn_0 (copy)
    local function _(v67, v68) --[[ Line: 351 ]] --[[ Name: deleteChild ]]
        -- upvalues: v66 (copy), l_Deletion_0 (ref)
        if not v66 then
            return;
        else
            local l_deletions_0 = v67.deletions;
            if l_deletions_0 == nil then
                v67.deletions = {
                    v68
                };
                v67.flags = bit32.bor(v67.flags, l_Deletion_0);
                return;
            else
                table.insert(l_deletions_0, v68);
                return;
            end;
        end;
    end;
    local function _(v71, v72) --[[ Line: 365 ]] --[[ Name: deleteRemainingChildren ]]
        -- upvalues: v66 (copy), l_Deletion_0 (ref)
        if not v66 then
            return nil;
        else
            local l_v72_0 = v72;
            while l_v72_0 ~= nil do
                local l_l_v72_0_0 = l_v72_0;
                if v66 then
                    local l_deletions_1 = v71.deletions;
                    if l_deletions_1 == nil then
                        v71.deletions = {
                            l_l_v72_0_0
                        };
                        v71.flags = bit32.bor(v71.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_1, l_l_v72_0_0);
                    end;
                end;
                l_v72_0 = l_v72_0.sibling;
            end;
            return nil;
        end;
    end;
    local function v81(_, v78) --[[ Line: 384 ]] --[[ Name: mapRemainingChildren ]]
        local v79 = {};
        local l_v78_0 = v78;
        while l_v78_0 ~= nil do
            if l_v78_0.key ~= nil then
                v79[l_v78_0.key] = l_v78_0;
            else
                v79[l_v78_0.index] = l_v78_0;
            end;
            l_v78_0 = l_v78_0.sibling;
        end;
        return v79;
    end;
    local function _(v82, v83) --[[ Line: 406 ]] --[[ Name: useFiber ]]
        -- upvalues: l_createWorkInProgress_0 (ref)
        local v84 = l_createWorkInProgress_0(v82, v83);
        v84.index = 1;
        v84.sibling = nil;
        return v84;
    end;
    local function _(v86, v87, v88) --[[ Line: 416 ]] --[[ Name: placeChild ]]
        -- upvalues: v66 (copy), l_Placement_0 (ref)
        v86.index = v88;
        if not v66 then
            return v87;
        else
            local l_alternate_0 = v86.alternate;
            if l_alternate_0 ~= nil then
                local l_index_0 = l_alternate_0.index;
                if l_index_0 < v87 then
                    v86.flags = bit32.bor(v86.flags, l_Placement_0);
                    return v87;
                else
                    return l_index_0;
                end;
            else
                v86.flags = bit32.bor(v86.flags, l_Placement_0);
                return v87;
            end;
        end;
    end;
    local function _(v92) --[[ Line: 444 ]] --[[ Name: placeSingleChild ]]
        -- upvalues: v66 (copy), l_Placement_0 (ref)
        if v66 and v92.alternate == nil then
            v92.flags = bit32.bor(v92.flags, l_Placement_0);
        end;
        return v92;
    end;
    local function _(v94, v95, v96, v97) --[[ Line: 453 ]] --[[ Name: updateTextNode ]]
        -- upvalues: l_HostText_0 (ref), l_createFiberFromText_0 (ref), l_createWorkInProgress_0 (ref)
        if v95 == nil or v95.tag ~= l_HostText_0 then
            local v98 = l_createFiberFromText_0(v96, v94.mode, v97);
            v98.return_ = v94;
            return v98;
        else
            local v99 = l_createWorkInProgress_0(v95, v96);
            v99.index = 1;
            v99.sibling = nil;
            local l_v99_0 = v99;
            l_v99_0.return_ = v94;
            return l_v99_0;
        end;
    end;
    local function v114(v102, v103, v104, v105) --[[ Line: 473 ]] --[[ Name: updateElement ]]
        -- upvalues: l_createWorkInProgress_0 (ref), l_enableBlocksAPI_0 (ref), l_Block_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_REACT_BLOCK_TYPE_0 (ref), l_createFiberFromElement_0 (ref)
        if v103 ~= nil then
            if v103.elementType == v104.type then
                local l_props_0 = v104.props;
                local v107 = l_createWorkInProgress_0(v103, l_props_0);
                v107.index = 1;
                v107.sibling = nil;
                local l_v107_0 = v107;
                l_v107_0.ref = coerceRef(v102, v103, v104);
                l_v107_0.return_ = v102;
                if _G.__DEV__ then
                    l_v107_0._debugSource = v104._source;
                    l_v107_0._debugOwner = v104._owner;
                end;
                return l_v107_0;
            elseif l_enableBlocksAPI_0 and v103.tag == l_Block_0 then
                local l_type_0 = v104.type;
                if typeof(l_type_0) == "table" and l_type_0["$$typeof"] == l_REACT_LAZY_TYPE_0 then
                    l_type_0 = resolveLazyType(l_type_0);
                end;
                if l_type_0["$$typeof"] == l_REACT_BLOCK_TYPE_0 and l_type_0._render == v103.type._render then
                    local l_props_1 = v104.props;
                    local v111 = l_createWorkInProgress_0(v103, l_props_1);
                    v111.index = 1;
                    v111.sibling = nil;
                    local l_v111_0 = v111;
                    l_v111_0.return_ = v102;
                    l_v111_0.type = l_type_0;
                    if _G.__DEV__ then
                        l_v111_0._debugSource = v104._source;
                        l_v111_0._debugOwner = v104._owner;
                    end;
                    return l_v111_0;
                end;
            end;
        end;
        local v113 = l_createFiberFromElement_0(v104, v102.mode, v105);
        v113.ref = coerceRef(v102, v103, v104);
        v113.return_ = v102;
        return v113;
    end;
    local function v123(v115, v116, v117, v118) --[[ Line: 526 ]] --[[ Name: updatePortal ]]
        -- upvalues: l_HostPortal_0 (ref), l_createFiberFromPortal_0 (ref), l_createWorkInProgress_0 (ref)
        if v116 == nil or v116.tag ~= l_HostPortal_0 or v116.stateNode.containerInfo ~= v117.containerInfo or v116.stateNode.implementation ~= v117.implementation then
            local v119 = l_createFiberFromPortal_0(v117, v115.mode, v118);
            v119.return_ = v115;
            return v119;
        else
            local v120 = v117.children or {};
            local v121 = l_createWorkInProgress_0(v116, v120);
            v121.index = 1;
            v121.sibling = nil;
            local l_v121_0 = v121;
            l_v121_0.return_ = v115;
            return l_v121_0;
        end;
    end;
    local function _(v124, v125, v126, v127, v128) --[[ Line: 552 ]] --[[ Name: updateFragment ]]
        -- upvalues: l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref)
        if v125 == nil or v125.tag ~= l_Fragment_0 then
            local v129 = l_createFiberFromFragment_0(v126, v124.mode, v127, v128);
            v129.return_ = v124;
            return v129;
        else
            local v130 = l_createWorkInProgress_0(v125, v126);
            v130.index = 1;
            v130.sibling = nil;
            local l_v130_0 = v130;
            l_v130_0.return_ = v124;
            return l_v130_0;
        end;
    end;
    local function _(v133, v134) --[[ Line: 583 ]] --[[ Name: assignStableKey ]]
        if v134.key == nil then
            local v135 = typeof(v133);
            if v135 == "string" or v135 == "number" then
                v134.key = v133;
                return;
            elseif v135 == "table" then
                v134.key = tostring(v133);
            end;
        end;
    end;
    local function v137(v138, v139, v140, v141) --[[ Line: 606 ]] --[[ Name: createChild ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_createFiberFromElement_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), l_createFiberFromPortal_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v137 (copy), l_createFiberFromFragment_0 (ref), l_createFiberFromText_0 (ref), l_getComponentName_0 (ref), v44 (ref), l_console_0 (ref)
        if v139 == nil then
            return nil;
        else
            local v142 = typeof(v139);
            if v142 == "table" then
                if v139.key == nil then
                    local v143 = typeof(v141);
                    if v143 == "string" or v143 == "number" then
                        v139.key = v141;
                    elseif v143 == "table" then
                        v139.key = tostring(v141);
                    end;
                end;
                local v144 = v139["$$typeof"];
                if v144 == l_REACT_ELEMENT_TYPE_0 then
                    local v145 = l_createFiberFromElement_0(v139, v138.mode, v140);
                    v145.ref = coerceRef(v138, nil, v139);
                    v145.return_ = v138;
                    return v145;
                elseif v144 == l_REACT_PORTAL_TYPE_0 then
                    local v146 = l_createFiberFromPortal_0(v139, v138.mode, v140);
                    v146.return_ = v138;
                    return v146;
                elseif v144 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_1 = v139._payload;
                    local l__init_1 = v139._init;
                    return v137(v138, l__init_1(l__payload_1), v140);
                else
                    local v149 = l_createFiberFromFragment_0(v139, v138.mode, v140, nil);
                    v149.return_ = v138;
                    return v149;
                end;
            elseif v142 == "string" or v142 == "number" then
                local v150 = l_createFiberFromText_0(tostring(v139), v138.mode, v140);
                v150.return_ = v138;
                return v150;
            else
                if _G.__DEV__ and v142 == "function" and _G.__DEV__ then
                    local v151 = l_getComponentName_0(v138.type) or "Component";
                    if not v44[v151] then
                        v44[v151] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v152(v153, v154, v155, v156, v157) --[[ Line: 684 ]] --[[ Name: updateSlot ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref), v114 (copy), l_REACT_PORTAL_TYPE_0 (ref), v123 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v152 (copy), l_HostText_0 (ref), l_createFiberFromText_0 (ref), l_getComponentName_0 (ref), v44 (ref), l_console_0 (ref)
        if v155 == nil then
            return nil;
        else
            local v158 = if v154 ~= nil then v154.key else nil;
            local v159 = typeof(v155);
            if v159 == "table" then
                if v155.key == nil then
                    local v160 = typeof(v157);
                    if v160 == "string" or v160 == "number" then
                        v155.key = v157;
                    elseif v160 == "table" then
                        v155.key = tostring(v157);
                    end;
                end;
                local v161 = v155["$$typeof"];
                if v161 == l_REACT_ELEMENT_TYPE_0 then
                    if v155.key == v158 then
                        if v155.type == l_REACT_FRAGMENT_TYPE_0 then
                            local l_children_0 = v155.props.children;
                            if v154 == nil or v154.tag ~= l_Fragment_0 then
                                local v163 = l_createFiberFromFragment_0(l_children_0, v153.mode, v156, v158);
                                v163.return_ = v153;
                                return v163;
                            else
                                local v164 = l_createWorkInProgress_0(v154, l_children_0);
                                v164.index = 1;
                                v164.sibling = nil;
                                local l_v164_0 = v164;
                                l_v164_0.return_ = v153;
                                return l_v164_0;
                            end;
                        else
                            return (v114(v153, v154, v155, v156));
                        end;
                    else
                        return nil;
                    end;
                elseif v161 == l_REACT_PORTAL_TYPE_0 then
                    if v155.key == v158 then
                        return (v123(v153, v154, v155, v156));
                    else
                        return nil;
                    end;
                elseif v161 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_2 = v155._payload;
                    local l__init_2 = v155._init;
                    return v152(v153, v154, l__init_2(l__payload_2), v156);
                elseif v158 ~= nil then
                    return nil;
                elseif v154 == nil or v154.tag ~= l_Fragment_0 then
                    local v168 = l_createFiberFromFragment_0(v155, v153.mode, v156, nil);
                    v168.return_ = v153;
                    return v168;
                else
                    local v169 = l_createWorkInProgress_0(v154, v155);
                    v169.index = 1;
                    v169.sibling = nil;
                    local l_v169_0 = v169;
                    l_v169_0.return_ = v153;
                    return l_v169_0;
                end;
            elseif v159 == "string" or v159 == "number" then
                if v158 ~= nil then
                    return nil;
                else
                    local v171 = tostring(v155);
                    if v154 == nil or v154.tag ~= l_HostText_0 then
                        local v172 = l_createFiberFromText_0(v171, v153.mode, v156);
                        v172.return_ = v153;
                        return v172;
                    else
                        local v173 = l_createWorkInProgress_0(v154, v171);
                        v173.index = 1;
                        v173.sibling = nil;
                        local l_v173_0 = v173;
                        l_v173_0.return_ = v153;
                        return l_v173_0;
                    end;
                end;
            else
                if _G.__DEV__ and v159 == "function" and _G.__DEV__ then
                    local v175 = l_getComponentName_0(v153.type) or "Component";
                    if not v44[v175] then
                        v44[v175] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v176(v177, v178, v179, v180, v181, v182) --[[ Line: 774 ]] --[[ Name: updateFromMap ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref), v114 (copy), l_REACT_PORTAL_TYPE_0 (ref), v123 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v176 (copy), l_HostText_0 (ref), l_createFiberFromText_0 (ref), l_getComponentName_0 (ref), v44 (ref), l_console_0 (ref)
        if v180 == nil then
            return nil;
        else
            local v183 = typeof(v180);
            if v183 == "table" then
                if v180.key == nil then
                    local v184 = typeof(v182);
                    if v184 == "string" or v184 == "number" then
                        v180.key = v182;
                    elseif v184 == "table" then
                        v180.key = tostring(v182);
                    end;
                end;
                local _ = nil;
                local v186 = v180["$$typeof"];
                if v186 == l_REACT_ELEMENT_TYPE_0 then
                    local v187 = v177[if v180.key == nil then v179 else v180.key];
                    if v180.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_children_1 = v180.props.children;
                        local l_key_0 = v180.key;
                        if v187 == nil or v187.tag ~= l_Fragment_0 then
                            local v190 = l_createFiberFromFragment_0(l_children_1, v178.mode, v181, l_key_0);
                            v190.return_ = v178;
                            return v190;
                        else
                            local v191 = l_createWorkInProgress_0(v187, l_children_1);
                            v191.index = 1;
                            v191.sibling = nil;
                            local l_v191_0 = v191;
                            l_v191_0.return_ = v178;
                            return l_v191_0;
                        end;
                    else
                        return (v114(v178, v187, v180, v181));
                    end;
                elseif v186 == l_REACT_PORTAL_TYPE_0 then
                    local v193 = v177[if v180.key == nil then v179 else v180.key];
                    return (v123(v178, v193, v180, v181));
                elseif v186 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_3 = v180._payload;
                    local l__init_3 = v180._init;
                    return v176(v177, v178, v179, l__init_3(l__payload_3), v181);
                else
                    local v196 = v177[v179];
                    if v196 == nil or v196.tag ~= l_Fragment_0 then
                        local v197 = l_createFiberFromFragment_0(v180, v178.mode, v181, nil);
                        v197.return_ = v178;
                        return v197;
                    else
                        local v198 = l_createWorkInProgress_0(v196, v180);
                        v198.index = 1;
                        v198.sibling = nil;
                        local l_v198_0 = v198;
                        l_v198_0.return_ = v178;
                        return l_v198_0;
                    end;
                end;
            elseif v183 == "string" or v183 == "number" then
                local v200 = v177[v179] or nil;
                local v201 = tostring(v180);
                if v200 == nil or v200.tag ~= l_HostText_0 then
                    local v202 = l_createFiberFromText_0(v201, v178.mode, v181);
                    v202.return_ = v178;
                    return v202;
                else
                    local v203 = l_createWorkInProgress_0(v200, v201);
                    v203.index = 1;
                    v203.sibling = nil;
                    local l_v203_0 = v203;
                    l_v203_0.return_ = v178;
                    return l_v203_0;
                end;
            else
                if _G.__DEV__ and v183 == "function" and _G.__DEV__ then
                    local v205 = l_getComponentName_0(v178.type) or "Component";
                    if not v44[v205] then
                        v44[v205] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v206(v207, v208, v209) --[[ Line: 868 ]] --[[ Name: warnOnInvalidKey ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), v47 (ref), l_console_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v206 (copy)
        if _G.__DEV__ then
            if typeof(v207) ~= "table" or v207 == nil then
                return v208;
            else
                local v210 = v207["$$typeof"];
                if v210 == l_REACT_ELEMENT_TYPE_0 or v210 == l_REACT_PORTAL_TYPE_0 then
                    v47(v207, v209);
                    local l_key_1 = v207.key;
                    if typeof(l_key_1) ~= "string" then
                        return v208;
                    elseif v208 == nil then
                        return {
                            [l_key_1] = true
                        };
                    elseif not v208[l_key_1] then
                        v208[l_key_1] = true;
                        return v208;
                    else
                        l_console_0.error("Encountered two children with the same key, `%s`. " .. "Keys should be unique so that components maintain their identity " .. "across updates. Non-unique keys may cause children to be " .. "duplicated and/or omitted \226\128\148 the behavior is unsupported and " .. "could change in a future version.", l_key_1);
                        return v208;
                    end;
                elseif v210 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_4 = v207._payload;
                    local l__init_4 = v207._init;
                    v206(l__init_4(l__payload_4), v208, v209);
                end;
            end;
        end;
        return v208;
    end;
    local function v254(v214, v215, v216, v217) --[[ Line: 913 ]] --[[ Name: reconcileChildrenArray ]]
        -- upvalues: v206 (copy), v152 (copy), v66 (copy), l_Deletion_0 (ref), l_Placement_0 (ref), v137 (copy), v81 (copy), v176 (copy)
        if _G.__DEV__ then
            local v218 = nil;
            for _, v220 in v216 do
                v218 = v206(v220, v218, v214);
            end;
        end;
        local v221 = nil;
        local v222 = nil;
        local l_v215_0 = v215;
        local v224 = 1;
        local v225 = 1;
        local v226 = nil;
        local v227 = #v216;
        while l_v215_0 ~= nil and v225 <= v227 do
            if v225 < l_v215_0.index then
                v226 = l_v215_0;
                l_v215_0 = nil;
            else
                v226 = l_v215_0.sibling;
            end;
            local v228 = nil;
            local v229 = v216[v225];
            v228 = if v229 ~= nil and typeof(v229) == "table" and v229["$$typeof"] ~= nil then v152(v214, l_v215_0, v229, v217, v225) else v152(v214, l_v215_0, v229, v217);
            if v228 == nil then
                if l_v215_0 == nil then
                    l_v215_0 = v226;
                    break;
                else
                    break;
                end;
            else
                if v66 and l_v215_0 and v228.alternate == nil then
                    local l_l_v215_0_0 = l_v215_0;
                    if v66 then
                        local l_deletions_2 = v214.deletions;
                        if l_deletions_2 == nil then
                            v214.deletions = {
                                l_l_v215_0_0
                            };
                            v214.flags = bit32.bor(v214.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_2, l_l_v215_0_0);
                        end;
                    end;
                end;
                local l_v228_0 = v228;
                local l_v224_0 = v224;
                l_v228_0.index = v225;
                if not v66 then
                    v224 = l_v224_0;
                else
                    local l_alternate_1 = l_v228_0.alternate;
                    if l_alternate_1 ~= nil then
                        local l_index_1 = l_alternate_1.index;
                        if l_index_1 < l_v224_0 then
                            l_v228_0.flags = bit32.bor(l_v228_0.flags, l_Placement_0);
                            v224 = l_v224_0;
                        else
                            v224 = l_index_1;
                        end;
                    else
                        l_v228_0.flags = bit32.bor(l_v228_0.flags, l_Placement_0);
                        v224 = l_v224_0;
                    end;
                end;
                if v222 == nil then
                    v221 = v228;
                else
                    v222.sibling = v228;
                end;
                v222 = v228;
                l_v215_0 = v226;
                v225 = v225 + 1;
            end;
        end;
        if v227 < v225 then
            local l_l_v215_0_1 = l_v215_0;
            if not v66 then
                return v221;
            else
                local l_l_l_v215_0_1_0 = l_l_v215_0_1;
                while l_l_l_v215_0_1_0 ~= nil do
                    local l_l_l_l_v215_0_1_0_0 = l_l_l_v215_0_1_0;
                    if v66 then
                        local l_deletions_3 = v214.deletions;
                        if l_deletions_3 == nil then
                            v214.deletions = {
                                l_l_l_l_v215_0_1_0_0
                            };
                            v214.flags = bit32.bor(v214.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_3, l_l_l_l_v215_0_1_0_0);
                        end;
                    end;
                    l_l_l_v215_0_1_0 = l_l_l_v215_0_1_0.sibling;
                end;
                return v221;
            end;
        elseif l_v215_0 == nil then
            while v225 <= v227 do
                local v240 = nil;
                local v241 = v216[v225];
                v240 = if v241 ~= nil and typeof(v241) == "table" and v241["$$typeof"] ~= nil then v137(v214, v241, v217, v225) else v137(v214, v241, v217);
                if v240 == nil then
                    v225 = v225 + 1;
                else
                    local l_v240_0 = v240;
                    local l_v224_1 = v224;
                    l_v240_0.index = v225;
                    if not v66 then
                        v224 = l_v224_1;
                    else
                        local l_alternate_2 = l_v240_0.alternate;
                        if l_alternate_2 ~= nil then
                            local l_index_2 = l_alternate_2.index;
                            if l_index_2 < l_v224_1 then
                                l_v240_0.flags = bit32.bor(l_v240_0.flags, l_Placement_0);
                                v224 = l_v224_1;
                            else
                                v224 = l_index_2;
                            end;
                        else
                            l_v240_0.flags = bit32.bor(l_v240_0.flags, l_Placement_0);
                            v224 = l_v224_1;
                        end;
                    end;
                    if v222 == nil then
                        v221 = v240;
                    else
                        v222.sibling = v240;
                    end;
                    v222 = v240;
                    v225 = v225 + 1;
                end;
            end;
            return v221;
        else
            local v246 = v81(v214, l_v215_0);
            while v225 <= v227 do
                local v247 = v176(v246, v214, v225, v216[v225], v217, v225);
                if v247 ~= nil then
                    if v66 and v247.alternate ~= nil then
                        v246[if v247.key == nil then v225 else v247.key] = nil;
                    end;
                    local l_v224_2 = v224;
                    v247.index = v225;
                    if not v66 then
                        v224 = l_v224_2;
                    else
                        local l_alternate_3 = v247.alternate;
                        if l_alternate_3 ~= nil then
                            local l_index_3 = l_alternate_3.index;
                            if l_index_3 < l_v224_2 then
                                v247.flags = bit32.bor(v247.flags, l_Placement_0);
                                v224 = l_v224_2;
                            else
                                v224 = l_index_3;
                            end;
                        else
                            v247.flags = bit32.bor(v247.flags, l_Placement_0);
                            v224 = l_v224_2;
                        end;
                    end;
                    if v222 == nil then
                        v221 = v247;
                    else
                        v222.sibling = v247;
                    end;
                    v222 = v247;
                end;
                v225 = v225 + 1;
            end;
            if v66 then
                for _, v252 in v246 do
                    if v66 then
                        local l_deletions_4 = v214.deletions;
                        if l_deletions_4 == nil then
                            v214.deletions = {
                                v252
                            };
                            v214.flags = bit32.bor(v214.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_4, v252);
                        end;
                    end;
                end;
            end;
            return v221;
        end;
    end;
    local function v294(v255, v256, v257, v258, v259) --[[ Line: 1116 ]] --[[ Name: reconcileChildrenIterator ]]
        -- upvalues: v42 (ref), l_console_0 (ref), v206 (copy), v152 (copy), v66 (copy), l_Deletion_0 (ref), l_Placement_0 (ref), v137 (copy), v81 (copy), v176 (copy)
        if _G.__DEV__ then
            if v257.entries == v259 then
                if not v42 then
                    l_console_0.error("Using Maps as children is not supported. " .. "Use an array of keyed ReactElements instead.");
                end;
                v42 = true;
            end;
            local v260 = v259(v257);
            if v260 then
                local v261 = nil;
                local v262 = v260.next();
                while not v262.done do
                    v262 = v260.next();
                    local l_value_0 = v262.value;
                    v261 = v206(l_value_0, v261, v255);
                end;
            end;
        end;
        local v264 = v259(v257);
        local v265 = nil;
        local v266 = nil;
        local l_v256_0 = v256;
        local v268 = 1;
        local v269 = 1;
        local v270 = nil;
        local v271 = v264.next();
        while l_v256_0 ~= nil and not v271.done do
            if v269 < l_v256_0.index then
                v270 = l_v256_0;
                l_v256_0 = nil;
            else
                v270 = l_v256_0.sibling;
            end;
            local v272 = v152(v255, l_v256_0, v271.value, v258, v271.key);
            if v272 == nil then
                if l_v256_0 == nil then
                    l_v256_0 = v270;
                    break;
                else
                    break;
                end;
            else
                if v66 and l_v256_0 and v272.alternate == nil then
                    local l_l_v256_0_0 = l_v256_0;
                    if v66 then
                        local l_deletions_5 = v255.deletions;
                        if l_deletions_5 == nil then
                            v255.deletions = {
                                l_l_v256_0_0
                            };
                            v255.flags = bit32.bor(v255.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_5, l_l_v256_0_0);
                        end;
                    end;
                end;
                local l_v268_0 = v268;
                v272.index = v269;
                if not v66 then
                    v268 = l_v268_0;
                else
                    local l_alternate_4 = v272.alternate;
                    if l_alternate_4 ~= nil then
                        local l_index_4 = l_alternate_4.index;
                        if l_index_4 < l_v268_0 then
                            v272.flags = bit32.bor(v272.flags, l_Placement_0);
                            v268 = l_v268_0;
                        else
                            v268 = l_index_4;
                        end;
                    else
                        v272.flags = bit32.bor(v272.flags, l_Placement_0);
                        v268 = l_v268_0;
                    end;
                end;
                if v266 == nil then
                    v265 = v272;
                else
                    v266.sibling = v272;
                end;
                v266 = v272;
                l_v256_0 = v270;
                v269 = v269 + 1;
                v271 = v264.next();
            end;
        end;
        if v271.done then
            local l_l_v256_0_1 = l_v256_0;
            if not v66 then
                return v265;
            else
                local l_l_l_v256_0_1_0 = l_l_v256_0_1;
                while l_l_l_v256_0_1_0 ~= nil do
                    local l_l_l_l_v256_0_1_0_0 = l_l_l_v256_0_1_0;
                    if v66 then
                        local l_deletions_6 = v255.deletions;
                        if l_deletions_6 == nil then
                            v255.deletions = {
                                l_l_l_l_v256_0_1_0_0
                            };
                            v255.flags = bit32.bor(v255.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_6, l_l_l_l_v256_0_1_0_0);
                        end;
                    end;
                    l_l_l_v256_0_1_0 = l_l_l_v256_0_1_0.sibling;
                end;
                return v265;
            end;
        elseif l_v256_0 == nil then
            while not v271.done do
                local v282 = v137(v255, v271.value, v258, v271.key);
                if v282 == nil then
                    v269 = v269 + 1;
                    v271 = v264.next();
                else
                    local l_v268_1 = v268;
                    v282.index = v269;
                    if not v66 then
                        v268 = l_v268_1;
                    else
                        local l_alternate_5 = v282.alternate;
                        if l_alternate_5 ~= nil then
                            local l_index_5 = l_alternate_5.index;
                            if l_index_5 < l_v268_1 then
                                v282.flags = bit32.bor(v282.flags, l_Placement_0);
                                v268 = l_v268_1;
                            else
                                v268 = l_index_5;
                            end;
                        else
                            v282.flags = bit32.bor(v282.flags, l_Placement_0);
                            v268 = l_v268_1;
                        end;
                    end;
                    if v266 == nil then
                        v265 = v282;
                    else
                        v266.sibling = v282;
                    end;
                    v266 = v282;
                    v269 = v269 + 1;
                    v271 = v264.next();
                end;
            end;
            return v265;
        else
            local v286 = nil;
            while not v271.done do
                if not v286 then
                    v286 = v81(v255, l_v256_0);
                end;
                local v287 = v176(v286, v255, v269, v271.value, v258, v271.key);
                if v287 ~= nil then
                    if v66 and v287.alternate ~= nil then
                        if v287.key == nil then
                            v286[v269] = nil;
                        else
                            v286[v287.key] = nil;
                        end;
                    end;
                    local l_v268_2 = v268;
                    v287.index = v269;
                    if not v66 then
                        v268 = l_v268_2;
                    else
                        local l_alternate_6 = v287.alternate;
                        if l_alternate_6 ~= nil then
                            local l_index_6 = l_alternate_6.index;
                            if l_index_6 < l_v268_2 then
                                v287.flags = bit32.bor(v287.flags, l_Placement_0);
                                v268 = l_v268_2;
                            else
                                v268 = l_index_6;
                            end;
                        else
                            v287.flags = bit32.bor(v287.flags, l_Placement_0);
                            v268 = l_v268_2;
                        end;
                    end;
                    if v266 == nil then
                        v265 = v287;
                    else
                        v266.sibling = v287;
                    end;
                    v266 = v287;
                end;
                v269 = v269 + 1;
                v271 = v264.next();
            end;
            if v66 then
                for _, v292 in v286 do
                    if v66 then
                        local l_deletions_7 = v255.deletions;
                        if l_deletions_7 == nil then
                            v255.deletions = {
                                v292
                            };
                            v255.flags = bit32.bor(v255.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_7, v292);
                        end;
                    end;
                end;
            end;
            return v265;
        end;
    end;
    local function v308(v295, v296, v297, v298) --[[ Line: 1334 ]] --[[ Name: reconcileSingleTextNode ]]
        -- upvalues: l_HostText_0 (ref), v66 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromText_0 (ref)
        if v296 ~= nil and v296.tag == l_HostText_0 then
            local l_sibling_0 = v296.sibling;
            if v66 then
                local l_l_sibling_0_0 = l_sibling_0;
                while l_l_sibling_0_0 ~= nil do
                    local l_l_l_sibling_0_0_0 = l_l_sibling_0_0;
                    if v66 then
                        local l_deletions_8 = v295.deletions;
                        if l_deletions_8 == nil then
                            v295.deletions = {
                                l_l_l_sibling_0_0_0
                            };
                            v295.flags = bit32.bor(v295.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_8, l_l_l_sibling_0_0_0);
                        end;
                    end;
                    l_l_sibling_0_0 = l_l_sibling_0_0.sibling;
                end;
            end;
            local v303 = l_createWorkInProgress_0(v296, v297);
            v303.index = 1;
            v303.sibling = nil;
            l_sibling_0 = v303;
            l_sibling_0.return_ = v295;
            return l_sibling_0;
        else
            if v66 then
                local l_v296_0 = v296;
                while l_v296_0 ~= nil do
                    local l_l_v296_0_0 = l_v296_0;
                    if v66 then
                        local l_deletions_9 = v295.deletions;
                        if l_deletions_9 == nil then
                            v295.deletions = {
                                l_l_v296_0_0
                            };
                            v295.flags = bit32.bor(v295.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_9, l_l_v296_0_0);
                        end;
                    end;
                    l_v296_0 = l_v296_0.sibling;
                end;
            end;
            local v307 = l_createFiberFromText_0(v297, v295.mode, v298);
            v307.return_ = v295;
            return v307;
        end;
    end;
    local function v338(v309, v310, v311, v312) --[[ Line: 1359 ]] --[[ Name: reconcileSingleElement ]]
        -- upvalues: l_Fragment_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), v66 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromFragment_0 (ref), l_createFiberFromElement_0 (ref)
        local v313 = false;
        local l_key_2 = v311.key;
        local l_v310_0 = v310;
        while l_v310_0 ~= nil do
            if l_v310_0.key == l_key_2 then
                if l_v310_0.tag == l_Fragment_0 then
                    if v311.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_sibling_1 = l_v310_0.sibling;
                        if v66 then
                            local l_l_sibling_1_0 = l_sibling_1;
                            while l_l_sibling_1_0 ~= nil do
                                local l_l_l_sibling_1_0_0 = l_l_sibling_1_0;
                                if v66 then
                                    local l_deletions_10 = v309.deletions;
                                    if l_deletions_10 == nil then
                                        v309.deletions = {
                                            l_l_l_sibling_1_0_0
                                        };
                                        v309.flags = bit32.bor(v309.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_10, l_l_l_sibling_1_0_0);
                                    end;
                                end;
                                l_l_sibling_1_0 = l_l_sibling_1_0.sibling;
                            end;
                        end;
                        local l_l_v310_0_0 = l_v310_0;
                        local l_children_2 = v311.props.children;
                        local v322 = l_createWorkInProgress_0(l_l_v310_0_0, l_children_2);
                        v322.index = 1;
                        v322.sibling = nil;
                        l_sibling_1 = v322;
                        l_sibling_1.return_ = v309;
                        if _G.__DEV__ then
                            l_sibling_1._debugSource = v311._source;
                            l_sibling_1._debugOwner = v311._owner;
                        end;
                        return l_sibling_1;
                    end;
                elseif l_v310_0.elementType == v311.type then
                    local l_sibling_2 = l_v310_0.sibling;
                    if v66 then
                        local l_l_sibling_2_0 = l_sibling_2;
                        while l_l_sibling_2_0 ~= nil do
                            local l_l_l_sibling_2_0_0 = l_l_sibling_2_0;
                            if v66 then
                                local l_deletions_11 = v309.deletions;
                                if l_deletions_11 == nil then
                                    v309.deletions = {
                                        l_l_l_sibling_2_0_0
                                    };
                                    v309.flags = bit32.bor(v309.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_11, l_l_l_sibling_2_0_0);
                                end;
                            end;
                            l_l_sibling_2_0 = l_l_sibling_2_0.sibling;
                        end;
                    end;
                    local l_l_v310_0_1 = l_v310_0;
                    local l_props_2 = v311.props;
                    local v329 = l_createWorkInProgress_0(l_l_v310_0_1, l_props_2);
                    v329.index = 1;
                    v329.sibling = nil;
                    l_sibling_2 = v329;
                    l_sibling_2.ref = coerceRef(v309, l_v310_0, v311);
                    l_sibling_2.return_ = v309;
                    if _G.__DEV__ then
                        l_sibling_2._debugSource = v311._source;
                        l_sibling_2._debugOwner = v311._owner;
                    end;
                    return l_sibling_2;
                end;
                local l_l_v310_0_2 = l_v310_0;
                if v66 then
                    local l_l_l_v310_0_2_0 = l_l_v310_0_2;
                    repeat
                        if l_l_l_v310_0_2_0 ~= nil then
                            local l_l_l_l_v310_0_2_0_0 = l_l_l_v310_0_2_0;
                            if v66 then
                                local l_deletions_12 = v309.deletions;
                                if l_deletions_12 == nil then
                                    v309.deletions = {
                                        l_l_l_l_v310_0_2_0_0
                                    };
                                    v309.flags = bit32.bor(v309.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_12, l_l_l_l_v310_0_2_0_0);
                                end;
                            end;
                            l_l_l_v310_0_2_0 = l_l_l_v310_0_2_0.sibling;
                        else
                            v313 = true;
                        end;
                    until v313;
                else
                    break;
                end;
            else
                local l_l_v310_0_3 = l_v310_0;
                if v66 then
                    local l_deletions_13 = v309.deletions;
                    if l_deletions_13 == nil then
                        v309.deletions = {
                            l_l_v310_0_3
                        };
                        v309.flags = bit32.bor(v309.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_13, l_l_v310_0_3);
                    end;
                end;
                l_v310_0 = l_v310_0.sibling;
            end;
            if v313 then
                break;
            end;
        end;
        v313 = false;
        if v311.type == l_REACT_FRAGMENT_TYPE_0 then
            local v336 = l_createFiberFromFragment_0(v311.props.children, v309.mode, v312, v311.key);
            v336.return_ = v309;
            return v336;
        else
            local v337 = l_createFiberFromElement_0(v311, v309.mode, v312);
            v337.ref = coerceRef(v309, v310, v311);
            v337.return_ = v309;
            return v337;
        end;
    end;
    local function v360(v339, v340, v341, v342) --[[ Line: 1459 ]] --[[ Name: reconcileSinglePortal ]]
        -- upvalues: l_HostPortal_0 (ref), v66 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromPortal_0 (ref)
        local v343 = false;
        local l_key_3 = v341.key;
        local l_v340_0 = v340;
        while l_v340_0 ~= nil do
            if l_v340_0.key == l_key_3 then
                if l_v340_0.tag == l_HostPortal_0 and l_v340_0.stateNode.containerInfo == v341.containerInfo and l_v340_0.stateNode.implementation == v341.implementation then
                    local l_sibling_3 = l_v340_0.sibling;
                    if v66 then
                        local l_l_sibling_3_0 = l_sibling_3;
                        while l_l_sibling_3_0 ~= nil do
                            local l_l_l_sibling_3_0_0 = l_l_sibling_3_0;
                            if v66 then
                                local l_deletions_14 = v339.deletions;
                                if l_deletions_14 == nil then
                                    v339.deletions = {
                                        l_l_l_sibling_3_0_0
                                    };
                                    v339.flags = bit32.bor(v339.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_14, l_l_l_sibling_3_0_0);
                                end;
                            end;
                            l_l_sibling_3_0 = l_l_sibling_3_0.sibling;
                        end;
                    end;
                    local l_l_v340_0_0 = l_v340_0;
                    local v351 = v341.children or {};
                    local v352 = l_createWorkInProgress_0(l_l_v340_0_0, v351);
                    v352.index = 1;
                    v352.sibling = nil;
                    l_sibling_3 = v352;
                    l_sibling_3.return_ = v339;
                    return l_sibling_3;
                else
                    local l_l_v340_0_1 = l_v340_0;
                    if v66 then
                        local l_l_l_v340_0_1_0 = l_l_v340_0_1;
                        repeat
                            if l_l_l_v340_0_1_0 ~= nil then
                                local l_l_l_l_v340_0_1_0_0 = l_l_l_v340_0_1_0;
                                if v66 then
                                    local l_deletions_15 = v339.deletions;
                                    if l_deletions_15 == nil then
                                        v339.deletions = {
                                            l_l_l_l_v340_0_1_0_0
                                        };
                                        v339.flags = bit32.bor(v339.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_15, l_l_l_l_v340_0_1_0_0);
                                    end;
                                end;
                                l_l_l_v340_0_1_0 = l_l_l_v340_0_1_0.sibling;
                            else
                                v343 = true;
                            end;
                        until v343;
                    else
                        break;
                    end;
                end;
            else
                local l_l_v340_0_2 = l_v340_0;
                if v66 then
                    local l_deletions_16 = v339.deletions;
                    if l_deletions_16 == nil then
                        v339.deletions = {
                            l_l_v340_0_2
                        };
                        v339.flags = bit32.bor(v339.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_16, l_l_v340_0_2);
                    end;
                end;
                l_v340_0 = l_v340_0.sibling;
            end;
            if v343 then
                break;
            end;
        end;
        v343 = false;
        local v359 = l_createFiberFromPortal_0(v341, v339.mode, v342);
        v359.return_ = v339;
        return v359;
    end;
    local function v361(v362, v363, v364, v365) --[[ Line: 1499 ]] --[[ Name: reconcileChildFibers ]]
        -- upvalues: l_REACT_FRAGMENT_TYPE_0 (ref), l_isArray_0 (ref), l_REACT_ELEMENT_TYPE_0 (ref), v338 (copy), v66 (copy), l_Placement_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), v360 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v361 (copy), v254 (copy), v308 (copy), l_getIteratorFn_0 (ref), v294 (copy), l_getComponentName_0 (ref), v44 (ref), l_console_0 (ref), l_Deletion_0 (ref)
        local v366 = typeof(v364);
        local v367 = false;
        if v364 ~= nil then
            v367 = false;
            if v366 == "table" then
                v367 = false;
                if v364.type == l_REACT_FRAGMENT_TYPE_0 then
                    v367 = v364.key == nil;
                end;
            end;
        end;
        if v367 then
            v364 = v364.props.children;
            v366 = typeof(v364);
        end;
        local v368 = l_isArray_0(v364);
        local v369 = false;
        if v364 ~= nil then
            v369 = false;
            if v366 == "table" then
                v369 = not v368;
            end;
        end;
        if v369 then
            local v370 = v364["$$typeof"];
            if v370 == l_REACT_ELEMENT_TYPE_0 then
                local v371 = v338(v362, v363, v364, v365);
                if v66 and v371.alternate == nil then
                    v371.flags = bit32.bor(v371.flags, l_Placement_0);
                end;
                return v371;
            elseif v370 == l_REACT_PORTAL_TYPE_0 then
                local v372 = v360(v362, v363, v364, v365);
                if v66 and v372.alternate == nil then
                    v372.flags = bit32.bor(v372.flags, l_Placement_0);
                end;
                return v372;
            elseif v370 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                local l__payload_5 = v364._payload;
                local l__init_5 = v364._init;
                return v361(v362, v363, l__init_5(l__payload_5), v365);
            end;
        elseif v368 then
            return (v254(v362, v363, v364, v365));
        elseif v366 == "string" or v366 == "number" then
            local v375 = v308(v362, v363, "" .. v364, v365);
            if v66 and v375.alternate == nil then
                v375.flags = bit32.bor(v375.flags, l_Placement_0);
            end;
            return v375;
        end;
        local v376 = l_getIteratorFn_0(v364);
        if v376 then
            return (v294(v362, v363, v364, v365, v376));
        else
            if _G.__DEV__ and v366 == "function" and _G.__DEV__ then
                local v377 = l_getComponentName_0(v362.type) or "Component";
                if not v44[v377] then
                    v44[v377] = true;
                    l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                end;
            end;
            if v364 ~= nil or not v367 then

            end;
            if not v66 then
                return nil;
            else
                local l_v363_0 = v363;
                while l_v363_0 ~= nil do
                    local l_l_v363_0_0 = l_v363_0;
                    if v66 then
                        local l_deletions_17 = v362.deletions;
                        if l_deletions_17 == nil then
                            v362.deletions = {
                                l_l_v363_0_0
                            };
                            v362.flags = bit32.bor(v362.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_17, l_l_v363_0_0);
                        end;
                    end;
                    l_v363_0 = l_v363_0.sibling;
                end;
                return nil;
            end;
        end;
    end;
    return v361;
end;
v41.reconcileChildFibers = v381(true);
v41.mountChildFibers = v381(false);
v41.cloneChildFibers = function(v382, v383) --[[ Line: 1646 ]]
    -- upvalues: l_invariant_0 (copy), l_createWorkInProgress_0 (copy)
    local l_l_invariant_0_1 = l_invariant_0;
    local v385 = true;
    if v382 ~= nil then
        v385 = v383.child == v382.child;
    end;
    l_l_invariant_0_1(v385, "Resuming work not yet implemented.");
    if v383.child == nil then
        return;
    else
        l_l_invariant_0_1 = v383.child;
        v385 = l_createWorkInProgress_0(l_l_invariant_0_1, l_l_invariant_0_1.pendingProps);
        v383.child = v385;
        v385.return_ = v383;
        while l_l_invariant_0_1.sibling ~= nil do
            l_l_invariant_0_1 = l_l_invariant_0_1.sibling;
            v385.sibling = l_createWorkInProgress_0(l_l_invariant_0_1, l_l_invariant_0_1.pendingProps);
            v385 = v385.sibling;
            v385.return_ = v383;
        end;
        v385.sibling = nil;
        return;
    end;
end;
v41.resetChildFibers = function(v386, v387) --[[ Line: 1672 ]]
    -- upvalues: l_resetWorkInProgress_0 (copy)
    local l_child_0 = v386.child;
    while l_child_0 ~= nil do
        l_resetWorkInProgress_0(l_child_0, v387);
        l_child_0 = l_child_0.sibling;
    end;
end;
return v41;