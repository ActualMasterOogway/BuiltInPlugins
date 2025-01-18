local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.React);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactFiberLane);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v12 = require(script.Parent.ReactFiberFlags);
local l_Placement_0 = v12.Placement;
local l_Deletion_0 = v12.Deletion;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = l_ReactSymbols_0.REACT_PORTAL_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l_REACT_BLOCK_TYPE_0 = l_ReactSymbols_0.REACT_BLOCK_TYPE;
local v22 = require(script.Parent.ReactWorkTags);
local _ = v22.FunctionComponent;
local _ = v22.ClassComponent;
local l_HostText_0 = v22.HostText;
local l_HostPortal_0 = v22.HostPortal;
local _ = v22.ForwardRef;
local l_Fragment_0 = v22.Fragment;
local _ = v22.SimpleMemoComponent;
local l_Block_0 = v22.Block;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableLazyElements_0 = l_ReactFeatureFlags_0.enableLazyElements;
local l_enableBlocksAPI_0 = l_ReactFeatureFlags_0.enableBlocksAPI;
local v35 = require(script.Parent["ReactFiber.new"]);
local l_createWorkInProgress_0 = v35.createWorkInProgress;
local l_resetWorkInProgress_0 = v35.resetWorkInProgress;
local l_createFiberFromElement_0 = v35.createFiberFromElement;
local l_createFiberFromFragment_0 = v35.createFiberFromFragment;
local l_createFiberFromText_0 = v35.createFiberFromText;
local l_createFiberFromPortal_0 = v35.createFiberFromPortal;
local v42 = {};
local v43 = nil;
local v44 = nil;
local v45 = nil;
local function v48(_, _) --[[ Line: 91 ]]

end;
if l___DEV___0 then
    v43 = false;
    v44 = {};
    v45 = {};
    v48 = function(v49, v50) --[[ Line: 113 ]]
        -- upvalues: l_invariant_0 (copy), l_getComponentName_0 (copy), v44 (ref), l_console_0 (copy)
        if v49 == nil or type(v49) ~= "table" then
            return;
        elseif not v49._store or v49._store.validated or v49.key ~= nil then
            return;
        else
            local l_l_invariant_0_0 = l_invariant_0;
            local v52 = false;
            if v49._store ~= nil then
                v52 = type(v49._store) == "table";
            end;
            l_l_invariant_0_0(v52, "React Component in warnForMissingKey should have a _store. " .. "This error is likely caused by a bug in React. Please file an issue.");
            v49._store.validated = true;
            l_l_invariant_0_0 = l_getComponentName_0(v50.type) or "Component";
            if v44[l_l_invariant_0_0] then
                return;
            else
                v44[l_l_invariant_0_0] = true;
                l_console_0.error("Each child in a list should have a unique " .. "\"key\" prop. See https://reactjs.org/link/warning-keys for " .. "more information.");
                return;
            end;
        end;
    end;
