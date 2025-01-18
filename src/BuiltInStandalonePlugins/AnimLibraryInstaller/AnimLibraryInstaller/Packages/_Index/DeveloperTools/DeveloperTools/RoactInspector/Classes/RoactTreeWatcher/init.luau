local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getSymbol);
local v3 = require(l_Parent_0.RoactInspector.Utils.getChildAtKey);
local v4 = require(l_Parent_1.Dash);
local l_append_0 = v4.append;
local l_class_0 = v4.class;
local l_collectArray_0 = v4.collectArray;
local l_pick_0 = v4.pick;
local l_keys_0 = v4.keys;
local l_last_0 = v4.last;
local l_map_0 = v4.map;
local l_mapOne_0 = v4.mapOne;
local l_reduce_0 = v4.reduce;
local l_reverse_0 = v4.reverse;
local l_slice_0 = v4.slice;
local l_insert_0 = table.insert;
local v20 = l_class_0("RoactTreeWatcher", function(v17, v18, v19) --[[ Line: 26 ]]
    return {
        debugInterface = v17, 
        tree = v18, 
        onPathChanged = v19, 
        cachedRoot = {
            branchData = {}, 
            childNodes = {}
        }
    };
end);
v20._init = function(v21) --[[ Line: 40 ]] --[[ Name: _init ]]
    v21.onPoll = function() --[[ Line: 42 ]]
        -- upvalues: v21 (copy)
        if v21.tree then
            v21:_checkNodes();
            delay(0.25, v21.onPoll);
        end;
    end;
end;
v20.getRootNode = function(v22) --[[ Line: 50 ]] --[[ Name: getRootNode ]]
    -- upvalues: v2 (copy)
    return v2(v22.tree, "InternalData").rootNode;
end;
v20.monitor = function(v23) --[[ Line: 55 ]] --[[ Name: monitor ]]
    spawn(v23.onPoll);
end;
v20._checkNodes = function(v24) --[[ Line: 59 ]] --[[ Name: _checkNodes ]]
    v24:_checkNode(v24:getRootNode(), v24.cachedRoot, {});
end;
v20._checkNode = function(v25, v26, v27, v28) --[[ Line: 64 ]] --[[ Name: _checkNode ]]
    -- upvalues: l_collectArray_0 (copy), l_pick_0 (copy), l_append_0 (copy), v3 (copy)
    local v29 = v25:_getBranchNodes(v26);
    local v34 = l_collectArray_0(v29, function(v30, v31) --[[ Line: 66 ]]
        -- upvalues: v27 (copy)
        local v32 = v27.branchData[v30];
        local v33 = v31.instance or v31.currentElement;
        if not v32 or v33.props ~= v32.props or v33.state ~= v32.state then
            v27.branchData[v30] = {
                props = v33.props, 
                state = v33.state
            };
            return v30;
        else
            return nil;
        end;
    end);
    if #v34 > 0 then
        v25.onPathChanged(v28, v34);
    end;
    local v35 = v25:getHostNode(v26);
    v27.childNodes = l_pick_0(v27.childNodes, function(v36, v37) --[[ Line: 83 ]]
        -- upvalues: l_append_0 (ref), v28 (copy), v3 (ref), v35 (copy), v25 (copy)
        local v38 = l_append_0({}, v28, {
            v37
        });
        local v39 = v3(v35.children, v37);
        if v39 then
            v25:_checkNode(v39, v36, v38);
            return true;
        else
            return false;
        end;
    end);
end;
v20.getNode = function(v40, v41) --[[ Line: 96 ]] --[[ Name: getNode ]]
    -- upvalues: l_reduce_0 (copy), v3 (copy)
    local v42 = v40:getHostNode((v40:getRootNode()));
    return l_reduce_0(v41, function(v43, v44) --[[ Line: 100 ]]
        -- upvalues: v3 (ref), v40 (copy)
        if v43 and v43.children then
            local v45 = v3(v43.children, v44);
            return v45 and v40:getHostNode(v45) or nil;
        else
            return nil;
        end;
    end, v42);
