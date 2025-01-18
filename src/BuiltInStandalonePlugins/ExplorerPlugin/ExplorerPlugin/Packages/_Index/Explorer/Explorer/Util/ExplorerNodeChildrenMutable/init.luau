local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v2 = require(l_script_FirstAncestor_0.Util.compareDatum);
local v3 = require(l_script_FirstAncestor_0.Util.getTreeCount);
local v4 = require(l_script_FirstAncestor_0.Util.profile);
local v5 = {
    ARRAY_LIMIT = 7
};
assert(true, "ARRAY_LIMIT must be a power of two minus one so we can efficiently promote an array to a tree.");
v5.BLACK = false;
v5.RED = true;
v5.empty = function() --[[ Line: 27 ]] --[[ Name: empty ]]
    return {
        treeDescendantCount = 1
    };
end;
v5.ensureChildList = function(v6) --[[ Line: 34 ]] --[[ Name: ensureChildList ]]
    -- upvalues: v5 (copy)
    local l_children_0 = v6.children;
    if l_children_0 then
        return l_children_0;
    else
        local v8 = v5.empty();
        v6.children = v8;
        return v8;
    end;
end;
local function v9(v10, v11, v12) --[[ Line: 46 ]] --[[ Name: buildArrayIntoTreeRecursive ]]
    -- upvalues: v9 (copy)
    local v13 = (v11 + v12) // 2;
    local v14 = v10[v13];
    local l_children_1 = v14.children;
    v14.childNodeTreeCount = if l_children_1 then l_children_1.treeDescendantCount else 1;
    local v16 = v13 - 1;
    if v11 <= v16 then
        local v17 = v9(v10, v11, v16);
        v14.childNodeLeft = v17;
        v17.childNodeParent = v14;
        v14.childNodeTreeCount = v14.childNodeTreeCount + v17.childNodeTreeCount;
    end;
    local v18 = v13 + 1;
    if v18 <= v12 then
        local v19 = v9(v10, v18, v12);
        v14.childNodeRight = v19;
        v19.childNodeParent = v14;
        v14.childNodeTreeCount = v14.childNodeTreeCount + v19.childNodeTreeCount;
    end;
    v14.childNodeColor = false;
    return v14;
