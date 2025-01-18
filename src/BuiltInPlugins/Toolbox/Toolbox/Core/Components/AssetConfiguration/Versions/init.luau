local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Cryo);
local v5 = require(l_Packages_0.Framework);
local _ = v5.Util.deepCopy;
local l_deepEqual_0 = v5.Util.deepEqual;
local l_AssetConfiguration_0 = l_script_FirstAncestor_0.Core.Components.AssetConfiguration;
local v9 = require(l_AssetConfiguration_0.VersionItem);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v11 = require(l_Util_0.Constants);
local _ = v5.Dash.slice;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v15 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local l_Permissions_0 = l_script_FirstAncestor_0.Core.Components.AssetConfiguration.Permissions;
local v17 = require(l_Permissions_0.PermissionsConstants);
local l_Requests_0 = l_script_FirstAncestor_0.Core.Networking.Requests;
local v19 = require(l_Requests_0.GetVersionsHistoryRequest);
local v20 = require(l_Requests_0.MakeChangeRequest);
local v21 = require(script.Parent.VersionsTableCell);
local l_UI_0 = v5.UI;
local l_PaginatedTable_0 = l_UI_0.PaginatedTable;
local l_Container_0 = l_UI_0.Container;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v27 = require(l_Util_0.AssetConfigConstants);
local v28 = require(l_script_FirstAncestor_0.Core.Actions.SetFieldError);
local v29 = v2.PureComponent:extend("Versions");
local v30 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxAddPackageVersionDescriptions);
local function v33(v31, v32) --[[ Line: 61 ]] --[[ Name: renderItem ]]
    -- upvalues: v2 (copy), v9 (copy)
    v31.IsCurrent = v32;
    v31.DividerAnchorPoint = Vector2.new(0.5, 1);
    if v32 then
        v31.DividerPosition = UDim2.new(0.5, 0, 1, 0);
        v31.DividerSize = UDim2.new(1, -30, 0, 1);
    else
        v31.DividerPosition = UDim2.new(0.5, 40, 1, 0);
        v31.DividerSize = UDim2.new(1, -120, 0, 1);
    end;
    return v2.createElement(v9, v31);
end;
local function v35(v34) --[[ Line: 76 ]] --[[ Name: renderCurrentItem ]]
    -- upvalues: v33 (copy)
    return v33(v34, true);
end;
local function v37(v36) --[[ Line: 80 ]] --[[ Name: renderListItem ]]
    -- upvalues: v33 (copy)
    return v33(v36, false);
end;
v29.init = function(v38, v39) --[[ Line: 84 ]] --[[ Name: init ]]
    -- upvalues: v30 (copy), v11 (copy)
    local v40 = 0;
    if v39.changeTable and v39.changeTable.VersionItemSelect then
        v40 = if v30() then v39.changeTable.VersionItemSelect[1] else v39.changeTable.VersionItemSelect;
    end;
    if v30() then
        v38.state = {
            selectVersion = v40, 
            creatorIdsToUsernames = {}, 
            loadingDescriptions = true
        };
    else
        v38.state = {
            currentItem = {}, 
            selectVersion = v40
        };
    end;
    v38.OnItemClicked = function(v41) --[[ Line: 108 ]]
        -- upvalues: v38 (copy), v30 (ref)
        local l_selectVersion_0 = v38.state.selectVersion;
        local v43 = nil;
        if v30() then
            v43 = v41;
            if l_selectVersion_0 == v41 then
                v43 = nil;
            end;
        else
            v43 = v41.assetVersionNumber;
            if l_selectVersion_0 == v41.assetVersionNumber then
                v43 = nil;
            end;
        end;
        if v43 then
            if v30() then
                v38.props.makeChangeRequest("VersionItemSelect", {
                    l_selectVersion_0, 
                    v38.props.currentItem.assetVersionNumber
                }, {
                    v43, 
                    v38.props.currentItem.assetVersionNumber
                });
            else
                v38.props.makeChangeRequest("VersionItemSelect", l_selectVersion_0, v43);
            end;
            v38:setState({
                selectVersion = v43
            });
            return;
        else
            if v30() then
                v38.props.makeChangeRequest("VersionItemSelect", {
                    v43, 
                    v38.props.currentItem.assetVersionNumber
                }, {
                    v43, 
                    v38.props.currentItem.assetVersionNumber
                });
            else
                v38.props.makeChangeRequest("VersionItemSelect", v43, v43);
            end;
            v38:setState({
                selectVersion = 0
            });
            return;
        end;
    end;
    v38.GetRowHeight = function(v44, v45) --[[ Line: 154 ]]
        -- upvalues: v38 (copy), v11 (ref)
        if v44.versionColumn == v38.props.openInputKey then
            return v11.VERSIONS_INPUT_ROW_HEIGHT;
        elseif v44.descriptionColumn.versionDescription then
            local v46 = math.ceil(string.len(v44.descriptionColumn.versionDescription) / v11.VERSIONS_CHARS_PER_LINE) - 1;
            if v46 > 0 then
                return v45 + v46 * v11.VERSIONS_LINE_HEIGHT;
            else
                return v45;
            end;
        else
            return v45;
        end;
    end;
    v38.OnPageChange = function(v47) --[[ Line: 171 ]]
        -- upvalues: v38 (copy), v11 (ref)
        v38.props.onPageChange(v47, v11.VERSIONS_ROWS_PER_PAGE);
    end;
