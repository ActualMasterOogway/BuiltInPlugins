local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Src.Components.FilterDropdown);
local v5 = require(l_Parent_0.Src.Resources.StyleTips);
local v6 = require(l_Parent_0.Src.Util.ActivityHistoryEventTranslated);
local v7 = require(l_Parent_0.Src.Util.SharedTypes);
local l_Localization_0 = v2.ContextServices.Localization;
local l_SectionHeaderType_0 = v7.SectionHeaderType;
local l_Checkbox_0 = v2.UI.Checkbox;
local v11 = v2.Util.LayoutOrderIterator.new();
local l_joinTags_0 = v2.Styling.joinTags;
local l_EventFilterTypes_0 = v7.EventFilterTypes;
local function v15(v14) --[[ Line: 25 ]] --[[ Name: getEventTypesLocalized ]]
    -- upvalues: l_EventFilterTypes_0 (copy)
    return {
        [l_EventFilterTypes_0.Experience] = v14:getText("FilterMenu", "FilterForExperience"), 
        [l_EventFilterTypes_0.Localization] = v14:getText("FilterMenu", "FilterForLocalization"), 
        [l_EventFilterTypes_0.Monetization] = v14:getText("FilterMenu", "FilterForMonetization"), 
        [l_EventFilterTypes_0.Permissions] = v14:getText("FilterMenu", "FilterForPermissions"), 
        [l_EventFilterTypes_0.Place] = v14:getText("FilterMenu", "FilterForPlace"), 
        [l_EventFilterTypes_0.Publish] = v14:getText("FilterMenu", "FilterForPublish")
    };
end;
local function v17(v16) --[[ Line: 36 ]] --[[ Name: getFilterChoices ]]
    return {
        v16:getText("FilterMenu", "FilterForNone"), 
        v16:getText("FilterMenu", "FilterFor7days"), 
        v16:getText("FilterMenu", "FilterFor30days"), 
        v16:getText("FilterMenu", "FilterFor90days"), 
        v16:getText("FilterMenu", "FilterFor365days")
    };
end;
local v18 = {
    0, 
    7, 
    30, 
    90, 
    365
};
local function v26(v19, _) --[[ Line: 63 ]] --[[ Name: getFilterEmptyState ]]
    -- upvalues: l_EventFilterTypes_0 (copy)
    local v21 = {
        JumpToDateIndex = 1, 
        EventCategories = {}, 
        Collaborators = {}
    };
    for _, v23 in pairs(l_EventFilterTypes_0) do
        v21.EventCategories[v23] = true;
    end;
    for v24, _ in pairs(v19) do
        v21.Collaborators[v24] = true;
    end;
    return v21;
end;
local function v37(v27, v28) --[[ Line: 79 ]] --[[ Name: compareFilterOptions ]]
    if v27.JumpToDateIndex ~= v28.JumpToDateIndex then
        return false;
    else
        for v29, v30 in pairs(v27.EventCategories) do
            if v28.EventCategories[v29] ~= v30 then
                return false;
            end;
        end;
        for v31, v32 in pairs(v28.EventCategories) do
            if v27.EventCategories[v31] ~= v32 then
                return false;
            end;
        end;
        for v33, v34 in pairs(v27.Collaborators) do
            if v28.Collaborators[v33] ~= v34 then
                return false;
            end;
        end;
        for v35, v36 in pairs(v28.Collaborators) do
            if v27.Collaborators[v35] ~= v36 then
                return false;
            end;
        end;
        return true;
    end;
end;
local function v40(v38) --[[ Line: 112 ]] --[[ Name: getUnixMsFromDateIndex ]]
    -- upvalues: v18 (copy)
    local v39 = 86400000 * v18[v38];
    return DateTime.now().UnixTimestampMillis - v39;
end;
local function v42(v41) --[[ Line: 119 ]] --[[ Name: getNumDaysFromDateIndex ]]
    -- upvalues: v18 (copy)
    return v18[v41];