end;
local function _(v20) --[[ Line: 90 ]] --[[ Name: buildArrayIntoTree ]]
    -- upvalues: v9 (copy)
    assert(#v20 == 7, "Array count is not at expected limit.");
    return (v9(v20, 1, #v20));
end;
local function _(v22) --[[ Line: 99 ]] --[[ Name: nonNil ]]
    return v22;
end;
local function v29(v24, v25) --[[ Line: 103 ]] --[[ Name: leftRotate ]]
    local l_childNodeRight_0 = v25.childNodeRight;
    local l_childNodeParent_0 = v25.childNodeParent;
    local l_childNodeLeft_0 = l_childNodeRight_0.childNodeLeft;
    v25.childNodeTreeCount = v25.childNodeTreeCount - l_childNodeRight_0.childNodeTreeCount;
    if l_childNodeLeft_0 then
        v25.childNodeTreeCount = v25.childNodeTreeCount + l_childNodeLeft_0.childNodeTreeCount;
    end;
    v25.childNodeRight = l_childNodeLeft_0;
    if l_childNodeLeft_0 then
        l_childNodeLeft_0.childNodeParent = v25;
    end;
    l_childNodeRight_0.childNodeParent = l_childNodeParent_0;
    if not l_childNodeParent_0 then
        v24 = l_childNodeRight_0;
    elseif v25 == l_childNodeParent_0.childNodeLeft then
        l_childNodeParent_0.childNodeLeft = l_childNodeRight_0;
    else
        l_childNodeParent_0.childNodeRight = l_childNodeRight_0;
    end;
    if l_childNodeLeft_0 then
        l_childNodeRight_0.childNodeTreeCount = l_childNodeRight_0.childNodeTreeCount - l_childNodeLeft_0.childNodeTreeCount;
    end;
    l_childNodeRight_0.childNodeTreeCount = l_childNodeRight_0.childNodeTreeCount + v25.childNodeTreeCount;
    l_childNodeRight_0.childNodeLeft = v25;
    v25.childNodeParent = l_childNodeRight_0;
    return v24;
end;
local function v35(v30, v31) --[[ Line: 144 ]] --[[ Name: rightRotate ]]
    local l_childNodeLeft_1 = v31.childNodeLeft;
    local l_childNodeParent_1 = v31.childNodeParent;
    local l_childNodeRight_1 = l_childNodeLeft_1.childNodeRight;
    v31.childNodeTreeCount = v31.childNodeTreeCount - l_childNodeLeft_1.childNodeTreeCount;
    if l_childNodeRight_1 then
        v31.childNodeTreeCount = v31.childNodeTreeCount + l_childNodeRight_1.childNodeTreeCount;
    end;
    v31.childNodeLeft = l_childNodeRight_1;
    if l_childNodeRight_1 then
        l_childNodeRight_1.childNodeParent = v31;
    end;
    l_childNodeLeft_1.childNodeParent = l_childNodeParent_1;
    if not l_childNodeParent_1 then
        v30 = l_childNodeLeft_1;
    elseif v31 == l_childNodeParent_1.childNodeLeft then
        l_childNodeParent_1.childNodeLeft = l_childNodeLeft_1;
    else
        l_childNodeParent_1.childNodeRight = l_childNodeLeft_1;
    end;
    if l_childNodeRight_1 then
        l_childNodeLeft_1.childNodeTreeCount = l_childNodeLeft_1.childNodeTreeCount - l_childNodeRight_1.childNodeTreeCount;
    end;
    l_childNodeLeft_1.childNodeTreeCount = l_childNodeLeft_1.childNodeTreeCount + v31.childNodeTreeCount;
    l_childNodeLeft_1.childNodeRight = v31;
    v31.childNodeParent = l_childNodeLeft_1;
    return v30;
end;
local function v42(v36, v37) --[[ Line: 187 ]] --[[ Name: explorerTreeNodeInsertRebalance ]]
    -- upvalues: v29 (copy), v35 (copy)
    while true do
        local l_childNodeParent_2 = v37.childNodeParent;
        if l_childNodeParent_2 and l_childNodeParent_2.childNodeColor ~= false then
            local l_childNodeParent_3 = l_childNodeParent_2.childNodeParent;
            if l_childNodeParent_2 == l_childNodeParent_3.childNodeLeft then
                local l_childNodeRight_2 = l_childNodeParent_3.childNodeRight;
                if l_childNodeRight_2 and l_childNodeRight_2.childNodeColor == true then
                    l_childNodeParent_2.childNodeColor = false;
                    l_childNodeRight_2.childNodeColor = false;
                    l_childNodeParent_3.childNodeColor = true;
                    v37 = l_childNodeParent_3;
                else
                    if v37 == l_childNodeParent_2.childNodeRight then
                        v37 = l_childNodeParent_2;
                        v36 = v29(v36, v37);
                    end;
                    v37.childNodeParent.childNodeColor = false;
                    l_childNodeParent_3.childNodeColor = true;
                    v36 = v35(v36, l_childNodeParent_3);
                end;
            else
                local v41 = l_childNodeParent_3 and l_childNodeParent_3.childNodeLeft;
                if v41 and v41.childNodeColor == true then
                    l_childNodeParent_2.childNodeColor = false;
                    v41.childNodeColor = false;
                    l_childNodeParent_3.childNodeColor = true;
                    v37 = l_childNodeParent_3;
                else
                    if v37 == l_childNodeParent_2.childNodeLeft then
                        v37 = l_childNodeParent_2;
                        v36 = v35(v36, v37);
                    end;
                    v37.childNodeParent.childNodeColor = false;
                    l_childNodeParent_3.childNodeColor = true;
                    v36 = v29(v36, l_childNodeParent_3);
                end;
            end;
        else
            break;
        end;
    end;
    v36.childNodeColor = false;
    return v36;
end;
local function v49(v43, v44) --[[ Line: 245 ]] --[[ Name: insertIntoTree ]]
    -- upvalues: v3 (copy), v2 (copy), v42 (copy)
    local v45 = v3(v44);
    v44.childNodeTreeCount = v45;
    local l_v43_0 = v43;
    while true do
        l_v43_0.childNodeTreeCount = l_v43_0.childNodeTreeCount + v45;
        if v2(v44.datum, l_v43_0.datum) then
            local l_childNodeLeft_2 = l_v43_0.childNodeLeft;
            if l_childNodeLeft_2 then
                l_v43_0 = l_childNodeLeft_2;
            else
                l_v43_0.childNodeLeft = v44;
                break;
            end;
        else
            local l_childNodeRight_3 = l_v43_0.childNodeRight;
            if l_childNodeRight_3 then
                l_v43_0 = l_childNodeRight_3;
            else
                l_v43_0.childNodeRight = v44;
                break;
            end;
        end;
    end;
    v44.childNodeParent = l_v43_0;
    v44.childNodeColor = true;
    return (v42(v43, v44));
end;
local function v55(v50, v51) --[[ Line: 291 ]] --[[ Name: insertIntoArray ]]
    -- upvalues: v2 (copy)
    local v52 = 1;
    local v53 = #v50;
    while v52 <= v53 do
        local v54 = (v52 + v53) // 2;
        if v2(v51.datum, v50[v54].datum) then
            v53 = v54 - 1;
        else
            v52 = v54 + 1;
        end;
    end;
    table.insert(v50, v52, v51);
end;
local function _(v56, v57) --[[ Line: 305 ]] --[[ Name: patchTreeNodeDescendantCount ]]
    local l_v56_0 = v56;
    while l_v56_0 do
        l_v56_0.childNodeTreeCount = l_v56_0.childNodeTreeCount + v57;
        l_v56_0 = l_v56_0.childNodeParent;
    end;
end;
v5.patchNodeDescendantCount = function(v60, v61) --[[ Line: 317 ]] --[[ Name: patchNodeDescendantCount ]]
    -- upvalues: v5 (copy)
    local v62 = v5.ensureChildList(v60);
    v62.treeDescendantCount = v62.treeDescendantCount + v61;
    assert(v62.treeDescendantCount >= 1, "Tree descendant count went below 1");
    if v60.childNodeTreeCount then
        local l_v60_0 = v60;
        while l_v60_0 do
            l_v60_0.childNodeTreeCount = l_v60_0.childNodeTreeCount + v61;
            l_v60_0 = l_v60_0.childNodeParent;
        end;
    end;
end;
v5.insert = function(v64, v65) --[[ Line: 332 ]] --[[ Name: insert ]]
    -- upvalues: v49 (copy), v55 (copy), v9 (copy)
    if v64.tree then
        v64.tree = v49(v64.tree, v65);
        return;
    else
        local l_array_0 = v64.array;
        if l_array_0 then
            if #l_array_0 < 7 then
                v55(l_array_0, v65);
                return;
            else
                assert(#l_array_0 == 7, "Array count is not at expected limit.");
                local v67 = v9(l_array_0, 1, #l_array_0);
                v64.tree = v49(v67, v65);
                v64.array = nil;
                return;
            end;
        else
            v64.array = {
                v65
            };
            return;
        end;
    end;
end;
local function _(v68) --[[ Line: 359 ]] --[[ Name: successor ]]
    while v68.childNodeLeft do
        v68 = v68.childNodeLeft;
    end;
    return v68;
end;
local function v79(v70, v71) --[[ Line: 367 ]] --[[ Name: swapWithSuccessor ]]
    -- upvalues: v3 (copy)
    local l_childNodeParent_4 = v70.childNodeParent;
    if l_childNodeParent_4 then
        if l_childNodeParent_4.childNodeLeft == v70 then
            l_childNodeParent_4.childNodeLeft = v71;
        else
            l_childNodeParent_4.childNodeRight = v71;
        end;
    end;
    local l_childNodeRight_4 = v71.childNodeRight;
    if l_childNodeRight_4 then
        l_childNodeRight_4.childNodeParent = v70;
    end;
    local l_childNodeRight_5 = v70.childNodeRight;
    local l_childNodeLeft_3 = v70.childNodeLeft;
    local l_childNodeParent_5 = v71.childNodeParent;
    v70.childNodeLeft = nil;
    v70.childNodeRight = l_childNodeRight_4;
    v71.childNodeParent = v70.childNodeParent;
    local l_childNodeColor_0 = v71.childNodeColor;
    local l_childNodeColor_1 = v70.childNodeColor;
    v70.childNodeColor = l_childNodeColor_0;
    v71.childNodeColor = l_childNodeColor_1;
    l_childNodeColor_0 = v71.childNodeTreeCount;
    l_childNodeColor_1 = v70.childNodeTreeCount;
    v70.childNodeTreeCount = l_childNodeColor_0;
    v71.childNodeTreeCount = l_childNodeColor_1;
    if l_childNodeRight_5 == v71 then
        v71.childNodeRight = v70;
        v71.childNodeLeft = l_childNodeLeft_3;
        v70.childNodeParent = v71;
        if l_childNodeLeft_3 then
            l_childNodeLeft_3.childNodeParent = v71;
        end;
    else
        v71.childNodeLeft = l_childNodeLeft_3;
        v71.childNodeRight = l_childNodeRight_5;
        if l_childNodeParent_5.childNodeLeft == v71 then
            l_childNodeParent_5.childNodeLeft = v70;
        else
            l_childNodeParent_5.childNodeRight = v70;
        end;
        v70.childNodeParent = l_childNodeParent_5;
        if l_childNodeRight_5 then
            l_childNodeRight_5.childNodeParent = v71;
        end;
        if l_childNodeLeft_3 then
            l_childNodeLeft_3.childNodeParent = v71;
        end;
    end;
    l_childNodeColor_0 = v3(v70) - v3(v71);
    if l_childNodeColor_0 ~= 0 then
        l_childNodeColor_1 = v70;
        while l_childNodeColor_1 ~= v71 do
            l_childNodeColor_1.childNodeTreeCount = l_childNodeColor_1.childNodeTreeCount + l_childNodeColor_0;
            l_childNodeColor_1 = l_childNodeColor_1.childNodeParent;
        end;
    end;
end;
local function _(v80) --[[ Line: 449 ]] --[[ Name: removeLeaf ]]
    -- upvalues: v3 (copy)
    local l_childNodeParent_6 = v80.childNodeParent;
    if l_childNodeParent_6.childNodeLeft == v80 then
        l_childNodeParent_6.childNodeLeft = nil;
    else
        l_childNodeParent_6.childNodeRight = nil;
    end;
    v80.childNodeParent = nil;
    local v82 = -v3(v80);
    local l_l_childNodeParent_6_0 = l_childNodeParent_6;
    while l_l_childNodeParent_6_0 do
        l_l_childNodeParent_6_0.childNodeTreeCount = l_l_childNodeParent_6_0.childNodeTreeCount + v82;
        l_l_childNodeParent_6_0 = l_l_childNodeParent_6_0.childNodeParent;
    end;
end;
local function _(v85) --[[ Line: 463 ]] --[[ Name: getSibling ]]
    local l_childNodeParent_7 = v85.childNodeParent;
    if l_childNodeParent_7.childNodeLeft == v85 then
        return l_childNodeParent_7.childNodeRight, "right";
    else
        return l_childNodeParent_7.childNodeLeft, "left";
    end;
end;
local v88 = nil;
local function v97(v89, v90) --[[ Line: 474 ]] --[[ Name: removeCase6 ]]
    -- upvalues: v35 (copy), v29 (copy)
    local l_childNodeParent_8 = v90.childNodeParent;
    local v92, v93;
    if l_childNodeParent_8.childNodeLeft == v90 then
        v93 = l_childNodeParent_8.childNodeRight;
        v92 = "right";
    else
        v93 = l_childNodeParent_8.childNodeLeft;
        v92 = "left";
    end;
    l_childNodeParent_8 = if v92 == "left" then v93.childNodeLeft else v93.childNodeRight;
    if v93.childNodeColor == false and l_childNodeParent_8.childNodeColor == true then
        local l_childNodeParent_9 = v93.childNodeParent;
        v89 = if v92 == "left" then v35(v89, l_childNodeParent_9) else v29(v89, l_childNodeParent_9);
        v93.childNodeColor = l_childNodeParent_9.childNodeColor;
        local l_childNodeRight_6 = v93.childNodeRight;
        if l_childNodeRight_6 then
            l_childNodeRight_6.childNodeColor = false;
        end;
        local l_childNodeLeft_4 = v93.childNodeLeft;
        if l_childNodeLeft_4 then
            l_childNodeLeft_4.childNodeColor = false;
        end;
        return v89;
    else
        error("Should not reach this case");
        return;
    end;
end;
local function v104(v98, v99) --[[ Line: 503 ]] --[[ Name: removeCase5 ]]
    -- upvalues: v29 (copy), v35 (copy), v97 (copy)
    local l_childNodeParent_10 = v99.childNodeParent;
    local v101, v102;
    if l_childNodeParent_10.childNodeLeft == v99 then
        v102 = l_childNodeParent_10.childNodeRight;
        v101 = "right";
    else
        v102 = l_childNodeParent_10.childNodeLeft;
        v101 = "left";
    end;
    l_childNodeParent_10 = nil;
    local v103 = nil;
    if v101 == "left" then
        l_childNodeParent_10 = v102.childNodeRight;
        v103 = v102.childNodeLeft;
    else
        l_childNodeParent_10 = v102.childNodeLeft;
        v103 = v102.childNodeRight;
    end;
    if l_childNodeParent_10 and l_childNodeParent_10.childNodeColor == true and (not v103 or v103.childNodeColor == false) and v102.childNodeColor == false then
        v98 = if v101 == "left" then v29(v98, v102) else v35(v98, v102);
        l_childNodeParent_10.childNodeColor = false;
        v102.childNodeColor = true;
    end;
    return v97(v98, v99);
end;
local function v113(v105, v106) --[[ Line: 533 ]] --[[ Name: removeCase4 ]]
    -- upvalues: v104 (copy)
    local l_childNodeParent_11 = v106.childNodeParent;
    if l_childNodeParent_11.childNodeColor == true then
        local l_childNodeParent_12 = v106.childNodeParent;
        local v109;
        if l_childNodeParent_12.childNodeLeft == v106 then
            v109 = l_childNodeParent_12.childNodeRight;
            local _ = "right";
        else
            v109 = l_childNodeParent_12.childNodeLeft;
            local _ = "left";
        end;
        if v109.childNodeColor == false and (not v109.childNodeLeft or v109.childNodeLeft.childNodeColor == false) and (not v109.childNodeRight or v109.childNodeRight.childNodeColor == false) then
            l_childNodeParent_12 = v109.childNodeColor;
            local l_childNodeColor_2 = l_childNodeParent_11.childNodeColor;
            l_childNodeParent_11.childNodeColor = l_childNodeParent_12;
            v109.childNodeColor = l_childNodeColor_2;
            return v105;
        end;
    end;
    return v104(v105, v106);
end;
local function v121(v114, v115) --[[ Line: 552 ]] --[[ Name: removeCase3 ]]
    -- upvalues: v88 (ref), v113 (copy)
    local l_childNodeParent_13 = v115.childNodeParent;
    local l_childNodeParent_14 = v115.childNodeParent;
    local v118;
    if l_childNodeParent_14.childNodeLeft == v115 then
        v118 = l_childNodeParent_14.childNodeRight;
        local _ = "right";
    else
        v118 = l_childNodeParent_14.childNodeLeft;
        local _ = "left";
    end;
    if v118.childNodeColor == false and l_childNodeParent_13.childNodeColor == false and (not v118.childNodeLeft or v118.childNodeLeft.childNodeColor == false) and (not v118.childNodeRight or v118.childNodeRight.childNodeColor == false) then
        v118.childNodeColor = true;
        return v88(v114, l_childNodeParent_13);
    else
        return v113(v114, v115);
    end;
end;
local function v128(v122, v123) --[[ Line: 570 ]] --[[ Name: removeCase2 ]]
    -- upvalues: v35 (copy), v29 (copy), v88 (ref), v121 (copy)
    local l_childNodeParent_15 = v123.childNodeParent;
    local l_childNodeParent_16 = v123.childNodeParent;
    local v126, v127;
    if l_childNodeParent_16.childNodeLeft == v123 then
        v126 = l_childNodeParent_16.childNodeRight;
        v127 = "right";
    else
        v126 = l_childNodeParent_16.childNodeLeft;
        v127 = "left";
    end;
    if v126.childNodeColor == true and l_childNodeParent_15.childNodeColor == false and (not v126.childNodeLeft or v126.childNodeLeft.childNodeColor == false) and (not v126.childNodeRight or v126.childNodeRight.childNodeColor == false) then
        v122 = if v127 == "left" then v35(v122, l_childNodeParent_15) else v29(v122, l_childNodeParent_15);
        l_childNodeParent_15.childNodeColor = true;
        v126.childNodeColor = false;
        return v88(v122, v123);
    else
        return v121(v122, v123);
    end;
end;
v88 = function(v129, v130) --[[ Line: 596 ]]
    -- upvalues: v128 (copy)
    if v129 == v130 then
        v130.childNodeColor = false;
        return v129;
    else
        return v128(v129, v130);
    end;
end;
local function v144(v131, v132) --[[ Line: 609 ]] --[[ Name: remove ]]
    -- upvalues: v3 (copy), v88 (ref)
    local l_childNodeLeft_5 = v132.childNodeLeft;
    local l_childNodeRight_7 = v132.childNodeRight;
    local v135 = l_childNodeLeft_5 or l_childNodeRight_7;
    if v132 == v131 then
        if v135 then
            v135.childNodeColor = false;
            v135.childNodeParent = nil;
            return v135;
        else
            return nil;
        end;
    elseif v132.childNodeColor == true then
        if v135 then
            error("Red node cannot have a child");
            return;
        else
            local l_childNodeParent_17 = v132.childNodeParent;
            if l_childNodeParent_17.childNodeLeft == v132 then
                l_childNodeParent_17.childNodeLeft = nil;
            else
                l_childNodeParent_17.childNodeRight = nil;
            end;
            v132.childNodeParent = nil;
            local v137 = -v3(v132);
            local l_l_childNodeParent_17_0 = l_childNodeParent_17;
            while l_l_childNodeParent_17_0 do
                l_l_childNodeParent_17_0.childNodeTreeCount = l_l_childNodeParent_17_0.childNodeTreeCount + v137;
                l_l_childNodeParent_17_0 = l_l_childNodeParent_17_0.childNodeParent;
            end;
            return v131;
        end;
    elseif v135 and v135.childNodeColor == true then
        local v139 = -v3(v132);
        local l_v132_0 = v132;
        while l_v132_0 do
            l_v132_0.childNodeTreeCount = l_v132_0.childNodeTreeCount + v139;
            l_v132_0 = l_v132_0.childNodeParent;
        end;
        v139 = v132.childNodeParent;
        if v139.childNodeLeft == v132 then
            v139.childNodeLeft = v135;
        else
            v139.childNodeRight = v135;
        end;
        v135.childNodeParent = v132.childNodeParent;
        v135.childNodeColor = false;
        return v131;
    else
        v131 = v88(v131, v132);
        local l_childNodeParent_18 = v132.childNodeParent;
        if l_childNodeParent_18.childNodeLeft == v132 then
            l_childNodeParent_18.childNodeLeft = nil;
        else
            l_childNodeParent_18.childNodeRight = nil;
        end;
        v132.childNodeParent = nil;
        local v142 = -v3(v132);
        local l_l_childNodeParent_18_0 = l_childNodeParent_18;
        while l_l_childNodeParent_18_0 do
            l_l_childNodeParent_18_0.childNodeTreeCount = l_l_childNodeParent_18_0.childNodeTreeCount + v142;
            l_l_childNodeParent_18_0 = l_l_childNodeParent_18_0.childNodeParent;
        end;
        return v131;
    end;
end;
local function _(v145, v146) --[[ Line: 660 ]] --[[ Name: deleteFromTree ]]
    -- upvalues: v79 (copy), v144 (copy)
    if v146.childNodeLeft and v146.childNodeRight then
        local l_childNodeRight_8 = v146.childNodeRight;
        while l_childNodeRight_8.childNodeLeft do
            l_childNodeRight_8 = l_childNodeRight_8.childNodeLeft;
        end;
        local l_l_childNodeRight_8_0 = l_childNodeRight_8;
        v79(v146, l_l_childNodeRight_8_0);
        if v145 == v146 then
            v145 = l_l_childNodeRight_8_0;
        end;
    end;
    return v144(v145, v146);
end;
v5.remove = function(v150, v151) --[[ Line: 678 ]] --[[ Name: remove ]]
    -- upvalues: v79 (copy), v144 (copy)
    if v150.array then
        local v152 = table.find(v150.array, v151);
        assert(v152, "Removing explorer node from parent, but it's not inside of its children array");
        table.remove(v150.array, v152);
        return;
    else
        assert(v150.tree ~= nil, "Removing explorer node from parent, but it has neither an array nor a tree");
        local l_tree_0 = v150.tree;
        if v151.childNodeLeft and v151.childNodeRight then
            local l_childNodeRight_9 = v151.childNodeRight;
            while l_childNodeRight_9.childNodeLeft do
                l_childNodeRight_9 = l_childNodeRight_9.childNodeLeft;
            end;
            local l_l_childNodeRight_9_0 = l_childNodeRight_9;
            v79(v151, l_l_childNodeRight_9_0);
            if l_tree_0 == v151 then
                l_tree_0 = l_l_childNodeRight_9_0;
            end;
        end;
        v150.tree = v144(l_tree_0, v151);
        v151.childNodeColor = nil;
        v151.childNodeTreeCount = nil;
        v151.childNodeLeft = nil;
        v151.childNodeRight = nil;
        v151.childNodeParent = nil;
        if not v150.tree then
            v150.array = {};
        end;
        return;
    end;
end;
v5.replaceChildren = function(v156, v157) --[[ Line: 708 ]] --[[ Name: replaceChildren ]]
    local l_children_2 = v156.children;
    v156.children = v157;
    if v156.childNodeTreeCount then
        local v159 = if l_children_2 then l_children_2.treeDescendantCount else 1;
        local v160 = v157.treeDescendantCount - v159;
        local l_v156_0 = v156;
        while l_v156_0 do
            l_v156_0.childNodeTreeCount = l_v156_0.childNodeTreeCount + v160;
            l_v156_0 = l_v156_0.childNodeParent;
        end;
    end;
    return l_children_2;
end;
local function v162(v163, v164) --[[ Line: 730 ]] --[[ Name: getNthTreeNode ]]
    -- upvalues: v162 (copy), v3 (copy), v5 (copy)
    local l_childNodeLeft_6 = v163.childNodeLeft;
    if l_childNodeLeft_6 then
        local l_childNodeTreeCount_0 = l_childNodeLeft_6.childNodeTreeCount;
        if v164 <= l_childNodeTreeCount_0 then
            return v162(l_childNodeLeft_6, v164);
        else
            v164 = v164 - l_childNodeTreeCount_0;
        end;
    end;
    local v167 = v3(v163);
    if v164 <= v167 then
        if v164 == 1 then
            return v163;
        else
            assert(v163.children, "treeCount > index > 1 => node must have children");
            return v5.getNthDescendant(v163.children, v164 - 1);
        end;
    else
        v164 = v164 - v167;
        local l_childNodeRight_10 = v163.childNodeRight;
        if l_childNodeRight_10 and v164 <= l_childNodeRight_10.childNodeTreeCount then
            return v162(l_childNodeRight_10, v164);
        else
            return nil;
        end;
    end;
end;
v5.getNthDescendant = function(v169, v170) --[[ Line: 767 ]] --[[ Name: getNthDescendant ]]
    -- upvalues: v3 (copy), v5 (copy), v162 (copy)
    assert(v170 > 0, "index <= 0");
    if not v169 then
        return nil;
    else
        local l_array_1 = v169.array;
        if l_array_1 then
            for _, v173 in l_array_1 do
                if v170 == 1 then
                    return v173;
                else
                    local v174 = v3(v173);
                    if v174 < v170 then
                        v170 = v170 - v174;
                    else
                        return v5.getNthDescendant(v173.children, v170 - 1);
                    end;
                end;
            end;
        end;
        local l_tree_1 = v169.tree;
        if l_tree_1 then
            return v162(l_tree_1, v170);
        else
            return nil;
        end;
    end;
end;
v5.getNthDescendant = v4(v5.getNthDescendant);
local function v176(v177, v178) --[[ Line: 803 ]] --[[ Name: gatherTreeNodes ]]
    -- upvalues: v176 (copy)
    local l_childNodeLeft_7 = v177.childNodeLeft;
    if l_childNodeLeft_7 then
        v176(l_childNodeLeft_7, v178);
    end;
    table.insert(v178, v177);
    local l_childNodeRight_11 = v177.childNodeRight;
    if l_childNodeRight_11 then
        v176(l_childNodeRight_11, v178);
    end;
    return v178;
end;
local function v191(v181, v182) --[[ Line: 816 ]] --[[ Name: iterateTreeSiblings ]]
    if v182 == 1 then
        local l_v181_0 = v181;
        return function() --[[ Line: 824 ]]
            -- upvalues: l_v181_0 (ref)
            local l_l_v181_0_0 = l_v181_0;
            local l_l_l_v181_0_0_0 = l_l_v181_0_0;
            if l_l_v181_0_0 then
                if l_l_v181_0_0.childNodeRight then
                    l_l_v181_0_0 = l_l_v181_0_0.childNodeRight;
                    while l_l_v181_0_0.childNodeLeft do
                        l_l_v181_0_0 = l_l_v181_0_0.childNodeLeft;
                    end;
                else
                    local l_childNodeParent_19 = l_l_v181_0_0.childNodeParent;
                    while l_childNodeParent_19 and l_childNodeParent_19.childNodeRight == l_l_v181_0_0 do
                        l_l_v181_0_0 = l_childNodeParent_19;
                        l_childNodeParent_19 = l_childNodeParent_19.childNodeParent;
                    end;
                    l_l_v181_0_0 = l_childNodeParent_19;
                end;
                l_v181_0 = l_l_v181_0_0;
                return l_l_l_v181_0_0_0;
            else
                return nil;
            end;
        end;
    elseif v182 == -1 then
        local l_v181_1 = v181;
        return function() --[[ Line: 855 ]]
            -- upvalues: l_v181_1 (ref)
            local l_l_v181_1_0 = l_v181_1;
            local l_l_l_v181_1_0_0 = l_l_v181_1_0;
            if l_l_v181_1_0 then
                if l_l_v181_1_0.childNodeLeft then
                    l_l_v181_1_0 = l_l_v181_1_0.childNodeLeft;
                    while l_l_v181_1_0.childNodeRight do
                        l_l_v181_1_0 = l_l_v181_1_0.childNodeRight;
                    end;
                else
                    local l_childNodeParent_20 = l_l_v181_1_0.childNodeParent;
                    while l_childNodeParent_20 and l_childNodeParent_20.childNodeLeft == l_l_v181_1_0 do
                        l_l_v181_1_0 = l_childNodeParent_20;
                        l_childNodeParent_20 = l_childNodeParent_20.childNodeParent;
                    end;
                    l_l_v181_1_0 = l_childNodeParent_20;
                end;
                l_v181_1 = l_l_v181_1_0;
                return l_l_l_v181_1_0_0;
            else
                return nil;
            end;
        end;
    else
        error((("Invalid direction %*"):format(v182)));
        return;
    end;
end;
local function _(v192, v193, v194) --[[ Line: 887 ]] --[[ Name: iterateArraySiblings ]]
    local v195 = table.find(v192, v193);
    assert(v195, "Node not in parent's child list");
    return function() --[[ Line: 895 ]]
        -- upvalues: v192 (copy), v195 (ref), v194 (copy)
        local v196 = v192[v195];
        v195 = v195 + v194;
        return v196;
    end;
end;
v5.iterateSiblings = function(v198, v199, v200) --[[ Line: 907 ]] --[[ Name: iterateSiblings ]]
    -- upvalues: v191 (copy)
    if v198.array then
        local l_array_2 = v198.array;
        local v202 = table.find(l_array_2, v199);
        assert(v202, "Node not in parent's child list");
        return function() --[[ Line: 895 ]]
            -- upvalues: l_array_2 (copy), v202 (ref), v200 (copy)
            local v203 = l_array_2[v202];
            v202 = v202 + v200;
            return v203;
        end;
    elseif v198.tree then
        return v191(v199, v200);
    else
        return function() --[[ Line: 918 ]]
            return nil;
        end;
    end;
end;
v5.iterate = function(v204) --[[ Line: 924 ]] --[[ Name: iterate ]]
    -- upvalues: v5 (copy), v191 (copy)
    local l_array_3 = v204.array;
    if l_array_3 then
        local v206 = 1;
        return function() --[[ Line: 930 ]]
            -- upvalues: l_array_3 (copy), v206 (ref)
            local v207 = l_array_3[v206];
            v206 = v206 + 1;
            return v207;
        end;
    else
        local v208 = v5.first(v204);
        if v208 then
            return v191(v208, 1);
        else
            return function() --[[ Line: 940 ]]
                return nil;
            end;
        end;
    end;
end;
v5.isEmpty = function(v209) --[[ Line: 947 ]] --[[ Name: isEmpty ]]
    if v209 then
        if v209.array then
            return next(v209.array) == nil;
        else
            return v209.tree == nil;
        end;
    else
        return true;
    end;
end;
v5.first = function(v210) --[[ Line: 959 ]] --[[ Name: first ]]
    if v210 == nil then
        return nil;
    elseif v210.array then
        return v210.array[1];
    elseif v210.tree == nil then
        return nil;
    else
        local l_tree_2 = v210.tree;
        while l_tree_2 ~= nil and l_tree_2.childNodeLeft ~= nil do
            l_tree_2 = l_tree_2.childNodeLeft;
        end;
        return l_tree_2;
    end;
end;
local function v212(v213, v214, v215, v216, v217) --[[ Line: 980 ]] --[[ Name: printTree ]]
    -- upvalues: v3 (copy), v212 (copy)
    if v215[v213] then
        v217(v214 .. v213.datum.name .. " (INVALID circular reference!) ...");
        return;
    else
        v215[v213] = true;
        local v218 = if v216 ~= v213.childNodeParent then (" (Bad parent %*)"):format(if v213.childNodeParent then v213.childNodeParent.datum.name else "nil") else "";
        local v219 = v213.childNodeColor == false and "b" or "r";
        v217((("%*%* [%* %* (%*)]%* %*"):format(v214, v213.datum.name, v219, v213.childNodeTreeCount, v3(v213), v218, v213.datum.id)));
        if v213.childNodeLeft or v213.childNodeRight then
            if v213.childNodeLeft then
                v212(v213.childNodeLeft, v214 .. "| ", v215, v213, v217);
            else
                v217(v214 .. "| nil");
            end;
            if v213.childNodeRight then
                v212(v213.childNodeRight, v214 .. "| ", v215, v213, v217);
                return;
            else
                v217(v214 .. "| nil");
            end;
        end;
        return;
    end;
end;
v5.dumpNode = function(v220, v221) --[[ Line: 1014 ]] --[[ Name: dumpNode ]]
    -- upvalues: v212 (copy)
    local v222 = v221 or print;
    v212(v220, "", {}, nil, v222);
end;
v5.dump = function(v223, v224) --[[ Line: 1020 ]] --[[ Name: dump ]]
    -- upvalues: v3 (copy), v212 (copy)
    local v225 = v224 or print;
    if not v223 then
        v225("[Child list not present, ==nil] [1]");
        return;
    else
        local v226 = true;
        if v223.array ~= nil then
            v226 = v223.tree == nil;
        end;
        assert(v226, "Has both array and tree");
        if v223.array then
            v225((("[Backed by array] [%*]"):format(v223.treeDescendantCount)));
            for v227, v228 in v223.array do
                v225((("| %*: %* [%*]"):format(v227, v228.datum.name, (v3(v228)))));
            end;
            return;
        elseif v223.tree then
            v225((("[Backed by tree] [%*]"):format(v223.treeDescendantCount)));
            v212(v223.tree, "", {}, nil, v225);
            return;
        else
            assert(v223.treeDescendantCount == 1, "Not backed by anything, but has descendant count");
            v225("[Not backed by anything] [1]");
            return;
        end;
    end;
end;
local function v241(v229) --[[ Line: 1047 ]] --[[ Name: checkRBTreeInvariants ]]
    -- upvalues: v3 (copy)
    assert(v229.childNodeColor == false, "The root must be black");
    local v230 = {};
    local function v231(v232) --[[ Line: 1052 ]] --[[ Name: checkBlackHeight ]]
        -- upvalues: v231 (copy)
        if not v232 then
            return 1;
        else
            local v233 = v231(v232.childNodeLeft);
            assert(v233 == v231(v232.childNodeRight), "All paths from a node to its descendants must go through the same number of black nodes");
            return v233 + (v232.childNodeColor == false and 1 or 0);
        end;
    end;
    local function v234(v235) --[[ Line: 1068 ]] --[[ Name: assertNodeValid ]]
        -- upvalues: v230 (copy), v234 (copy)
        if v230[v235] then
            error("RB-tree is circular");
        end;
        v230[v235] = true;
        if v235.childNodeColor == true then
            assert(not v235.childNodeLeft or v235.childNodeLeft.childNodeColor == false, "If a node is red, then its children are black (left)");
            assert(not v235.childNodeRight or v235.childNodeRight.childNodeColor == false, "If a node is red, then its children are black (right)");
        end;
        if v235.childNodeLeft then
            assert(v235.childNodeLeft.childNodeParent == v235, "Left's parent isn't node");
            v234(v235.childNodeLeft);
        end;
        if v235.childNodeRight then
            assert(v235.childNodeRight.childNodeParent == v235, "Left's parent isn't node");
            v234(v235.childNodeRight);
        end;
    end;
    local function v236(v237) --[[ Line: 1096 ]] --[[ Name: checkCount ]]
        -- upvalues: v236 (copy), v3 (ref)
        if v237 then
            local v238 = v236(v237.childNodeRight) + v236(v237.childNodeLeft) + v3(v237);
            assert(v237.childNodeTreeCount == v238, "Count must be the sum of the children's count + 1");
            return v238;
        else
            return 0;
        end;
    end;
    v234(v229);
    if v229 then
        local v239 = v231(v229.childNodeLeft);
        assert(v239 == v231(v229.childNodeRight), "All paths from a node to its descendants must go through the same number of black nodes");
        local _ = v239 + (v229.childNodeColor == false and 1 or 0);
    end;
    if v229 then
        assert(v236(v229.childNodeRight) + v236(v229.childNodeLeft) + v3(v229) == v229.childNodeTreeCount, "Count must be the sum of the children's count + 1");
    end;
    assert(not v229.childNodeParent, "Root must have no parent");
end;
local function v246(v242) --[[ Line: 1116 ]] --[[ Name: checkArrayInvariants ]]
    -- upvalues: v2 (copy)
    local v243 = nil;
    for _, v245 in v242 do
        if v243 then
            assert(not v2(v245.datum, v243.datum), "Array is not sorted");
        end;
        v243 = v245;
    end;
end;
v5.testAssertInvariants = function(v247) --[[ Line: 1128 ]] --[[ Name: testAssertInvariants ]]
    -- upvalues: v241 (copy), v246 (copy)
    if v247.tree then
        v241(v247.tree);
        return;
    else
        v246(v247.array);
        return;
    end;
end;
v5.testCreateNode = function(v248) --[[ Line: 1137 ]] --[[ Name: testCreateNode ]]
    -- upvalues: v5 (copy)
    return {
        datum = {
            id = "", 
            name = v248, 
            className = "Folder", 
            hasChildren = false
        }, 
        uiState = {
            isExpanded = true
        }, 
        children = v5.empty(), 
        childNodeColor = false, 
        childNodeTreeCount = 1
    };
end;
v5.testSetRoot = function(v249, v250) --[[ Line: 1155 ]] --[[ Name: testSetRoot ]]
    -- upvalues: v5 (copy)
    assert(not v249.array or #v249.array == 0, "Array must be empty");
    v249.array = nil;
    local v251 = v5.testCreateNode(v250);
    v249.tree = v251;
    return v251;
end;
v5.testSetRight = function(v252, v253, v254) --[[ Line: 1167 ]] --[[ Name: testSetRight ]]
    -- upvalues: v5 (copy)
    assert(not v252.childNodeRight, "Right must be empty");
    local v255 = v5.testCreateNode(v253);
    v252.childNodeRight = v255;
    v255.childNodeParent = v252;
    v255.childNodeColor = v254;
    local l_v252_0 = v252;
    while l_v252_0 do
        l_v252_0.childNodeTreeCount = l_v252_0.childNodeTreeCount + 1;
        l_v252_0 = l_v252_0.childNodeParent;
    end;
    return v255;
end;
v5.testSetLeft = function(v257, v258, v259) --[[ Line: 1182 ]] --[[ Name: testSetLeft ]]
    -- upvalues: v5 (copy)
    assert(not v257.childNodeLeft, "Left must be empty");
    local v260 = v5.testCreateNode(v258);
    v257.childNodeLeft = v260;
    v260.childNodeParent = v257;
    v260.childNodeColor = v259;
    local l_v257_0 = v257;
    while l_v257_0 do
        l_v257_0.childNodeTreeCount = l_v257_0.childNodeTreeCount + 1;
        l_v257_0 = l_v257_0.childNodeParent;
    end;
    return v260;
end;
return v5;