end;
v29.didMount = function(v48) --[[ Line: 176 ]] --[[ Name: didMount ]]
    -- upvalues: v30 (copy), v17 (copy)
    if not v30() and v48.props.assetId then
        v48.props.getVersionsHistory(v48.props.Network.networkInterface, v48.props.assetId);
    end;
    if v30() then
        local v49 = {};
        if v48.props.versionHistory then
            local _ = {};
            for _, v52 in ipairs(v48.props.versionHistory) do
                local v53 = nil;
                if not v49[v52.creatorTargetId] then
                    local l_owner_0 = v48.props.owner;
                    if l_owner_0 and l_owner_0.targetId == v52.creatorTargetId and Enum.CreatorType[l_owner_0.type] == Enum.CreatorType.User then
                        v53 = l_owner_0.username;
                    elseif l_owner_0 and l_owner_0.targetId == v52.creatorTargetId and Enum.CreatorType[l_owner_0.type] == Enum.CreatorType.Group and v48.props.assetGroupData then
                        v53 = v48.props.assetGroupData.Name;
                    end;
                    if not v53 and v48.props.permissions[v17.UserSubjectKey] and v48.props.permissions[v17.UserSubjectKey][tostring(v52.creatorTargetId)] and v48.props.permissions[v17.UserSubjectKey][tostring(v52.creatorTargetId)][v17.SubjectNameKey] then
                        v53 = v48.props.permissions[v17.UserSubjectKey][tostring(v52.creatorTargetId)][v17.SubjectNameKey];
                    end;
                    v49[v52.creatorTargetId] = v53;
                else
                    v53 = v49[v52.creatorTargetId];
                end;
            end;
            v48:setState({
                creatorIdsToUsernames = v49
            });
        end;
    end;
end;
local function v57(v55) --[[ Line: 226 ]] --[[ Name: extractFirstVersionItem ]]
    -- upvalues: v30 (copy), v4 (copy)
    if not v30() then
        local v56 = v55[1] or {};
        return v4.Dictionary.join({}, v56);
    else
        return;
    end;
end;
local function _(v58, v59) --[[ Line: 240 ]] --[[ Name: copyPreviousVersions ]]
    local v60 = #v59;
    local v61 = #v58;
    for v62 = v60 + 2, v61 do
        v59[v62 - 1] = v58[v62];
    end;