end;
local function v64(v43, v44, v45) --[[ Line: 126 ]] --[[ Name: filterOptionsToFilterFn ]]
    -- upvalues: v6 (copy), v18 (copy), l_SectionHeaderType_0 (copy)
    return function(v46) --[[ Line: 131 ]]
        -- upvalues: v44 (copy), v6 (ref), v43 (copy), v18 (ref), l_SectionHeaderType_0 (ref), v45 (copy)
        local function v52(v47) --[[ Line: 132 ]] --[[ Name: shouldKeepEvent ]]
            -- upvalues: v44 (ref), v6 (ref), v43 (ref)
            local l_next_0 = next;
            if v47.placeId ~= nil and v47.placeId ~= v44 then
                return false;
            else
                local v49 = v6.eventTypeToCategory(v47.eventType);
                if v49 == "Unknown" then
                    return false;
                else
                    local v50 = true;
                    if l_next_0(v43.EventCategories) ~= nil then
                        v50 = v43.EventCategories[v49];
                    end;
                    if v50 ~= nil and not v50 then
                        return false;
                    else
                        local v51 = true;
                        if l_next_0(v43.Collaborators) ~= nil then
                            v51 = v43.Collaborators[v47.userId];
                        end;
                        if v51 ~= nil then
                            return v51;
                        else
                            return true;
                        end;
                    end;
                end;
            end;
        end;
        local v53 = {};
        local v54 = nil;
        local v55 = v18[v43.JumpToDateIndex];
        local v56 = false;
        local v57 = false;
        for _, v59 in pairs(v46) do
            local v60 = if v59.headerType == l_SectionHeaderType_0.Top then tostring(v45:getText("ActivityHistoryMain", "WithinNumDays", {
                numDays = tostring(v55)
            })) .. " \226\134\147" else if l_SectionHeaderType_0.Middle then tostring(v45:getText("ActivityHistoryMain", "BeforeNumDays", {
                numDays = tostring(v55)
            })) .. " \226\134\147" else nil;
            if v52(v59) then
                local l_v59_0 = v59;
                if v59.headerType then
                    if v59.headerType == l_SectionHeaderType_0.Middle then
                        v56 = true;
                    end;
                    l_v59_0 = {
                        id = v59.id, 
                        eventType = v59.eventType, 
                        userId = v59.userId, 
                        universeId = v59.universeId, 
                        placeId = v59.placeId, 
                        resourceId = v59.resourceId, 
                        metaData = v59.metaData, 
                        createdUnixTimeMs = v59.createdUnixTimeMs, 
                        headerText = v60
                    };
                    if v59.headerType == l_SectionHeaderType_0.Top and #v53 > 0 then
                        v53[1].headerText = l_v59_0.headerText;
                        l_v59_0.headerText = nil;
                    end;
                elseif v54 then
                    if v57 then
                        v56 = true;
                    end;
                    l_v59_0 = {
                        id = v59.id, 
                        eventType = v59.eventType, 
                        userId = v59.userId, 
                        universeId = v59.universeId, 
                        placeId = v59.placeId, 
                        resourceId = v59.resourceId, 
                        metaData = v59.metaData, 
                        createdUnixTimeMs = v59.createdUnixTimeMs, 
                        headerText = v54
                    };
                end;
                v54 = nil;
                table.insert(v53, l_v59_0);
            elseif v59.headerType then
                if v59.headerType == l_SectionHeaderType_0.Middle then
                    v57 = true;
                end;
                v54 = v60;
            end;
        end;
        if v55 and v55 > 0 and not v56 and #v53 > 0 then
            local v62 = v53[#v53];
            local v63 = {
                id = v62.id, 
                eventType = v62.eventType, 
                userId = v62.userId, 
                universeId = v62.universeId, 
                placeId = v62.placeId, 
                resourceId = v62.resourceId, 
                metaData = v62.metaData, 
                createdUnixTimeMs = v62.createdUnixTimeMs, 
                headerText = v62.headerText, 
                footerText = v45:getText("ActivityHistoryMain", "NoEventsBeforeNumDays", {
                    numDays = tostring(v55)
                })
            };
            v53[#v53] = v63;
        end;
        return v53;
    end;
end;
local function v67(v65, v66) --[[ Line: 250 ]] --[[ Name: mergeFilterOptions ]]
    -- upvalues: v3 (copy)
    return {
        JumpToDateIndex = if v66.JumpToDateIndex == -1 then v65.JumpToDateIndex else v66.JumpToDateIndex, 
        Collaborators = v3.Dictionary.join(v65.Collaborators, v66.Collaborators), 
        EventCategories = v3.Dictionary.join(v65.EventCategories, v66.EventCategories)
    };
end;
local function v86(v68, v69, v70) --[[ Line: 261 ]] --[[ Name: filterOptionsToStrings ]]
    -- upvalues: v17 (copy), v15 (copy)
    local v71 = "";
    local v72 = {};
    if v68.JumpToDateIndex > 1 then
        v71 = v71 .. v69:getText("FilterMenu", "JumpToDate") .. " <b>(" .. v17(v69)[v68.JumpToDateIndex] .. ")</b>";
        table.insert(v72, "<b>" .. v69:getText("FilterMenu", "JumpToDate") .. "</b>:<br/>" .. v17(v69)[v68.JumpToDateIndex]);
    end;
    local v73 = 0;
    local v74 = "";
    local v75 = v15(v69);
    local v76 = 0;
    for v77, _ in pairs(v68.EventCategories) do
        if v68.EventCategories[v77] then
            if #v74 > 0 then
                v74 = v74 .. ", ";
            end;
            v74 = v74 .. v75[v77];
            v73 = v73 + 1;
        end;
        v76 = v76 + 1;
    end;
    if v76 > 0 and v73 < v76 then
        if #v71 > 0 then
            v71 = v71 .. "; ";
        end;
        local v79 = v69:getText("FilterMenu", "ByType") .. " <b>(" .. v73 .. ")</b>";
        v71 = v71 .. v79;
        if v73 > 0 then
            table.insert(v72, "<b>" .. v79 .. "</b>:<br/>" .. v74);
        end;
    end;
    local v80 = 0;
    local v81 = 0;
    local v82 = "";
    for v83, _ in pairs(v68.Collaborators) do
        if v68.Collaborators[v83] then
            if #v82 > 0 then
                v82 = v82 .. ", ";
            end;
            v82 = v82 .. v70[v83];
            v80 = v80 + 1;
        end;
        v81 = v81 + 1;
    end;
    if v81 > 0 and v80 < v81 then
        if #v71 > 0 then
            v71 = v71 .. "; ";
        end;
        local v85 = v69:getText("FilterMenu", "ByCollaborator") .. " <b>(" .. v80 .. ")</b>";
        v71 = v71 .. v85;
        if v80 > 0 then
            table.insert(v72, "<b>" .. v85 .. "</b>:<br/>" .. v82);
        end;
    end;
    return {
        shortString = v71, 
        descriptiveStrings = v72
    };
end;
local function v121(v87) --[[ Line: 363 ]] --[[ Name: CheckBoxes ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), v3 (copy), l_joinTags_0 (copy), v11 (copy), l_Checkbox_0 (copy), v5 (copy)
    local v88 = l_Localization_0:use();
    local v91 = v1.useMemo(function() --[[ Line: 366 ]]
        -- upvalues: v87 (copy)
        for _, v90 in pairs(v87.checkboxes) do
            if not v90 then
                return false;
            end;
        end;
        return true;
    end, {
        v87.checkboxes
    });
    local v95 = v1.useCallback(function() --[[ Line: 375 ]]
        -- upvalues: v87 (copy), v91 (copy)
        local v92 = {};
        for v93, _ in pairs(v87.rows) do
            v92[v93] = not v91;
        end;
        v87.onChange(v92);
    end, {
        v91
    });
    local v96 = v1.useMemo(function() --[[ Line: 383 ]]
        -- upvalues: v87 (copy), v3 (ref)
        if v87.ordering == nil then
            return v3.Dictionary.keys(v87.rows);
        else
            return v87.ordering;
        end;
    end, {
        v87.ordering, 
        v87.rows
    });
    local v97 = v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Row", "Component-FilterMenu-By"), 
        LayoutOrder = v11:getNextOrder()
    }, {
        Label = v1.createElement("TextLabel", {
            Text = v87.title, 
            LayoutOrder = v11:getNextOrder()
        }), 
        SelectAll = v1.createElement("TextButton", {
            [v1.Tag] = l_joinTags_0("Component-OptionButton"), 
            Text = v91 and v88:getText("FilterMenu", "UnselectAll") or v88:getText("FilterMenu", "SelectAll"), 
            LayoutOrder = v11:getNextOrder(), 
            [v1.Event.Activated] = v95
        })
    });
    local v98 = {};
    local v99 = 1;
    for _, v101 in ipairs(v96) do
        local v102 = v87.rows[v101];
        if v102 ~= nil then
            v99 = v99 + 1;
            local function v108() --[[ Line: 418 ]]
                -- upvalues: v3 (ref), v87 (copy), v101 (copy)
                local l_join_0 = v3.Dictionary.join;
                local l_checkboxes_0 = v87.checkboxes;
                local v105 = {};
                local l_v101_0 = v101;
                local v107 = true;
                if v87.checkboxes[v101] ~= nil then
                    v107 = v87.checkboxes[v101];
                end;
                v105[l_v101_0] = not v107;
                l_join_0 = l_join_0(l_checkboxes_0, v105);
                v87.onChange(l_join_0);
            end;
            local l_createElement_0 = v1.createElement;
            local v110 = "Frame";
            local v111 = {
                [v1.Tag] = l_joinTags_0("X-Row", "Component-FilterMenu-CheckBoxes", "CX-Invisible"), 
                LayoutOrder = v11:getNextOrder()
            };
            local v112 = {};
            local l_createElement_1 = v1.createElement;
            local v114 = "Frame";
            local v115 = {
                [v1.Tag] = l_joinTags_0("CX-Invisible")
            };
            local v116 = {};
            local l_createElement_2 = v1.createElement;
            local l_l_Checkbox_0_0 = l_Checkbox_0;
            local v119 = {
                LayoutOrder = v11:getNextOrder()
            };
            local v120 = true;
            if v87.checkboxes[v101] ~= nil then
                v120 = v87.checkboxes[v101];
            end;
            v119.Checked = v120;
            v119.OnClick = v108;
            v116.Checkbox = l_createElement_2(l_l_Checkbox_0_0, v119);
            v112.CheckboxContainer = l_createElement_1(v114, v115, v116);
            v112.Text = v1.createElement("TextButton", {
                [v1.Tag] = l_joinTags_0("Component-CheckboxButton"), 
                Text = v102, 
                LayoutOrder = v11:getNextOrder(), 
                [v1.Event.Activated] = v108
            });
            v98[v99] = l_createElement_0(v110, v111, v112);
        end;
    end;
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Column", "CX-Invisible"), 
        Size = UDim2.new(1, 0, 0, v5.checkBoxRowHeight * (v99 - 1) + v5.byHeight), 
        LayoutOrder = v87.LayoutOrder
    }, v3.Dictionary.join({
        v97
    }, v98));