end;
local l_isArray_0 = l_Array_0.isArray;
coerceRef = function(v54, _, v56) --[[ Line: 144 ]] --[[ Name: coerceRef ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), l_Error_0 (copy)
    local l_ref_0 = v56.ref;
    if l_ref_0 ~= nil and type(l_ref_0) == "string" then
        if not v56._owner or not v56._self or v56._owner.stateNode == v56._self then
            local v58 = nil;
            v58 = if l___DEV___0 then l_getComponentName_0(v54.type) or "Component" else "<enable __DEV__ mode for component names>";
            error(l_Error_0.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs " .. "has been removed. We recommend using " .. "useRef() or createRef() instead. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-string-ref", v58, (tostring(l_ref_0)))));
        end;
        if not v56._owner then
            error("Expected ref to be a function or an object returned by React.createRef(), or nil.");
        end;
    end;
    return l_ref_0;
end;
local function _(v59) --[[ Line: 317 ]] --[[ Name: warnOnFunctionType ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), v45 (ref), l_console_0 (copy)
    if l___DEV___0 then
        local v60 = l_getComponentName_0(v59.type) or "Component";
        if v45[v60] then
            return;
        else
            v45[v60] = true;
            l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
        end;
    end;
end;
resolveLazyType = function(v62) --[[ Line: 336 ]] --[[ Name: resolveLazyType ]]
    -- upvalues: l_describeError_0 (copy)
    local l__payload_0 = v62._payload;
    local l__init_0 = v62._init;
    local v65, v66 = xpcall(l__init_0, l_describeError_0, l__payload_0);
    if not v65 then
        return v62;
    else
        return v66;
    end;
end;
local function v382(v67) --[[ Line: 354 ]] --[[ Name: ChildReconciler ]]
    -- upvalues: l_Deletion_0 (copy), l_createWorkInProgress_0 (copy), l_Placement_0 (copy), l_HostText_0 (copy), l_createFiberFromText_0 (copy), l___DEV___0 (copy), l_enableBlocksAPI_0 (copy), l_Block_0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_createFiberFromElement_0 (copy), l_HostPortal_0 (copy), l_createFiberFromPortal_0 (copy), l_Fragment_0 (copy), l_createFiberFromFragment_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_enableLazyElements_0 (copy), l_getComponentName_0 (copy), v45 (ref), l_console_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v48 (ref), v43 (ref), l_isArray_0 (copy), l_getIteratorFn_0 (copy)
    local function _(v68, v69) --[[ Line: 355 ]] --[[ Name: deleteChild ]]
        -- upvalues: v67 (copy), l_Deletion_0 (ref)
        if not v67 then
            return;
        else
            local l_deletions_0 = v68.deletions;
            if l_deletions_0 == nil then
                v68.deletions = {
                    v69
                };
                v68.flags = bit32.bor(v68.flags, l_Deletion_0);
                return;
            else
                table.insert(l_deletions_0, v69);
                return;
            end;
        end;
    end;
    local function _(v72, v73) --[[ Line: 369 ]] --[[ Name: deleteRemainingChildren ]]
        -- upvalues: v67 (copy), l_Deletion_0 (ref)
        if not v67 then
            return nil;
        else
            local l_v73_0 = v73;
            while l_v73_0 ~= nil do
                local l_l_v73_0_0 = l_v73_0;
                if v67 then
                    local l_deletions_1 = v72.deletions;
                    if l_deletions_1 == nil then
                        v72.deletions = {
                            l_l_v73_0_0
                        };
                        v72.flags = bit32.bor(v72.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_1, l_l_v73_0_0);
                    end;
                end;
                l_v73_0 = l_v73_0.sibling;
            end;
            return nil;
        end;
    end;
    local function v82(_, v79) --[[ Line: 388 ]] --[[ Name: mapRemainingChildren ]]
        local v80 = {};
        local l_v79_0 = v79;
        while l_v79_0 ~= nil do
            if l_v79_0.key ~= nil then
                v80[l_v79_0.key] = l_v79_0;
            else
                v80[l_v79_0.index] = l_v79_0;
            end;
            l_v79_0 = l_v79_0.sibling;
        end;
        return v80;
    end;
    local function _(v83, v84) --[[ Line: 410 ]] --[[ Name: useFiber ]]
        -- upvalues: l_createWorkInProgress_0 (ref)
        local v85 = l_createWorkInProgress_0(v83, v84);
        v85.index = 1;
        v85.sibling = nil;
        return v85;
    end;
    local function _(v87, v88, v89) --[[ Line: 420 ]] --[[ Name: placeChild ]]
        -- upvalues: v67 (copy), l_Placement_0 (ref)
        v87.index = v89;
        if not v67 then
            return v88;
        else
            local l_alternate_0 = v87.alternate;
            if l_alternate_0 ~= nil then
                local l_index_0 = l_alternate_0.index;
                if l_index_0 < v88 then
                    v87.flags = bit32.bor(v87.flags, l_Placement_0);
                    return v88;
                else
                    return l_index_0;
                end;
            else
                v87.flags = bit32.bor(v87.flags, l_Placement_0);
                return v88;
            end;
        end;
    end;
    local function _(v93) --[[ Line: 448 ]] --[[ Name: placeSingleChild ]]
        -- upvalues: v67 (copy), l_Placement_0 (ref)
        if v67 and v93.alternate == nil then
            v93.flags = bit32.bor(v93.flags, l_Placement_0);
        end;
        return v93;
    end;
    local function _(v95, v96, v97, v98) --[[ Line: 457 ]] --[[ Name: updateTextNode ]]
        -- upvalues: l_HostText_0 (ref), l_createFiberFromText_0 (ref), l_createWorkInProgress_0 (ref)
        if v96 == nil or v96.tag ~= l_HostText_0 then
            local v99 = l_createFiberFromText_0(v97, v95.mode, v98);
            v99.return_ = v95;
            return v99;
        else
            local v100 = l_createWorkInProgress_0(v96, v97);
            v100.index = 1;
            v100.sibling = nil;
            local l_v100_0 = v100;
            l_v100_0.return_ = v95;
            return l_v100_0;
        end;
    end;
    local function v115(v103, v104, v105, v106) --[[ Line: 477 ]] --[[ Name: updateElement ]]
        -- upvalues: l_createWorkInProgress_0 (ref), l___DEV___0 (ref), l_enableBlocksAPI_0 (ref), l_Block_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_REACT_BLOCK_TYPE_0 (ref), l_createFiberFromElement_0 (ref)
        if v104 ~= nil then
            if v104.elementType == v105.type then
                local l_props_0 = v105.props;
                local v108 = l_createWorkInProgress_0(v104, l_props_0);
                v108.index = 1;
                v108.sibling = nil;
                local l_v108_0 = v108;
                l_v108_0.ref = coerceRef(v103, v104, v105);
                l_v108_0.return_ = v103;
                if l___DEV___0 then
                    l_v108_0._debugSource = v105._source;
                    l_v108_0._debugOwner = v105._owner;
                end;
                return l_v108_0;
            elseif l_enableBlocksAPI_0 and v104.tag == l_Block_0 then
                local l_type_0 = v105.type;
                if type(l_type_0) == "table" and l_type_0["$$typeof"] == l_REACT_LAZY_TYPE_0 then
                    l_type_0 = resolveLazyType(l_type_0);
                end;
                if l_type_0["$$typeof"] == l_REACT_BLOCK_TYPE_0 and l_type_0._render == v104.type._render then
                    local l_props_1 = v105.props;
                    local v112 = l_createWorkInProgress_0(v104, l_props_1);
                    v112.index = 1;
                    v112.sibling = nil;
                    local l_v112_0 = v112;
                    l_v112_0.return_ = v103;
                    l_v112_0.type = l_type_0;
                    if l___DEV___0 then
                        l_v112_0._debugSource = v105._source;
                        l_v112_0._debugOwner = v105._owner;
                    end;
                    return l_v112_0;
                end;
            end;
        end;
        local v114 = l_createFiberFromElement_0(v105, v103.mode, v106);
        v114.ref = coerceRef(v103, v104, v105);
        v114.return_ = v103;
        return v114;
    end;
    local function v124(v116, v117, v118, v119) --[[ Line: 530 ]] --[[ Name: updatePortal ]]
        -- upvalues: l_HostPortal_0 (ref), l_createFiberFromPortal_0 (ref), l_createWorkInProgress_0 (ref)
        if v117 == nil or v117.tag ~= l_HostPortal_0 or v117.stateNode.containerInfo ~= v118.containerInfo or v117.stateNode.implementation ~= v118.implementation then
            local v120 = l_createFiberFromPortal_0(v118, v116.mode, v119);
            v120.return_ = v116;
            return v120;
        else
            local v121 = v118.children or {};
            local v122 = l_createWorkInProgress_0(v117, v121);
            v122.index = 1;
            v122.sibling = nil;
            local l_v122_0 = v122;
            l_v122_0.return_ = v116;
            return l_v122_0;
        end;
    end;
    local function _(v125, v126, v127, v128, v129) --[[ Line: 555 ]] --[[ Name: updateFragment ]]
        -- upvalues: l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref)
        if v126 == nil or v126.tag ~= l_Fragment_0 then
            local v130 = l_createFiberFromFragment_0(v127, v125.mode, v128, v129);
            v130.return_ = v125;
            return v130;
        else
            local v131 = l_createWorkInProgress_0(v126, v127);
            v131.index = 1;
            v131.sibling = nil;
            local l_v131_0 = v131;
            l_v131_0.return_ = v125;
            return l_v131_0;
        end;
    end;
    local function _(v134, v135) --[[ Line: 582 ]] --[[ Name: assignStableKey ]]
        if v135.key == nil then
            local v136 = type(v134);
            if v136 == "string" or v136 == "number" then
                v135.key = v134;
                return;
            elseif v136 == "table" then
                v135.key = tostring(v134);
            end;
        end;
    end;
    local function v138(v139, v140, v141, v142) --[[ Line: 601 ]] --[[ Name: createChild ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_createFiberFromElement_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), l_createFiberFromPortal_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v138 (copy), l_createFiberFromFragment_0 (ref), l_createFiberFromText_0 (ref), l___DEV___0 (ref), l_getComponentName_0 (ref), v45 (ref), l_console_0 (ref)
        if v140 == nil then
            return nil;
        else
            local v143 = type(v140);
            if v143 == "table" then
                if v140.key == nil then
                    local v144 = type(v142);
                    if v144 == "string" or v144 == "number" then
                        v140.key = v142;
                    elseif v144 == "table" then
                        v140.key = tostring(v142);
                    end;
                end;
                local v145 = v140["$$typeof"];
                if v145 == l_REACT_ELEMENT_TYPE_0 then
                    local v146 = l_createFiberFromElement_0(v140, v139.mode, v141);
                    v146.ref = coerceRef(v139, nil, v140);
                    v146.return_ = v139;
                    return v146;
                elseif v145 == l_REACT_PORTAL_TYPE_0 then
                    local v147 = l_createFiberFromPortal_0(v140, v139.mode, v141);
                    v147.return_ = v139;
                    return v147;
                elseif v145 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_1 = v140._payload;
                    local l__init_1 = v140._init;
                    return v138(v139, l__init_1(l__payload_1), v141);
                else
                    local v150 = l_createFiberFromFragment_0(v140, v139.mode, v141, nil);
                    v150.return_ = v139;
                    return v150;
                end;
            elseif v143 == "string" or v143 == "number" then
                local v151 = l_createFiberFromText_0(tostring(v140), v139.mode, v141);
                v151.return_ = v139;
                return v151;
            else
                if l___DEV___0 and v143 == "function" and l___DEV___0 then
                    local v152 = l_getComponentName_0(v139.type) or "Component";
                    if not v45[v152] then
                        v45[v152] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v153(v154, v155, v156, v157, v158) --[[ Line: 672 ]] --[[ Name: updateSlot ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref), v115 (copy), l_REACT_PORTAL_TYPE_0 (ref), v124 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v153 (copy), l_HostText_0 (ref), l_createFiberFromText_0 (ref), l___DEV___0 (ref), l_getComponentName_0 (ref), v45 (ref), l_console_0 (ref)
        if v156 == nil then
            return nil;
        else
            local v159 = if v155 ~= nil then v155.key else nil;
            local v160 = type(v156);
            if v160 == "table" then
                if v156.key == nil then
                    local v161 = type(v158);
                    if v161 == "string" or v161 == "number" then
                        v156.key = v158;
                    elseif v161 == "table" then
                        v156.key = tostring(v158);
                    end;
                end;
                local v162 = v156["$$typeof"];
                if v162 == l_REACT_ELEMENT_TYPE_0 then
                    if v156.key == v159 then
                        if v156.type == l_REACT_FRAGMENT_TYPE_0 then
                            local l_children_0 = v156.props.children;
                            if v155 == nil or v155.tag ~= l_Fragment_0 then
                                local v164 = l_createFiberFromFragment_0(l_children_0, v154.mode, v157, v159);
                                v164.return_ = v154;
                                return v164;
                            else
                                local v165 = l_createWorkInProgress_0(v155, l_children_0);
                                v165.index = 1;
                                v165.sibling = nil;
                                local l_v165_0 = v165;
                                l_v165_0.return_ = v154;
                                return l_v165_0;
                            end;
                        else
                            return (v115(v154, v155, v156, v157));
                        end;
                    else
                        return nil;
                    end;
                elseif v162 == l_REACT_PORTAL_TYPE_0 then
                    if v156.key == v159 then
                        return (v124(v154, v155, v156, v157));
                    else
                        return nil;
                    end;
                elseif v162 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_2 = v156._payload;
                    local l__init_2 = v156._init;
                    return v153(v154, v155, l__init_2(l__payload_2), v157);
                elseif v159 ~= nil then
                    return nil;
                elseif v155 == nil or v155.tag ~= l_Fragment_0 then
                    local v169 = l_createFiberFromFragment_0(v156, v154.mode, v157, nil);
                    v169.return_ = v154;
                    return v169;
                else
                    local v170 = l_createWorkInProgress_0(v155, v156);
                    v170.index = 1;
                    v170.sibling = nil;
                    local l_v170_0 = v170;
                    l_v170_0.return_ = v154;
                    return l_v170_0;
                end;
            elseif v160 == "string" or v160 == "number" then
                if v159 ~= nil then
                    return nil;
                else
                    local v172 = tostring(v156);
                    if v155 == nil or v155.tag ~= l_HostText_0 then
                        local v173 = l_createFiberFromText_0(v172, v154.mode, v157);
                        v173.return_ = v154;
                        return v173;
                    else
                        local v174 = l_createWorkInProgress_0(v155, v172);
                        v174.index = 1;
                        v174.sibling = nil;
                        local l_v174_0 = v174;
                        l_v174_0.return_ = v154;
                        return l_v174_0;
                    end;
                end;
            else
                if l___DEV___0 and v160 == "function" and l___DEV___0 then
                    local v176 = l_getComponentName_0(v154.type) or "Component";
                    if not v45[v176] then
                        v45[v176] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v177(v178, v179, v180, v181, v182, v183) --[[ Line: 760 ]] --[[ Name: updateFromMap ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref), v115 (copy), l_REACT_PORTAL_TYPE_0 (ref), v124 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v177 (copy), l_HostText_0 (ref), l_createFiberFromText_0 (ref), l___DEV___0 (ref), l_getComponentName_0 (ref), v45 (ref), l_console_0 (ref)
        if v181 == nil then
            return nil;
        else
            local v184 = type(v181);
            if v184 == "table" then
                if v181.key == nil then
                    local v185 = type(v183);
                    if v185 == "string" or v185 == "number" then
                        v181.key = v183;
                    elseif v185 == "table" then
                        v181.key = tostring(v183);
                    end;
                end;
                local _ = nil;
                local v187 = v181["$$typeof"];
                if v187 == l_REACT_ELEMENT_TYPE_0 then
                    local v188 = v178[if v181.key == nil then v180 else v181.key];
                    if v181.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_children_1 = v181.props.children;
                        local l_key_0 = v181.key;
                        if v188 == nil or v188.tag ~= l_Fragment_0 then
                            local v191 = l_createFiberFromFragment_0(l_children_1, v179.mode, v182, l_key_0);
                            v191.return_ = v179;
                            return v191;
                        else
                            local v192 = l_createWorkInProgress_0(v188, l_children_1);
                            v192.index = 1;
                            v192.sibling = nil;
                            local l_v192_0 = v192;
                            l_v192_0.return_ = v179;
                            return l_v192_0;
                        end;
                    else
                        return (v115(v179, v188, v181, v182));
                    end;
                elseif v187 == l_REACT_PORTAL_TYPE_0 then
                    local v194 = v178[if v181.key == nil then v180 else v181.key];
                    return (v124(v179, v194, v181, v182));
                elseif v187 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_3 = v181._payload;
                    local l__init_3 = v181._init;
                    return v177(v178, v179, v180, l__init_3(l__payload_3), v182);
                else
                    local v197 = v178[v180];
                    if v197 == nil or v197.tag ~= l_Fragment_0 then
                        local v198 = l_createFiberFromFragment_0(v181, v179.mode, v182, nil);
                        v198.return_ = v179;
                        return v198;
                    else
                        local v199 = l_createWorkInProgress_0(v197, v181);
                        v199.index = 1;
                        v199.sibling = nil;
                        local l_v199_0 = v199;
                        l_v199_0.return_ = v179;
                        return l_v199_0;
                    end;
                end;
            elseif v184 == "string" or v184 == "number" then
                local v201 = v178[v180] or nil;
                local v202 = tostring(v181);
                if v201 == nil or v201.tag ~= l_HostText_0 then
                    local v203 = l_createFiberFromText_0(v202, v179.mode, v182);
                    v203.return_ = v179;
                    return v203;
                else
                    local v204 = l_createWorkInProgress_0(v201, v202);
                    v204.index = 1;
                    v204.sibling = nil;
                    local l_v204_0 = v204;
                    l_v204_0.return_ = v179;
                    return l_v204_0;
                end;
            else
                if l___DEV___0 and v184 == "function" and l___DEV___0 then
                    local v206 = l_getComponentName_0(v179.type) or "Component";
                    if not v45[v206] then
                        v45[v206] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v207(v208, v209, v210) --[[ Line: 854 ]] --[[ Name: warnOnInvalidKey ]]
        -- upvalues: l___DEV___0 (ref), l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), v48 (ref), l_console_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v207 (copy)
        if l___DEV___0 then
            if v208 == nil or type(v208) ~= "table" then
                return v209;
            else
                local v211 = v208["$$typeof"];
                if v211 == l_REACT_ELEMENT_TYPE_0 or v211 == l_REACT_PORTAL_TYPE_0 then
                    v48(v208, v210);
                    local l_key_1 = v208.key;
                    if type(l_key_1) ~= "string" then
                        return v209;
                    elseif v209 == nil then
                        return {
                            [l_key_1] = true
                        };
                    elseif not v209[l_key_1] then
                        v209[l_key_1] = true;
                        return v209;
                    else
                        l_console_0.error("Encountered two children with the same key, `%s`. " .. "Keys should be unique so that components maintain their identity " .. "across updates. Non-unique keys may cause children to be " .. "duplicated and/or omitted \226\128\148 the behavior is unsupported and " .. "could change in a future version.", l_key_1);
                        return v209;
                    end;
                elseif v211 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_4 = v208._payload;
                    local l__init_4 = v208._init;
                    v207(l__init_4(l__payload_4), v209, v210);
                end;
            end;
        end;
        return v209;
    end;
    local function v255(v215, v216, v217, v218) --[[ Line: 896 ]] --[[ Name: reconcileChildrenArray ]]
        -- upvalues: l___DEV___0 (ref), v207 (copy), v153 (copy), v67 (copy), l_Deletion_0 (ref), l_Placement_0 (ref), v138 (copy), v82 (copy), v177 (copy)
        if l___DEV___0 then
            local v219 = nil;
            for _, v221 in v217 do
                v219 = v207(v221, v219, v215);
            end;
        end;
        local v222 = nil;
        local v223 = nil;
        local l_v216_0 = v216;
        local v225 = 1;
        local v226 = 1;
        local v227 = nil;
        local v228 = #v217;
        while l_v216_0 ~= nil and v226 <= v228 do
            if v226 < l_v216_0.index then
                v227 = l_v216_0;
                l_v216_0 = nil;
            else
                v227 = l_v216_0.sibling;
            end;
            local v229 = nil;
            local v230 = v217[v226];
            v229 = if v230 ~= nil and type(v230) == "table" and v230["$$typeof"] ~= nil then v153(v215, l_v216_0, v230, v218, v226) else v153(v215, l_v216_0, v230, v218);
            if v229 == nil then
                if l_v216_0 == nil then
                    l_v216_0 = v227;
                    break;
                else
                    break;
                end;
            else
                if v67 and l_v216_0 and v229.alternate == nil then
                    local l_l_v216_0_0 = l_v216_0;
                    if v67 then
                        local l_deletions_2 = v215.deletions;
                        if l_deletions_2 == nil then
                            v215.deletions = {
                                l_l_v216_0_0
                            };
                            v215.flags = bit32.bor(v215.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_2, l_l_v216_0_0);
                        end;
                    end;
                end;
                local l_v229_0 = v229;
                local l_v225_0 = v225;
                l_v229_0.index = v226;
                if not v67 then
                    v225 = l_v225_0;
                else
                    local l_alternate_1 = l_v229_0.alternate;
                    if l_alternate_1 ~= nil then
                        local l_index_1 = l_alternate_1.index;
                        if l_index_1 < l_v225_0 then
                            l_v229_0.flags = bit32.bor(l_v229_0.flags, l_Placement_0);
                            v225 = l_v225_0;
                        else
                            v225 = l_index_1;
                        end;
                    else
                        l_v229_0.flags = bit32.bor(l_v229_0.flags, l_Placement_0);
                        v225 = l_v225_0;
                    end;
                end;
                if v223 == nil then
                    v222 = v229;
                else
                    v223.sibling = v229;
                end;
                v223 = v229;
                l_v216_0 = v227;
                v226 = v226 + 1;
            end;
        end;
        if v228 < v226 then
            local l_l_v216_0_1 = l_v216_0;
            if not v67 then
                return v222;
            else
                local l_l_l_v216_0_1_0 = l_l_v216_0_1;
                while l_l_l_v216_0_1_0 ~= nil do
                    local l_l_l_l_v216_0_1_0_0 = l_l_l_v216_0_1_0;
                    if v67 then
                        local l_deletions_3 = v215.deletions;
                        if l_deletions_3 == nil then
                            v215.deletions = {
                                l_l_l_l_v216_0_1_0_0
                            };
                            v215.flags = bit32.bor(v215.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_3, l_l_l_l_v216_0_1_0_0);
                        end;
                    end;
                    l_l_l_v216_0_1_0 = l_l_l_v216_0_1_0.sibling;
                end;
                return v222;
            end;
        elseif l_v216_0 == nil then
            while v226 <= v228 do
                local v241 = nil;
                local v242 = v217[v226];
                v241 = if v242 ~= nil and type(v242) == "table" and v242["$$typeof"] ~= nil then v138(v215, v242, v218, v226) else v138(v215, v242, v218);
                if v241 == nil then
                    v226 = v226 + 1;
                else
                    local l_v241_0 = v241;
                    local l_v225_1 = v225;
                    l_v241_0.index = v226;
                    if not v67 then
                        v225 = l_v225_1;
                    else
                        local l_alternate_2 = l_v241_0.alternate;
                        if l_alternate_2 ~= nil then
                            local l_index_2 = l_alternate_2.index;
                            if l_index_2 < l_v225_1 then
                                l_v241_0.flags = bit32.bor(l_v241_0.flags, l_Placement_0);
                                v225 = l_v225_1;
                            else
                                v225 = l_index_2;
                            end;
                        else
                            l_v241_0.flags = bit32.bor(l_v241_0.flags, l_Placement_0);
                            v225 = l_v225_1;
                        end;
                    end;
                    if v223 == nil then
                        v222 = v241;
                    else
                        v223.sibling = v241;
                    end;
                    v223 = v241;
                    v226 = v226 + 1;
                end;
            end;
            return v222;
        else
            local v247 = v82(v215, l_v216_0);
            while v226 <= v228 do
                local v248 = v177(v247, v215, v226, v217[v226], v218, v226);
                if v248 ~= nil then
                    if v67 and v248.alternate ~= nil then
                        v247[if v248.key == nil then v226 else v248.key] = nil;
                    end;
                    local l_v225_2 = v225;
                    v248.index = v226;
                    if not v67 then
                        v225 = l_v225_2;
                    else
                        local l_alternate_3 = v248.alternate;
                        if l_alternate_3 ~= nil then
                            local l_index_3 = l_alternate_3.index;
                            if l_index_3 < l_v225_2 then
                                v248.flags = bit32.bor(v248.flags, l_Placement_0);
                                v225 = l_v225_2;
                            else
                                v225 = l_index_3;
                            end;
                        else
                            v248.flags = bit32.bor(v248.flags, l_Placement_0);
                            v225 = l_v225_2;
                        end;
                    end;
                    if v223 == nil then
                        v222 = v248;
                    else
                        v223.sibling = v248;
                    end;
                    v223 = v248;
                end;
                v226 = v226 + 1;
            end;
            if v67 then
                for _, v253 in v247 do
                    if v67 then
                        local l_deletions_4 = v215.deletions;
                        if l_deletions_4 == nil then
                            v215.deletions = {
                                v253
                            };
                            v215.flags = bit32.bor(v215.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_4, v253);
                        end;
                    end;
                end;
            end;
            return v222;
        end;
    end;
    local function v295(v256, v257, v258, v259, v260) --[[ Line: 1103 ]] --[[ Name: reconcileChildrenIterator ]]
        -- upvalues: l___DEV___0 (ref), v43 (ref), l_console_0 (ref), v207 (copy), v153 (copy), v67 (copy), l_Deletion_0 (ref), l_Placement_0 (ref), v138 (copy), v82 (copy), v177 (copy)
        if l___DEV___0 then
            if v258.entries == v260 then
                if not v43 then
                    l_console_0.error("Using Maps as children is not supported. " .. "Use an array of keyed ReactElements instead.");
                end;
                v43 = true;
            end;
            local v261 = v260(v258);
            if v261 then
                local v262 = nil;
                local v263 = v261.next();
                while not v263.done do
                    v263 = v261.next();
                    local l_value_0 = v263.value;
                    v262 = v207(l_value_0, v262, v256);
                end;
            end;
        end;
        local v265 = v260(v258);
        local v266 = nil;
        local v267 = nil;
        local l_v257_0 = v257;
        local v269 = 1;
        local v270 = 1;
        local v271 = nil;
        local v272 = v265.next();
        while l_v257_0 ~= nil and not v272.done do
            if v270 < l_v257_0.index then
                v271 = l_v257_0;
                l_v257_0 = nil;
            else
                v271 = l_v257_0.sibling;
            end;
            local v273 = v153(v256, l_v257_0, v272.value, v259, v272.key);
            if v273 == nil then
                if l_v257_0 == nil then
                    l_v257_0 = v271;
                    break;
                else
                    break;
                end;
            else
                if v67 and l_v257_0 and v273.alternate == nil then
                    local l_l_v257_0_0 = l_v257_0;
                    if v67 then
                        local l_deletions_5 = v256.deletions;
                        if l_deletions_5 == nil then
                            v256.deletions = {
                                l_l_v257_0_0
                            };
                            v256.flags = bit32.bor(v256.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_5, l_l_v257_0_0);
                        end;
                    end;
                end;
                local l_v269_0 = v269;
                v273.index = v270;
                if not v67 then
                    v269 = l_v269_0;
                else
                    local l_alternate_4 = v273.alternate;
                    if l_alternate_4 ~= nil then
                        local l_index_4 = l_alternate_4.index;
                        if l_index_4 < l_v269_0 then
                            v273.flags = bit32.bor(v273.flags, l_Placement_0);
                            v269 = l_v269_0;
                        else
                            v269 = l_index_4;
                        end;
                    else
                        v273.flags = bit32.bor(v273.flags, l_Placement_0);
                        v269 = l_v269_0;
                    end;
                end;
                if v267 == nil then
                    v266 = v273;
                else
                    v267.sibling = v273;
                end;
                v267 = v273;
                l_v257_0 = v271;
                v270 = v270 + 1;
                v272 = v265.next();
            end;
        end;
        if v272.done then
            local l_l_v257_0_1 = l_v257_0;
            if not v67 then
                return v266;
            else
                local l_l_l_v257_0_1_0 = l_l_v257_0_1;
                while l_l_l_v257_0_1_0 ~= nil do
                    local l_l_l_l_v257_0_1_0_0 = l_l_l_v257_0_1_0;
                    if v67 then
                        local l_deletions_6 = v256.deletions;
                        if l_deletions_6 == nil then
                            v256.deletions = {
                                l_l_l_l_v257_0_1_0_0
                            };
                            v256.flags = bit32.bor(v256.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_6, l_l_l_l_v257_0_1_0_0);
                        end;
                    end;
                    l_l_l_v257_0_1_0 = l_l_l_v257_0_1_0.sibling;
                end;
                return v266;
            end;
        elseif l_v257_0 == nil then
            while not v272.done do
                local v283 = v138(v256, v272.value, v259, v272.key);
                if v283 == nil then
                    v270 = v270 + 1;
                    v272 = v265.next();
                else
                    local l_v269_1 = v269;
                    v283.index = v270;
                    if not v67 then
                        v269 = l_v269_1;
                    else
                        local l_alternate_5 = v283.alternate;
                        if l_alternate_5 ~= nil then
                            local l_index_5 = l_alternate_5.index;
                            if l_index_5 < l_v269_1 then
                                v283.flags = bit32.bor(v283.flags, l_Placement_0);
                                v269 = l_v269_1;
                            else
                                v269 = l_index_5;
                            end;
                        else
                            v283.flags = bit32.bor(v283.flags, l_Placement_0);
                            v269 = l_v269_1;
                        end;
                    end;
                    if v267 == nil then
                        v266 = v283;
                    else
                        v267.sibling = v283;
                    end;
                    v267 = v283;
                    v270 = v270 + 1;
                    v272 = v265.next();
                end;
            end;
            return v266;
        else
            local v287 = nil;
            while not v272.done do
                if not v287 then
                    v287 = v82(v256, l_v257_0);
                end;
                local v288 = v177(v287, v256, v270, v272.value, v259, v272.key);
                if v288 ~= nil then
                    if v67 and v288.alternate ~= nil then
                        if v288.key == nil then
                            v287[v270] = nil;
                        else
                            v287[v288.key] = nil;
                        end;
                    end;
                    local l_v269_2 = v269;
                    v288.index = v270;
                    if not v67 then
                        v269 = l_v269_2;
                    else
                        local l_alternate_6 = v288.alternate;
                        if l_alternate_6 ~= nil then
                            local l_index_6 = l_alternate_6.index;
                            if l_index_6 < l_v269_2 then
                                v288.flags = bit32.bor(v288.flags, l_Placement_0);
                                v269 = l_v269_2;
                            else
                                v269 = l_index_6;
                            end;
                        else
                            v288.flags = bit32.bor(v288.flags, l_Placement_0);
                            v269 = l_v269_2;
                        end;
                    end;
                    if v267 == nil then
                        v266 = v288;
                    else
                        v267.sibling = v288;
                    end;
                    v267 = v288;
                end;
                v270 = v270 + 1;
                v272 = v265.next();
            end;
            if v67 then
                for _, v293 in v287 do
                    if v67 then
                        local l_deletions_7 = v256.deletions;
                        if l_deletions_7 == nil then
                            v256.deletions = {
                                v293
                            };
                            v256.flags = bit32.bor(v256.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_7, v293);
                        end;
                    end;
                end;
            end;
            return v266;
        end;
    end;
    local function v309(v296, v297, v298, v299) --[[ Line: 1316 ]] --[[ Name: reconcileSingleTextNode ]]
        -- upvalues: l_HostText_0 (ref), v67 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromText_0 (ref)
        if v297 ~= nil and v297.tag == l_HostText_0 then
            local l_sibling_0 = v297.sibling;
            if v67 then
                local l_l_sibling_0_0 = l_sibling_0;
                while l_l_sibling_0_0 ~= nil do
                    local l_l_l_sibling_0_0_0 = l_l_sibling_0_0;
                    if v67 then
                        local l_deletions_8 = v296.deletions;
                        if l_deletions_8 == nil then
                            v296.deletions = {
                                l_l_l_sibling_0_0_0
                            };
                            v296.flags = bit32.bor(v296.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_8, l_l_l_sibling_0_0_0);
                        end;
                    end;
                    l_l_sibling_0_0 = l_l_sibling_0_0.sibling;
                end;
            end;
            local v304 = l_createWorkInProgress_0(v297, v298);
            v304.index = 1;
            v304.sibling = nil;
            l_sibling_0 = v304;
            l_sibling_0.return_ = v296;
            return l_sibling_0;
        else
            if v67 then
                local l_v297_0 = v297;
                while l_v297_0 ~= nil do
                    local l_l_v297_0_0 = l_v297_0;
                    if v67 then
                        local l_deletions_9 = v296.deletions;
                        if l_deletions_9 == nil then
                            v296.deletions = {
                                l_l_v297_0_0
                            };
                            v296.flags = bit32.bor(v296.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_9, l_l_v297_0_0);
                        end;
                    end;
                    l_v297_0 = l_v297_0.sibling;
                end;
            end;
            local v308 = l_createFiberFromText_0(v298, v296.mode, v299);
            v308.return_ = v296;
            return v308;
        end;
    end;
    local function v339(v310, v311, v312, v313) --[[ Line: 1341 ]] --[[ Name: reconcileSingleElement ]]
        -- upvalues: l_Fragment_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), v67 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l___DEV___0 (ref), l_createFiberFromFragment_0 (ref), l_createFiberFromElement_0 (ref)
        local v314 = false;
        local l_key_2 = v312.key;
        local l_v311_0 = v311;
        while l_v311_0 ~= nil do
            if l_v311_0.key == l_key_2 then
                if l_v311_0.tag == l_Fragment_0 then
                    if v312.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_sibling_1 = l_v311_0.sibling;
                        if v67 then
                            local l_l_sibling_1_0 = l_sibling_1;
                            while l_l_sibling_1_0 ~= nil do
                                local l_l_l_sibling_1_0_0 = l_l_sibling_1_0;
                                if v67 then
                                    local l_deletions_10 = v310.deletions;
                                    if l_deletions_10 == nil then
                                        v310.deletions = {
                                            l_l_l_sibling_1_0_0
                                        };
                                        v310.flags = bit32.bor(v310.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_10, l_l_l_sibling_1_0_0);
                                    end;
                                end;
                                l_l_sibling_1_0 = l_l_sibling_1_0.sibling;
                            end;
                        end;
                        local l_l_v311_0_0 = l_v311_0;
                        local l_children_2 = v312.props.children;
                        local v323 = l_createWorkInProgress_0(l_l_v311_0_0, l_children_2);
                        v323.index = 1;
                        v323.sibling = nil;
                        l_sibling_1 = v323;
                        l_sibling_1.return_ = v310;
                        if l___DEV___0 then
                            l_sibling_1._debugSource = v312._source;
                            l_sibling_1._debugOwner = v312._owner;
                        end;
                        return l_sibling_1;
                    end;
                elseif l_v311_0.elementType == v312.type then
                    local l_sibling_2 = l_v311_0.sibling;
                    if v67 then
                        local l_l_sibling_2_0 = l_sibling_2;
                        while l_l_sibling_2_0 ~= nil do
                            local l_l_l_sibling_2_0_0 = l_l_sibling_2_0;
                            if v67 then
                                local l_deletions_11 = v310.deletions;
                                if l_deletions_11 == nil then
                                    v310.deletions = {
                                        l_l_l_sibling_2_0_0
                                    };
                                    v310.flags = bit32.bor(v310.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_11, l_l_l_sibling_2_0_0);
                                end;
                            end;
                            l_l_sibling_2_0 = l_l_sibling_2_0.sibling;
                        end;
                    end;
                    local l_l_v311_0_1 = l_v311_0;
                    local l_props_2 = v312.props;
                    local v330 = l_createWorkInProgress_0(l_l_v311_0_1, l_props_2);
                    v330.index = 1;
                    v330.sibling = nil;
                    l_sibling_2 = v330;
                    l_sibling_2.ref = coerceRef(v310, l_v311_0, v312);
                    l_sibling_2.return_ = v310;
                    if l___DEV___0 then
                        l_sibling_2._debugSource = v312._source;
                        l_sibling_2._debugOwner = v312._owner;
                    end;
                    return l_sibling_2;
                end;
                local l_l_v311_0_2 = l_v311_0;
                if v67 then
                    local l_l_l_v311_0_2_0 = l_l_v311_0_2;
                    repeat
                        if l_l_l_v311_0_2_0 ~= nil then
                            local l_l_l_l_v311_0_2_0_0 = l_l_l_v311_0_2_0;
                            if v67 then
                                local l_deletions_12 = v310.deletions;
                                if l_deletions_12 == nil then
                                    v310.deletions = {
                                        l_l_l_l_v311_0_2_0_0
                                    };
                                    v310.flags = bit32.bor(v310.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_12, l_l_l_l_v311_0_2_0_0);
                                end;
                            end;
                            l_l_l_v311_0_2_0 = l_l_l_v311_0_2_0.sibling;
                        else
                            v314 = true;
                        end;
                    until v314;
                else
                    break;
                end;
            else
                local l_l_v311_0_3 = l_v311_0;
                if v67 then
                    local l_deletions_13 = v310.deletions;
                    if l_deletions_13 == nil then
                        v310.deletions = {
                            l_l_v311_0_3
                        };
                        v310.flags = bit32.bor(v310.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_13, l_l_v311_0_3);
                    end;
                end;
                l_v311_0 = l_v311_0.sibling;
            end;
            if v314 then
                break;
            end;
        end;
        v314 = false;
        if v312.type == l_REACT_FRAGMENT_TYPE_0 then
            local v337 = l_createFiberFromFragment_0(v312.props.children, v310.mode, v313, v312.key);
            v337.return_ = v310;
            return v337;
        else
            local v338 = l_createFiberFromElement_0(v312, v310.mode, v313);
            v338.ref = coerceRef(v310, v311, v312);
            v338.return_ = v310;
            return v338;
        end;
    end;
    local function v361(v340, v341, v342, v343) --[[ Line: 1441 ]] --[[ Name: reconcileSinglePortal ]]
        -- upvalues: l_HostPortal_0 (ref), v67 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromPortal_0 (ref)
        local v344 = false;
        local l_key_3 = v342.key;
        local l_v341_0 = v341;
        while l_v341_0 ~= nil do
            if l_v341_0.key == l_key_3 then
                if l_v341_0.tag == l_HostPortal_0 and l_v341_0.stateNode.containerInfo == v342.containerInfo and l_v341_0.stateNode.implementation == v342.implementation then
                    local l_sibling_3 = l_v341_0.sibling;
                    if v67 then
                        local l_l_sibling_3_0 = l_sibling_3;
                        while l_l_sibling_3_0 ~= nil do
                            local l_l_l_sibling_3_0_0 = l_l_sibling_3_0;
                            if v67 then
                                local l_deletions_14 = v340.deletions;
                                if l_deletions_14 == nil then
                                    v340.deletions = {
                                        l_l_l_sibling_3_0_0
                                    };
                                    v340.flags = bit32.bor(v340.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_14, l_l_l_sibling_3_0_0);
                                end;
                            end;
                            l_l_sibling_3_0 = l_l_sibling_3_0.sibling;
                        end;
                    end;
                    local l_l_v341_0_0 = l_v341_0;
                    local v352 = v342.children or {};
                    local v353 = l_createWorkInProgress_0(l_l_v341_0_0, v352);
                    v353.index = 1;
                    v353.sibling = nil;
                    l_sibling_3 = v353;
                    l_sibling_3.return_ = v340;
                    return l_sibling_3;
                else
                    local l_l_v341_0_1 = l_v341_0;
                    if v67 then
                        local l_l_l_v341_0_1_0 = l_l_v341_0_1;
                        repeat
                            if l_l_l_v341_0_1_0 ~= nil then
                                local l_l_l_l_v341_0_1_0_0 = l_l_l_v341_0_1_0;
                                if v67 then
                                    local l_deletions_15 = v340.deletions;
                                    if l_deletions_15 == nil then
                                        v340.deletions = {
                                            l_l_l_l_v341_0_1_0_0
                                        };
                                        v340.flags = bit32.bor(v340.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_15, l_l_l_l_v341_0_1_0_0);
                                    end;
                                end;
                                l_l_l_v341_0_1_0 = l_l_l_v341_0_1_0.sibling;
                            else
                                v344 = true;
                            end;
                        until v344;
                    else
                        break;
                    end;
                end;
            else
                local l_l_v341_0_2 = l_v341_0;
                if v67 then
                    local l_deletions_16 = v340.deletions;
                    if l_deletions_16 == nil then
                        v340.deletions = {
                            l_l_v341_0_2
                        };
                        v340.flags = bit32.bor(v340.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_16, l_l_v341_0_2);
                    end;
                end;
                l_v341_0 = l_v341_0.sibling;
            end;
            if v344 then
                break;
            end;
        end;
        v344 = false;
        local v360 = l_createFiberFromPortal_0(v342, v340.mode, v343);
        v360.return_ = v340;
        return v360;
    end;
    local function v362(v363, v364, v365, v366) --[[ Line: 1480 ]] --[[ Name: reconcileChildFibers ]]
        -- upvalues: l_REACT_FRAGMENT_TYPE_0 (ref), l_isArray_0 (ref), l_REACT_ELEMENT_TYPE_0 (ref), v339 (copy), v67 (copy), l_Placement_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), v361 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v362 (copy), v255 (copy), v309 (copy), l_getIteratorFn_0 (ref), v295 (copy), l___DEV___0 (ref), l_getComponentName_0 (ref), v45 (ref), l_console_0 (ref), l_Deletion_0 (ref)
        local v367 = type(v365);
        local v368 = false;
        if v365 ~= nil then
            v368 = false;
            if v367 == "table" then
                v368 = false;
                if v365.type == l_REACT_FRAGMENT_TYPE_0 then
                    v368 = v365.key == nil;
                end;
            end;
        end;
        if v368 then
            v365 = v365.props.children;
            v367 = type(v365);
        end;
        local v369 = l_isArray_0(v365);
        local v370 = false;
        if v365 ~= nil then
            v370 = false;
            if v367 == "table" then
                v370 = not v369;
            end;
        end;
        if v370 then
            local v371 = v365["$$typeof"];
            if v371 == l_REACT_ELEMENT_TYPE_0 then
                local v372 = v339(v363, v364, v365, v366);
                if v67 and v372.alternate == nil then
                    v372.flags = bit32.bor(v372.flags, l_Placement_0);
                end;
                return v372;
            elseif v371 == l_REACT_PORTAL_TYPE_0 then
                local v373 = v361(v363, v364, v365, v366);
                if v67 and v373.alternate == nil then
                    v373.flags = bit32.bor(v373.flags, l_Placement_0);
                end;
                return v373;
            elseif v371 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                local l__payload_5 = v365._payload;
                local l__init_5 = v365._init;
                return v362(v363, v364, l__init_5(l__payload_5), v366);
            end;
        elseif v369 then
            return (v255(v363, v364, v365, v366));
        elseif v367 == "string" or v367 == "number" then
            local v376 = v309(v363, v364, tostring(v365), v366);
            if v67 and v376.alternate == nil then
                v376.flags = bit32.bor(v376.flags, l_Placement_0);
            end;
            return v376;
        end;
        local v377 = l_getIteratorFn_0(v365);
        if v377 then
            return (v295(v363, v364, v365, v366, v377));
        else
            if l___DEV___0 and v367 == "function" and l___DEV___0 then
                local v378 = l_getComponentName_0(v363.type) or "Component";
                if not v45[v378] then
                    v45[v378] = true;
                    l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                end;
            end;
            if v365 ~= nil or not v368 then

            end;
            if not v67 then
                return nil;
            else
                local l_v364_0 = v364;
                while l_v364_0 ~= nil do
                    local l_l_v364_0_0 = l_v364_0;
                    if v67 then
                        local l_deletions_17 = v363.deletions;
                        if l_deletions_17 == nil then
                            v363.deletions = {
                                l_l_v364_0_0
                            };
                            v363.flags = bit32.bor(v363.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_17, l_l_v364_0_0);
                        end;
                    end;
                    l_v364_0 = l_v364_0.sibling;
                end;
                return nil;
            end;
        end;
    end;
    return v362;
end;
v42.reconcileChildFibers = v382(true);
v42.mountChildFibers = v382(false);
v42.cloneChildFibers = function(_, v384) --[[ Line: 1628 ]]
    -- upvalues: l_createWorkInProgress_0 (copy)
    if v384.child == nil then
        return;
    else
        local l_child_0 = v384.child;
        local v386 = l_createWorkInProgress_0(l_child_0, l_child_0.pendingProps);
        v384.child = v386;
        v386.return_ = v384;
        while l_child_0.sibling ~= nil do
            l_child_0 = l_child_0.sibling;
            v386.sibling = l_createWorkInProgress_0(l_child_0, l_child_0.pendingProps);
            v386 = v386.sibling;
            v386.return_ = v384;
        end;
        v386.sibling = nil;
        return;
    end;
end;
v42.resetChildFibers = function(v387, v388) --[[ Line: 1655 ]]
    -- upvalues: l_resetWorkInProgress_0 (copy)
    local l_child_1 = v387.child;
    while l_child_1 ~= nil do
        l_resetWorkInProgress_0(l_child_1, v388);
        l_child_1 = l_child_1.sibling;
    end;
end;
return v42;