end;
v20.watchPath = function(v46, v47) --[[ Line: 110 ]] --[[ Name: watchPath ]]
    -- upvalues: l_reduce_0 (copy), v3 (copy)
    local v48 = v46:getRootNode();
    local l_cachedRoot_0 = v46.cachedRoot;
    l_cachedRoot_0.branchData = v46:_getBranchData(v48);
    l_reduce_0(v47, function(v50, v51) --[[ Line: 117 ]]
        -- upvalues: l_cachedRoot_0 (ref), v3 (ref), v46 (copy)
        if not v50 then
            return nil;
        else
            l_cachedRoot_0.childNodes[v51] = l_cachedRoot_0.childNodes[v51] or {
                childNodes = {}
            };
            l_cachedRoot_0 = l_cachedRoot_0.childNodes[v51];
            local v52 = v3(v50.children, v51);
            if not v52 then
                return nil;
            else
                l_cachedRoot_0.branchData = v46:_getBranchData(v52);
                return v46:getHostNode(v52);
            end;
        end;
    end, v46:getHostNode(v48));
end;
v20._getBranchData = function(v53, v54) --[[ Line: 134 ]] --[[ Name: _getBranchData ]]
    -- upvalues: l_map_0 (copy)
    local v55 = v53:_getBranchNodes(v54);
    return l_map_0(v55, function(v56) --[[ Line: 136 ]]
        local v57 = v56.instance or v56.currentElement;
        return {
            props = v57.props, 
            state = v57.state
        };
    end);
end;
v20.getChildren = function(v58, v59, v60, v61) --[[ Line: 145 ]] --[[ Name: getChildren ]]
    -- upvalues: l_map_0 (copy), l_append_0 (copy)
    if v61 == 0 then
        return nil;
    else
        local v62 = v58:getHostNode(v60);
        if not v62 then
            return nil;
        else
            return (l_map_0(v62.children, function(v63, v64) --[[ Line: 154 ]]
                -- upvalues: l_append_0 (ref), v59 (copy), v58 (copy), v61 (copy)
                local v65 = l_append_0({}, v59, {
                    v64
                });
                local l_hostObject_0 = v58:getHostNode(v63).hostObject;
                local v67 = l_hostObject_0 and l_hostObject_0.ClassName or "Branch";
                return {
                    Name = typeof(v64) == "number" and v64 or tostring(v64), 
                    Icon = v67, 
                    Children = v58:getChildren(v65, v63, v61 - 1), 
                    Path = v65
                };
            end));
        end;
    end;
end;
v20.getHostNode = function(v68, v69, v70) --[[ Line: 169 ]] --[[ Name: getHostNode ]]
    -- upvalues: v2 (copy), l_mapOne_0 (copy)
    local v71 = v2(v69.children, "UseParentKey");
    while v71 do
        v69 = v71;
        v71 = v2(v69.children, "UseParentKey");
        if not v71 and v70 then
            if v68:isFragment(v69) then
                v71 = v69.children[1];
            elseif v68:isPortal(v69) then
                v71 = l_mapOne_0(v69.children);
            end;
        end;
    end;
    return v69;
end;
v20.getRootPath = function(v72) --[[ Line: 186 ]] --[[ Name: getRootPath ]]
    -- upvalues: v2 (copy), l_insert_0 (copy), l_keys_0 (copy), l_slice_0 (copy)
    local v73 = v72:getRootNode();
    local v74 = v2(v73.children, "UseParentKey");
    local v75 = {};
    while v74 do
        v73 = v74;
        v74 = v2(v73.children, "UseParentKey");
        if not v74 then
            if v72:isFragment(v73) then
                v74 = v73.children[1];
                l_insert_0(v75, 1);
            elseif v72:isPortal(v73) then
                local v76 = l_keys_0(v73.children);
                l_insert_0(v75, v76[1]);
                v74 = v73.children[v76[1]];
            end;
        end;
    end;
    return l_slice_0(v75, 0, -1);
end;
v20.isFragment = function(_, v78) --[[ Line: 208 ]] --[[ Name: isFragment ]]
    return v78.currentElement and v78.currentElement.elements;
end;
v20.isPortal = function(_, v80) --[[ Line: 212 ]] --[[ Name: isPortal ]]
    return v80.currentElement and tostring(v80.currentElement.component) == "Symbol(Portal)";
end;
v20.isFunction = function(_, v82) --[[ Line: 216 ]] --[[ Name: isFunction ]]
    return v82.currentElement and typeof(v82.currentElement.component) == "function";
end;
v20.isHost = function(_, v84) --[[ Line: 220 ]] --[[ Name: isHost ]]
    return v84.currentElement and typeof(v84.currentElement.component) == "string";