end;
v29.createVersionsContent = function(v64, v65, v66) --[[ Line: 252 ]] --[[ Name: createVersionsContent ]]
    -- upvalues: v2 (copy), v11 (copy), v30 (copy), l_Container_0 (copy), l_LoadingIndicator_0 (copy), l_PaginatedTable_0 (copy), v21 (copy), v27 (copy)
    local l_props_0 = v64.props;
    local l_state_0 = v64.state;
    local l_versions_0 = v64.props.Stylizer.versions;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20)
        }), 
        Title = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v11.VERSIONS_TITLE_HEIGHT), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            VersionsLabel = v2.createElement("TextLabel", {
                Position = UDim2.new(0, 15, 0, 15), 
                Size = UDim2.new(0, 50, 0, v11.VERSIONS_TITLE_HEIGHT), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_props_0.Localization:getText("AssetConfigVersions", "VersionHistory"), 
                TextColor3 = l_versions_0.textColor, 
                Font = v11.FONT_BOLD, 
                TextSize = v11.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        PreviousVersion = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v11.VERSIONS_TITLE_HEIGHT), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 3
        }, {
            VersionsLabel = v2.createElement("TextLabel", {
                Position = UDim2.new(0, 15, 0, -10), 
                Size = UDim2.new(0, 50, 0, v11.VERSIONS_TITLE_HEIGHT), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_props_0.Localization:getText("AssetConfigVersions", "AddANote"), 
                TextColor3 = l_versions_0.dimmedTextColor, 
                Font = v11.FONT, 
                TextSize = v11.FONT_SIZE_LARGE, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        ItemsTable = l_props_0.versionHistory and v2.createElement("Frame", {
            Size = UDim2.new(0.9, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 4
        }, {
            VersionsTable = if l_state_0.loadingDescriptions and v30() then v2.createElement(l_Container_0, {
                Size = UDim2.new(1, 0, 0.5, 0)
            }, {
                LoadingIndicator = v2.createElement(l_LoadingIndicator_0, {
                    Size = UDim2.new(0, 40, 0, 40), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            }) else v2.createElement(l_PaginatedTable_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, 15, 0, -20), 
                Columns = v66, 
                Rows = l_props_0.pageRootItems, 
                CellComponent = v21.Component, 
                CellProps = {
                    Theme = l_versions_0, 
                    CurrentVersion = v65.assetVersionNumber, 
                    SelectVersion = l_state_0.selectVersion, 
                    OnClickItem = v64.OnItemClicked, 
                    IdsToUsernames = l_state_0.creatorIdsToUsernames, 
                    OpenInputKey = l_props_0.openInputKey, 
                    OnClickDesc = l_props_0.onDescClicked, 
                    PreviousInput = l_props_0.previousInput, 
                    SetPreviousInput = l_props_0.setPreviousInput, 
                    CloseInput = l_props_0.closeInput, 
                    SetVersionError = l_props_0.setVersionError, 
                    ErrorCallback = function(v70) --[[ Line: 355 ]] --[[ Name: ErrorCallback ]]
                        -- upvalues: v64 (copy), v27 (ref)
                        v64.props.setFieldError(v27.FIELD_NAMES.Title, v70);
                    end
                }, 
                RowHeight = v11.VERSIONS_ROW_HEIGHT, 
                GetRowHeight = v64.GetRowHeight, 
                PageSize = v11.VERSIONS_ROWS_PER_PAGE, 
                PageIndex = l_props_0.pageIndex, 
                PageCount = math.ceil(#l_props_0.rootItems / v11.VERSIONS_ROWS_PER_PAGE), 
                OnPageChange = v64.OnPageChange, 
                Footer = true
            })
        })
    });
end;
v29.didUpdate = function(v71, v72, v73) --[[ Line: 371 ]] --[[ Name: didUpdate ]]
    -- upvalues: v30 (copy), v57 (copy), l_deepEqual_0 (copy)
    if not v30() then
        local l_currentItem_0 = v73.currentItem;
        local l_versionHistory_0 = v71.props.versionHistory;
        if not next(l_currentItem_0) and l_versionHistory_0 then
            v71:setState({
                currentItem = v57(l_versionHistory_0)
            });
        end;
    end;
    if v30() then
        local l_packageDescriptions_0 = v71.props.packageDescriptions;
        local l_packageDescriptions_1 = v72.packageDescriptions;
        if l_packageDescriptions_0 and v71.props.rootItems and (not l_deepEqual_0(l_packageDescriptions_1, v71.props.packageDescriptions) or v71.props.rootItems[1] and not v71.props.rootItems[1].descriptionColumn.versionDescription) then
            local l_rootItems_0 = v71.props.rootItems;
            for v79, v80 in pairs(l_packageDescriptions_0) do
                if l_rootItems_0[v79] then
                    l_rootItems_0[v79].descriptionColumn.versionDescription = v80;
                end;
            end;
            v71.props.setStates(l_rootItems_0);
        end;
        v71:setState({
            loadingDescriptions = false
        });
    end;
end;
local function v86(v81) --[[ Line: 407 ]] --[[ Name: createItemList ]]
    -- upvalues: v2 (copy), v37 (copy)
    local v82 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20)
        })
    };
    local l_ItemListInfo_0 = v81.ItemListInfo;
    for v84 = 2, #l_ItemListInfo_0 do
        local v85 = l_ItemListInfo_0[v84];
        v82[v85.assetVersionNumber] = v2.createElement(v37, {
            ItemInfo = v85, 
            Size = v81.ItemSize, 
            SelectVersion = v81.SelectVersion, 
            ItemClickCallBack = v81.ItemClickCallBack, 
            LayoutOrder = v84 - 1
        });
    end;
    return v2.createElement("Frame", {
        Size = v81.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v81.LayoutOrder
    }, v82);