end;
return {
    FilterMenu = function(v122) --[[ Line: 465 ]] --[[ Name: FilterMenu ]]
        -- upvalues: l_Localization_0 (copy), v1 (copy), l_joinTags_0 (copy), v11 (copy), v4 (copy), v17 (copy), v121 (copy), v15 (copy)
        local v123 = l_Localization_0:use();
        local v127 = v1.useMemo(function() --[[ Line: 468 ]]
            -- upvalues: v122 (copy)
            local v124 = 0;
            for _, _ in pairs(v122.collaborators) do
                v124 = v124 + 1;
            end;
            return v124;
        end, {
            v122.collaborators
        });
        local v131 = v1.useMemo(function() --[[ Line: 475 ]]
            -- upvalues: v122 (copy)
            local v128 = {};
            for v129, v130 in pairs(v122.collaborators) do
                v128[v129] = v130;
            end;
            return v128;
        end, {
            v122.collaborators
        });
        local l_createElement_3 = v1.createElement;
        local v133 = "Frame";
        local v134 = {
            [v1.Tag] = l_joinTags_0("Component-FilterMenu", "X-Column", "X-Fill")
        };
        local v135 = {
            Header = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("X-Row", "CX-Invisible"), 
                LayoutOrder = v11:getNextOrder()
            }, {
                Text = v1.createElement("TextLabel", {
                    Text = v123:getText("FilterMenu", "FilterEvents"), 
                    LayoutOrder = v11:getNextOrder()
                }), 
                Buttons = v1.createElement("Frame", {
                    [v1.Tag] = l_joinTags_0("X-Row", "X-Fit", "CX-Invisible"), 
                    LayoutOrder = v11:getNextOrder()
                }, {
                    Clear = v1.createElement("TextButton", {
                        [v1.Tag] = l_joinTags_0("Component-OptionButton", "X-Fit"), 
                        Text = v123:getText("FilterMenu", "Clear"), 
                        LayoutOrder = v11:getNextOrder(), 
                        [v1.Event.Activated] = function() --[[ Line: 504 ]]
                            -- upvalues: v122 (copy)
                            if v122.onClear then
                                v122.onClear();
                            end;
                        end
                    }), 
                    Apply = v1.createElement("TextButton", {
                        [v1.Tag] = l_joinTags_0("Component-OptionButton", "X-Fit"), 
                        Text = v123:getText("FilterMenu", "Done"), 
                        LayoutOrder = v11:getNextOrder(), 
                        [v1.Event.Activated] = function() --[[ Line: 515 ]]
                            -- upvalues: v122 (copy)
                            if v122.onApply then
                                v122.onApply();
                            end;
                        end
                    })
                })
            }), 
            Divider = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("CX-Divider"), 
                LayoutOrder = v11:getNextOrder()
            })
        };
        local l_createElement_4 = v1.createElement;
        local v137 = "ScrollingFrame";
        local v138 = {
            [v1.Tag] = l_joinTags_0("CX-Invisible"), 
            LayoutOrder = v11:getNextOrder(), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(0, 0, 0, 0)
        };
        local v142 = {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ByDateRange = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("X-Column", "X-Fit", "CX-Invisible"), 
                LayoutOrder = v11:getNextOrder()
            }, {
                Label = v1.createElement("TextLabel", {
                    [v1.Tag] = l_joinTags_0("X-Fit"), 
                    Text = v123:getText("FilterMenu", "JumpToDate"), 
                    LayoutOrder = v11:getNextOrder()
                }), 
                ByDateRangeFilter = v1.createElement(v4, {
                    onChanged = function(v139) --[[ Line: 552 ]] --[[ Name: onChanged ]]
                        -- upvalues: v122 (copy)
                        if v122.onChange then
                            v122.onChange({
                                JumpToDateIndex = v139, 
                                EventCategories = {}, 
                                Collaborators = {}
                            });
                        end;
                    end, 
                    layoutOrder = v11:getNextOrder(), 
                    items = v17(v123), 
                    selectedItemIndex = v122.selectedFilters.JumpToDateIndex
                })
            }), 
            ByTypeCheckBoxes = v1.createElement(v121, {
                rows = v15(v123), 
                title = v123:getText("FilterMenu", "ByType"), 
                checkboxes = v122.selectedFilters.EventCategories, 
                LayoutOrder = v11:getNextOrder(), 
                onChange = function(v140) --[[ Line: 572 ]] --[[ Name: onChange ]]
                    -- upvalues: v122 (copy)
                    if v122.onChange then
                        local v141 = {
                            JumpToDateIndex = -1, 
                            EventCategories = v140, 
                            Collaborators = {}
                        };
                        v122.onChange(v141);
                    end;
                end
            })
        };
        local v143 = false;
        if v127 > 0 then
            v143 = v1.createElement(v121, {
                rows = v131, 
                title = v123:getText("FilterMenu", "ByCollaborator"), 
                checkboxes = v122.selectedFilters.Collaborators, 
                LayoutOrder = v11:getNextOrder(), 
                onChange = function(v144) --[[ Line: 589 ]] --[[ Name: onChange ]]
                    -- upvalues: v122 (copy)
                    if v122.onChange then
                        v122.onChange({
                            JumpToDateIndex = -1, 
                            EventCategories = {}, 
                            Collaborators = v144
                        });
                    end;
                end
            });
        end;
        v142.ByCollaboratorCheckBoxes = v143;
        v135.Contents = l_createElement_4(v137, v138, v142);
        return l_createElement_3(v133, v134, v135);
    end, 
    compareFilterOptions = v37, 
    getUnixMsFromDateIndex = v40, 
    getNumDaysFromDateIndex = v42, 
    filterOptionsToFilterFn = v64, 
    filterOptionsToStrings = v86, 
    getFilterEmptyState = v26, 
    mergeFilterOptions = v67
};