end;
v20.getNodes = function(v85, v86) --[[ Line: 224 ]] --[[ Name: getNodes ]]
    -- upvalues: l_slice_0 (copy), l_last_0 (copy), v3 (copy)
    local v87 = l_slice_0(v86, 1, -1);
    local v88 = l_last_0(v86);
    local v89 = v85:getNode(v87);
    if not v89 then
        return nil;
    else
        return v85:_getBranchNodes((v3(v89.children, v88)));
    end;
end;
v20._getBranchNodes = function(_, v91) --[[ Line: 237 ]] --[[ Name: _getBranchNodes ]]
    -- upvalues: l_insert_0 (copy), v2 (copy)
    local v92 = {};
    while v91 do
        l_insert_0(v92, v91);
        v91 = v2(v91.children, "UseParentKey");
    end;
    return v92;
end;
v20.getNodeName = function(v93, v94) --[[ Line: 247 ]] --[[ Name: getNodeName ]]
    if v93:isFragment(v94) then
        return "Fragment";
    elseif v93:isPortal(v94) then
        return "Portal";
    elseif v93:isFunction(v94) then
        return (tostring(v94.currentElement.component));
    elseif v93:isHost(v94) then
        return v94.currentElement.component;
    else
        return v94.currentElement.component.__componentName;
    end;
end;
v20.getNodeIcon = function(v95, v96) --[[ Line: 261 ]] --[[ Name: getNodeIcon ]]
    if v95:isFragment(v96) then
        return "Fragment";
    elseif v95:isPortal(v96) then
        return "Portal";
    elseif v95:isFunction(v96) then
        return "Functional";
    elseif v95:isHost(v96) then
        return v96.hostObject.ClassName;
    else
        local l___componentName_0 = v96.currentElement.component.__componentName;
        if l___componentName_0:find("Provider") then
            return "Provider";
        elseif l___componentName_0:find("Consumer") or l___componentName_0:find("RoduxConnection") then
            return "Consumer";
        elseif v96.currentElement.component.shouldUpdate then
            return "Pure";
        else
            return "Stateful";
        end;
    end;
end;
v20.getPath = function(v98, v99) --[[ Line: 284 ]] --[[ Name: getPath ]]
    return (v98:_getFullPath((v98:_getInstancePath(v99))));
end;
v20._getInstancePath = function(v100, v101) --[[ Line: 290 ]] --[[ Name: _getInstancePath ]]
    -- upvalues: l_insert_0 (copy), l_append_0 (copy), l_reverse_0 (copy), l_slice_0 (copy)
    local v102 = {};
    while v101 and v101 ~= v100.debugInterface.rootInstance do
        l_insert_0(v102, tonumber(v101.Name) or v101.Name);
        v101 = v101.Parent;
    end;
    local v103 = l_append_0({}, v100.debugInterface.rootPath or v100:getRootPath(), l_reverse_0(v102));
    if v100.debugInterface.rootPrefix then
        return (l_slice_0(v103, #v100.debugInterface.rootPrefix + 1));
    else
        return v103;
    end;
end;
v20._getFullPath = function(v104, v105) --[[ Line: 311 ]] --[[ Name: _getFullPath ]]
    -- upvalues: l_reduce_0 (copy)
    local v106 = {};
    local v107 = v104:getHostNode((v104:getRootNode()));
    if l_reduce_0(v105, function(v108, v109) --[[ Line: 316 ]]
        -- upvalues: v104 (copy), v106 (copy)
        return v104:_dfsFindNextChildNode(v108, v109, v106);
    end, v107) ~= nil then
        return v106;
    else
        return v105;
    end;
end;
v20._dfsFindNextChildNode = function(v110, v111, v112, v113) --[[ Line: 327 ]] --[[ Name: _dfsFindNextChildNode ]]
    -- upvalues: v3 (copy), l_insert_0 (copy)
    if v111 == nil or v111.children == nil then
        return nil;
    else
        local v114 = v3(v111.children, v112);
        if v114 then
            local v115 = v110:getHostNode(v114);
            if v115 ~= nil then
                l_insert_0(v113, v112);
                return v115;
            end;
        end;
        for v116, v117 in pairs(v111.children) do
            local v118 = tostring(v116) == "Symbol(UseParentKey)";
            if not v118 then
                l_insert_0(v113, v116);
            end;
            local v119 = v110:_dfsFindNextChildNode(v117, v112, v113);
            if v119 ~= nil then
                return v119;
            elseif not v118 then
                table.remove(v113);
            end;
        end;
        return nil;
    end;
end;
v20.destroy = function(v120) --[[ Line: 358 ]] --[[ Name: destroy ]]
    v120.tree = nil;
end;
return v20;