end;
v29.render = function(v87) --[[ Line: 441 ]] --[[ Name: render ]]
    -- upvalues: v30 (copy), v2 (copy), l_ScrollingFrame_0 (copy), v11 (copy), v35 (copy), v86 (copy)
    local l_props_1 = v87.props;
    local l_state_1 = v87.state;
    local l_versions_1 = l_props_1.Stylizer.versions;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Size_0 = l_props_1.Size;
    local l_versionHistory_1 = l_props_1.versionHistory;
    local v94 = nil;
    v94 = if v30() then l_props_1.currentItem else l_state_1.currentItem;
    local l_selectVersion_1 = l_state_1.selectVersion;
    local v96 = {
        [1] = "versionColumn", 
        [2] = "descriptionColumn", 
        [3] = "restoreColumn"
    };
    local v97 = {
        UDim.new(0.14, 0), 
        UDim.new(0.76, 0), 
        UDim.new(0.1, 0)
    };
    local v98 = {
        {
            Name = l_props_1.Localization:getText("AssetConfigVersions", "Version"), 
            Key = v96[1], 
            Width = v97[1]
        }, 
        {
            Name = l_props_1.Localization:getText("AssetConfigVersions", "Notes"), 
            Key = v96[2], 
            Width = v97[2]
        }, 
        {
            Name = l_props_1.Localization:getText("AssetConfigVersions", "RestoreLabel"), 
            Key = v96[3], 
            Width = v97[3]
        }
    };
    if v30() then
        return v2.createElement(l_ScrollingFrame_0, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = l_LayoutOrder_0, 
            ScrollBarImageColor3 = l_versions_1.dimmedTextColor, 
            Size = l_Size_0
        }, {
            VersionsContent = if l_props_1.openInputKey ~= -1 then v2.createElement("ImageButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                [v2.Event.Activated] = function() --[[ Line: 498 ]]
                    -- upvalues: l_props_1 (copy)
                    l_props_1.closeInput(false);
                end
            }, {
                Content = v87:createVersionsContent(v94, v98)
            }) else v87:createVersionsContent(v94, v98)
        });
    else
        return v2.createElement("ScrollingFrame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = l_versionHistory_1 and UDim2.new(0, 0, 1, #l_versionHistory_1 * v11.VERSIONS_ITEM_HEIGHT) or nil, 
            LayoutOrder = l_LayoutOrder_0, 
            ScrollBarImageColor3 = l_versions_1.textColor, 
            Size = l_Size_0
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            }), 
            Title = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v11.VERSIONS_TITLE_HEIGHT), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                VersionsLabel = v2.createElement("TextLabel", {
                    Position = UDim2.new(0, 10, 0, 0), 
                    Size = UDim2.new(0, 50, 0, v11.VERSIONS_TITLE_HEIGHT), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = l_props_1.Localization:getText("AssetConfigVersions", "Current"), 
                    TextColor3 = l_versions_1.textColor, 
                    Font = v11.FONT_BOLD, 
                    TextSize = v11.FONT_SIZE_TITLE, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            CurrentItem = next(v94) and v2.createElement(v35, {
                Size = UDim2.new(1, 0, 0, v11.VERSIONS_ITEM_HEIGHT), 
                ItemInfo = v94, 
                LayoutOrder = 2
            }), 
            PreviousVersion = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v11.VERSIONS_TITLE_HEIGHT), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 3
            }, {
                VersionsLabel = v2.createElement("TextLabel", {
                    Position = UDim2.new(0, 10, 0, 0), 
                    Size = UDim2.new(0, 50, 0, v11.VERSIONS_TITLE_HEIGHT), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = l_props_1.Localization:getText("AssetConfigVersions", "Restore"), 
                    TextColor3 = l_versions_1.textColor, 
                    Font = v11.FONT_BOLD, 
                    TextSize = v11.FONT_SIZE_TITLE, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            ItemList = l_versionHistory_1 and v2.createElement(v86, {
                Size = UDim2.new(1, 0, 1, -v11.VERSIONS_TITLE_HEIGHT * 2 - v11.VERSIONS_ITEM_HEIGHT), 
                SelectVersion = l_selectVersion_1, 
                ItemSize = UDim2.new(1, 0, 0, v11.VERSIONS_ITEM_HEIGHT), 
                ItemListInfo = l_versionHistory_1, 
                ItemClickCallBack = v87.OnItemClicked, 
                LayoutOrder = 4
            })
        });
    end;
end;
local function v107(v99, v100) --[[ Line: 600 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v30 (copy)
    v99 = v99 or {};
    local l_versionHistory_2 = v99.versionHistory;
    local l_packageDescriptions_2 = v99.packageDescriptions;
    local l_changed_0 = v99.changed;
    local v104 = v99.collaborators or {};
    local v105 = v99.assetConfigData and v99.assetConfigData.Creator or v100.Owner;
    local v106 = v105 and v99[v105.targetId] and v99[v105.targetId].groupMetadata;
    if v30() then
        return {
            packageDescriptions = l_packageDescriptions_2, 
            changeTable = l_changed_0, 
            permissions = v104, 
            owner = v105, 
            assetGroupData = v106
        };
    else
        return {
            versionHistory = l_versionHistory_2, 
            changeTable = l_changed_0
        };
    end;
end;
local function v116(v108) --[[ Line: 629 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), v20 (copy), v28 (copy), v27 (copy)
    return {
        getVersionsHistory = function(v109, v110) --[[ Line: 631 ]] --[[ Name: getVersionsHistory ]]
            -- upvalues: v108 (copy), v19 (ref)
            v108(v19(v109, v110));
        end, 
        makeChangeRequest = function(v111, v112, v113) --[[ Line: 635 ]] --[[ Name: makeChangeRequest ]]
            -- upvalues: v108 (copy), v20 (ref)
            v108(v20(v111, v112, v113));
        end, 
        setFieldError = function(v114, v115) --[[ Line: 639 ]] --[[ Name: setFieldError ]]
            -- upvalues: v108 (copy), v28 (ref), v27 (ref)
            v108(v28(v27.SIDE_TABS.Versions, v114, v115));
        end
    };
end;
v29 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v15
})(v29);
return v3.connect(v107, v116)(v29);