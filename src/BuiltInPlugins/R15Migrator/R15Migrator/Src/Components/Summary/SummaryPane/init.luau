local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v3.ContextServices;
local v6 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v7 = require(l_script_FirstAncestor_0.Packages.Dash);
local v8 = require(l_script_FirstAncestor_0.Src.Util.UILayoutHelpers);
local v9 = require(l_script_FirstAncestor_0.Src.Contexts.ScriptConversionContext);
local l_UI_0 = v3.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_Image_0 = l_UI_0.Image;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Util_0 = v3.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_Util_1 = l_script_FirstAncestor_0.Src.Util;
local v24 = require(l_Util_1.TabsData);
local v25 = require(l_Util_1.SortData);
local v26 = require(script.Parent.StatusTable);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v28 = require(l_Thunks_0.LoadCharacterMetadata);
local v29 = require(l_Thunks_0.AddAdapters);
local v30 = require(l_Thunks_0.RemoveAdapters);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v32 = require(l_Actions_0.SetSelectedTab);
local v33 = require(l_Actions_0.SetSortSelection);
local l_StatusTableData_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).StatusTableData;
local v35 = require(l_script_FirstAncestor_0.Src.Util.sanitizeString);
local v36 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local v37 = require(l_script_FirstAncestor_0.Src.Modules.NpcIdManager);
local l_R15MigShowLinkedText_0 = game:GetFastFlag("R15MigShowLinkedText");
local v39 = v4.PureComponent:extend("SummaryPane");
getHeaderCellComponent = function(v40, v41, v42) --[[ Line: 59 ]] --[[ Name: getHeaderCellComponent ]]
    -- upvalues: v4 (copy), l_StyleModifier_0 (copy), l_LayoutOrderIterator_0 (copy), l_Pane_0 (copy), v7 (copy), l_StatusTableData_0 (copy), l_Image_0 (copy), l_TextWithLinks_0 (copy), l_TextLabel_0 (copy), v32 (copy), l_ContextServices_0 (copy), v6 (copy)
    local v43 = v4.PureComponent:extend(v40 .. "HeaderCellComponent");
    v43.init = function(v44) --[[ Line: 62 ]] --[[ Name: init ]]
        v44.state = {
            expanded = true
        };
    end;
    v43.render = function(v45) --[[ Line: 68 ]] --[[ Name: render ]]
        -- upvalues: l_StyleModifier_0 (ref), l_LayoutOrderIterator_0 (ref), v4 (ref), l_Pane_0 (ref), v7 (ref), v42 (copy), l_StatusTableData_0 (ref), l_Image_0 (ref), l_TextWithLinks_0 (ref), v40 (copy), v41 (copy), l_TextLabel_0 (ref)
        local l_props_0 = v45.props;
        local l_state_0 = v45.state;
        local l_Name_0 = l_props_0.Name;
        local l_ColumnIndex_0 = l_props_0.ColumnIndex;
        local l_Width_0 = l_props_0.Width;
        local l_Style_0 = l_props_0.Style;
        local v52 = {
            Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
            ImageRectOffset = Vector2.new(12, 0), 
            ImageRectSize = Vector2.new(12, 12), 
            Size = UDim2.fromOffset(12, 12), 
            [l_StyleModifier_0.Selected] = {
                ImageRectOffset = Vector2.new(24, 0)
            }
        };
        local l_Localization_0 = l_props_0.Localization;
        local v54 = l_LayoutOrderIterator_0.new();
        local l_expanded_0 = l_state_0.expanded;
        return v4.createElement(l_Pane_0, v7.assign({
            BorderColor3 = l_Style_0.Border, 
            BorderSizePixel = 1, 
            Padding = l_Style_0.HeaderCellPadding, 
            Style = "SubtleBox", 
            Size = UDim2.new(l_Width_0.Scale, l_Width_0.Offset, 1, 0), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = 10, 
            OnClick = function() --[[ Line: 101 ]] --[[ Name: OnClick ]]
                -- upvalues: v42 (ref), v45 (copy)
                v42();
                v45:setState(function(v56) --[[ Line: 103 ]]
                    return {
                        expanded = not v56.expanded
                    };
                end);
            end
        }, l_props_0.WrapperProps), {
            Arrow = if l_ColumnIndex_0 ~= l_StatusTableData_0.STATUS_COLUMN_INDEX then v4.createElement(l_Image_0, {
                LayoutOrder = v54:getNextOrder(), 
                Style = v52, 
                StyleModifier = l_expanded_0 and l_StyleModifier_0.Selected or nil, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.fromScale(0, 0.5)
            }) else nil, 
            Text = if l_ColumnIndex_0 ~= l_StatusTableData_0.STATUS_COLUMN_INDEX then v4.createElement(l_TextWithLinks_0, {
                LayoutOrder = v54:getNextOrder(), 
                Size = UDim2.fromScale(1, 1), 
                Text = l_Name_0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextProps = {
                    TextSize = l_Style_0.TextSize, 
                    Font = l_Style_0.Font, 
                    TextWrapped = false
                }, 
                LinkMap = {
                    ["[link1]"] = {
                        LinkText = l_Localization_0:getText("Summary", v40), 
                        LinkCallback = function() --[[ Line: 140 ]] --[[ Name: LinkCallback ]]
                            -- upvalues: l_props_0 (copy), v41 (ref)
                            l_props_0.setSelectedTab(v41);
                        end
                    }
                }
            }) else v4.createElement(l_TextLabel_0, {
                LayoutOrder = v54:getNextOrder(), 
                Text = l_Name_0, 
                Size = UDim2.fromScale(1, 1), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        });
    end;
    local function v59(v57) --[[ Line: 157 ]] --[[ Name: mapDispatchToPropsHeaderCellComponent ]]
        -- upvalues: v32 (ref)
        return {
            setSelectedTab = function(v58) --[[ Line: 159 ]] --[[ Name: setSelectedTab ]]
                -- upvalues: v57 (copy), v32 (ref)
                v57(v32(v58));
            end
        };
    end;
    v43 = l_ContextServices_0.withContext({
        Localization = l_ContextServices_0.Localization
    })(v43);
    return v6.connect(nil, v59)(v43);
end;
v39.init = function(v60) --[[ Line: 177 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v24 (copy), v36 (copy)
    local function _(v61) --[[ Line: 181 ]] --[[ Name: makeExpandedCallback ]]
        -- upvalues: v60 (copy), v7 (ref)
        return function() --[[ Line: 182 ]]
            -- upvalues: v60 (ref), v7 (ref), v61 (copy)
            v60:setState(function(v62) --[[ Line: 183 ]]
                -- upvalues: v7 (ref), v61 (ref)
                local v63 = v7.copy(v62.sections);
                v63[v61].expanded = not v63[v61].expanded;
                return {
                    sections = v63
                };
            end);
        end;
    end;
    local v65 = {
        expanded = {
            Convert = true, 
            Test = true, 
            ReadyToPublish = true, 
            Publish = true
        }
    };
    local v66 = {};
    local v67 = {
        keys = {}, 
        values = {}, 
        tabTarget = v24.CharacterConversion
    };
    local l_getHeaderCellComponent_0 = getHeaderCellComponent;
    local v69 = "Characters";
    local l_CharacterConversion_0 = v24.CharacterConversion;
    local v71 = 1;
    local l_v71_0 = v71 --[[ copy: 9 -> 10 ]];
    v67.headerCellComponent = l_getHeaderCellComponent_0(v69, l_CharacterConversion_0, function() --[[ Line: 182 ]]
        -- upvalues: v60 (copy), v7 (ref), l_v71_0 (copy)
        v60:setState(function(v73) --[[ Line: 183 ]]
            -- upvalues: v7 (ref), l_v71_0 (ref)
            local v74 = v7.copy(v73.sections);
            v74[l_v71_0].expanded = not v74[l_v71_0].expanded;
            return {
                sections = v74
            };
        end);
    end);
    v67.expanded = true;
    v66[1] = v67;
    v67 = {
        keys = {}, 
        values = {}, 
        tabTarget = v24.AnimationConversion
    };
    l_getHeaderCellComponent_0 = getHeaderCellComponent;
    v69 = "Animation";
    l_CharacterConversion_0 = v24.AnimationConversion;
    v71 = 2;
    local l_v71_1 = v71 --[[ copy: 9 -> 11 ]];
    v67.headerCellComponent = l_getHeaderCellComponent_0(v69, l_CharacterConversion_0, function() --[[ Line: 182 ]]
        -- upvalues: v60 (copy), v7 (ref), l_v71_1 (copy)
        v60:setState(function(v76) --[[ Line: 183 ]]
            -- upvalues: v7 (ref), l_v71_1 (ref)
            local v77 = v7.copy(v76.sections);
            v77[l_v71_1].expanded = not v77[l_v71_1].expanded;
            return {
                sections = v77
            };
        end);
    end);
    v67.expanded = true;
    v66[2] = v67;
    v67 = {
        keys = {}, 
        values = {}, 
        tabTarget = v24.ScriptConversion
    };
    l_getHeaderCellComponent_0 = getHeaderCellComponent;
    v69 = "Scripts";
    l_CharacterConversion_0 = v24.AnimationConversion;
    v71 = 3;
    v67.headerCellComponent = l_getHeaderCellComponent_0(v69, l_CharacterConversion_0, function() --[[ Line: 182 ]]
        -- upvalues: v60 (copy), v7 (ref), v71 (copy)
        v60:setState(function(v78) --[[ Line: 183 ]]
            -- upvalues: v7 (ref), v71 (ref)
            local v79 = v7.copy(v78.sections);
            v79[v71].expanded = not v79[v71].expanded;
            return {
                sections = v79
            };
        end);
    end);
    v67.expanded = true;
    v66[3] = v67;
    v65.sections = v66;
    v60.state = v65;
    v60.onExpandedChanged = function(v80) --[[ Line: 237 ]]
        -- upvalues: v60 (copy), v7 (ref)
        return function() --[[ Line: 238 ]]
            -- upvalues: v60 (ref), v7 (ref), v80 (copy)
            v60:setState(function(v81) --[[ Line: 239 ]]
                -- upvalues: v7 (ref), v80 (ref)
                local v82 = v7.copy(v81.expanded);
                v82[v80] = not v82[v80];
                return {
                    expanded = v82
                };
            end);
        end;
    end;
    v60.setSelectedTab = function(v83) --[[ Line: 249 ]]
        -- upvalues: v60 (copy), v36 (ref), v24 (ref)
        local l_props_1 = v60.props;
        local v85 = v36.getPublishTime() ~= nil;
        if v83 ~= v24.Summary and v85 then
            return;
        else
            l_props_1.setSelectedTab(v83);
            return;
        end;
    end;
    v60.setSortSelection = function(v86) --[[ Line: 260 ]]
        -- upvalues: v60 (copy)
        v60.props.setSortSelection(v86);
    end;
end;
v39.didMount = function(v87) --[[ Line: 267 ]] --[[ Name: didMount ]]
    if v87.props.characterMetadataLoadedVersion == 0 then
        v87.props.loadCharacterMetadata(v87.props.Analytics);
    end;
end;
local function v98(v88, v89, v90) --[[ Line: 273 ]] --[[ Name: sortConversionEntries ]]
    -- upvalues: v25 (copy)
    local function v96(v91) --[[ Line: 274 ]] --[[ Name: sortEntries ]]
        -- upvalues: v90 (copy), v25 (ref)
        if v90 == v25.Alphabetical then
            table.sort(v91, function(v92, v93) --[[ Line: 276 ]]
                return v92.text < v93.text;
            end);
            return;
        else
            if v90 == v25.Status then
                table.sort(v91, function(v94, v95) --[[ Line: 280 ]]
                    return not v94.complete and v95.complete;
                end);
            end;
            return;
        end;
    end;
    for v97 in v89 do
        v96(v88[v97].values);
    end;
end;
local function v115(v99, v100) --[[ Line: 291 ]] --[[ Name: updateCharacters ]]
    -- upvalues: v7 (copy), v37 (copy), v35 (copy)
    local l_characters_0 = v99.characters;
    local l_charactersConverted_0 = v99.charactersConverted;
    local v103 = v7.copy(v100.sections[1]);
    local l_keys_0 = v103.keys;
    local l_values_0 = v103.values;
    local function v112(v106, v107) --[[ Line: 299 ]] --[[ Name: countCharacters ]]
        -- upvalues: v37 (ref), v35 (ref), l_keys_0 (copy), l_values_0 (copy)
        local v108 = 0;
        for v109, v110 in v106 do
            local v111 = {
                target = if v110.key then v37.GetNpcFromId(v110.key) else nil, 
                text = v35(v110.fullName), 
                complete = v107
            };
            if not l_keys_0[v109] then
                l_keys_0[v109] = v111;
                table.insert(l_values_0, v111);
            elseif l_keys_0[v109] then
                l_keys_0[v109].complete = v107;
            end;
            v108 = v108 + 1;
        end;
        return v108;
    end;
    local v113 = v112(l_characters_0, false);
    local v114 = v112(l_charactersConverted_0, true);
    v103.total = v113 + v114;
    v103.complete = v114;
    return v103;
end;
local function v127(v116, v117) --[[ Line: 326 ]] --[[ Name: updateAnimations ]]
    -- upvalues: v7 (copy), v35 (copy)
    local l_animations_0 = v116.animations;
    local v119 = v7.copy(v117.sections[2]);
    local l_keys_1 = v119.keys;
    local l_values_1 = v119.values;
    local v122 = 0;
    local v123 = 0;
    for v124, v125 in l_animations_0 do
        local v126 = {
            target = v125.animationAssetInfo.instance, 
            text = v35(v125.name), 
            complete = not next(v125.refs)
        };
        if not l_keys_1[v124] then
            l_keys_1[v124] = v126;
            table.insert(l_values_1, v126);
        end;
        v122 = v122 + 1;
        if not next(v125.refs) then
            v123 = v123 + 1;
        end;
    end;
    v119.total = v122;
    v119.complete = v123;
    return v119;
end;
local function v145(v128, v129) --[[ Line: 356 ]] --[[ Name: updateScripts ]]
    -- upvalues: v7 (copy), v35 (copy)
    if not v128.ScriptConversionContext then
        return;
    else
        local l_scripts_0 = v128.scripts;
        local v131 = v7.copy(v129.sections[3]);
        local l_keys_2 = v131.keys;
        local l_values_2 = v131.values;
        local v134 = 0;
        local v135 = 0;
        for v136, v137 in l_scripts_0 do
            if not l_keys_2[v136] then
                local v138 = v128.ScriptConversionContext:getScriptInstanceFromGUID(v136);
                local v139 = v138 and v138:GetFullName() or "Unknown";
                v139 = v35(v139);
                local v140 = {
                    target = v138, 
                    text = v139
                };
                l_keys_2[v136] = v140;
                table.insert(l_values_2, v140);
            end;
            local v142 = v7.filter(v137:Get(), function(v141) --[[ Line: 380 ]]
                return v141.resolution == nil;
            end);
            local v143 = l_keys_2[v136];
            local v144 = true;
            if #v137._list ~= 0 then
                v144 = #v142 == 0;
            end;
            v143.complete = v144;
            if l_keys_2[v136].complete then
                v135 = v135 + 1;
            end;
            v134 = v134 + 1;
        end;
        v131.total = v134;
        v131.complete = v135;
        return v131;
    end;
end;
v39.getDerivedStateFromProps = function(v146, v147) --[[ Line: 396 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v127 (copy), v145 (copy), v115 (copy), v7 (copy), v98 (copy)
    local v148 = {};
    local v149 = nil;
    local v150 = nil;
    local v151 = nil;
    if v146.sortSelection ~= v147.sortSelection then
        v148 = {
            [2] = true, 
            [3] = true, 
            [1] = true
        };
    end;
    if v146.animations ~= v147.animations then
        v148[2] = true;
        v150 = v127(v146, v147);
    end;
    if v146.scripts ~= v147.scripts then
        v148[3] = true;
        v151 = v145(v146, v147);
    end;
    if v146.characters ~= v147.characters or v146.charactersConverted ~= v147.charactersConverted then
        v148[1] = true;
        v149 = v115(v146, v147);
    end;
    local v152 = v7.join(v147.sections, {
        [1] = v149, 
        [2] = v150, 
        [3] = v151
    });
    if next(v148) then
        v98(v152, v148, v146.sortSelection);
    end;
    return {
        sortSelection = v146.sortSelection, 
        characters = v146.characters, 
        charactersConverted = v146.charactersConverted, 
        animations = v146.animations, 
        scripts = v146.scripts, 
        sections = v152
    };
end;
local function _(v153) --[[ Line: 440 ]] --[[ Name: getAdpatedText ]]
    if v153 then
        return "R6 & R15";
    else
        return "R15";
    end;
end;
local function _(v155) --[[ Line: 444 ]] --[[ Name: getAdpatedKey ]]
    if v155 then
        return "R6_R15";
    else
        return "R15";
    end;
end;
v39.renderHeader = function(v157, v158, v159) --[[ Line: 448 ]] --[[ Name: renderHeader ]]
    -- upvalues: v4 (copy), l_Pane_0 (copy), l_Image_0 (copy), l_StyleModifier_0 (copy), l_TextLabel_0 (copy)
    local l_props_2 = v157.props;
    local l_state_1 = v157.state;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local v163 = v157.onExpandedChanged(v158);
    local v164 = l_state_1.expanded[v158];
    local l_Localization_1 = l_props_2.Localization;
    local v166 = l_Localization_1:getText("Summary", v158);
    local v167 = nil;
    local v168 = nil;
    if v158 == "Convert" and v159 then
        v167 = l_Localization_1:getText("Summary", "Complete");
        v168 = l_Stylizer_0.ExpandedHeaderStatusCompleteColor;
    end;
    if v158 == "Test" then
        v167 = l_Localization_1:getText("Summary", "TestAdaptedModeText", {
            adaptedText = l_props_2.adapted and "R6 & R15" or "R15"
        });
        v168 = l_Stylizer_0.ExpandedHeaderStatusAdpatedColor;
    end;
    if v158 == "Publish" then
        v167 = v159 and l_Localization_1:getText("Summary", "ReadyToPublish") or "Not Ready";
        v168 = v159 and l_Stylizer_0.ExpandedHeaderStatusReadyPublishColor or l_Stylizer_0.ExpandedHeaderStatusNotReadyPublishColor;
    end;
    return v4.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, 28), 
        OnClick = v163, 
        BackgroundColor = l_Stylizer_0.HeaderColor, 
        BorderColor3 = l_Stylizer_0.DividerColor, 
        BorderSizePixel = 1, 
        LayoutOrder = 1, 
        Padding = {
            Left = 8, 
            Right = 8
        }
    }, {
        Arrow = v4.createElement(l_Image_0, {
            Style = l_Stylizer_0.Arrow, 
            StyleModifier = v164 and l_StyleModifier_0.Selected or nil, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5)
        }), 
        Text = v4.createElement(l_TextLabel_0, {
            Text = v166, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 24, 0.5, 0)
        }), 
        CompleteStatus = if v167 then v4.createElement(l_TextLabel_0, {
            Text = v167, 
            TextColor = v168, 
            Size = l_Stylizer_0.ExpandedHeaderStatusSize, 
            Position = l_Stylizer_0.ExpandedHeaderStatusPosition, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            Font = Enum.Font.SourceSansSemibold, 
            TextSize = l_Stylizer_0.ExpandedHeaderStatusFontSize, 
            BackgroundTransparency = 1
        }) else nil
    });
end;
v39.getRadioButtons = function(v169) --[[ Line: 517 ]] --[[ Name: getRadioButtons ]]
    -- upvalues: v4 (copy), l_RadioButtonList_0 (copy), l_R15MigShowLinkedText_0 (copy), l_GuiService_0 (copy), l_HttpRbxApiService_0 (copy)
    local l_props_3 = v169.props;
    local l_Analytics_0 = l_props_3.Analytics;
    local l_Localization_2 = l_props_3.Localization;
    return v4.createElement(l_RadioButtonList_0, {
        Size = UDim2.new(1, 0, 0, 0), 
        SelectedKey = l_props_3.adapted and "R6_R15" or "R15", 
        CurrentSelectedKey = l_props_3.adapted and "R6_R15" or "R15", 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true, 
        OnClick = function(v173) --[[ Line: 528 ]] --[[ Name: OnClick ]]
            -- upvalues: l_props_3 (copy), l_Analytics_0 (copy)
            if v173 == "R6_R15" then
                l_props_3.addAdapters(l_Analytics_0);
                return;
            else
                if v173 == "R15" then
                    l_props_3.removeAdapters(l_Analytics_0);
                end;
                return;
            end;
        end, 
        Buttons = {
            {
                Key = "R6_R15", 
                Text = "R6 & R15", 
                Description = l_Localization_2:getText("Summary", "R6R15ModeDesc"), 
                LinkProps = if l_R15MigShowLinkedText_0 then {
                    Text = l_Localization_2:getText("AdapterPane", "LearnMore"), 
                    OnClick = function() --[[ Line: 543 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_GuiService_0 (ref), l_HttpRbxApiService_0 (ref)
                        l_GuiService_0:OpenBrowserWindow(l_HttpRbxApiService_0:GetDocumentationUrl(""));
                    end
                } else nil
            }, 
            {
                Key = "R15", 
                Text = "R15", 
                Description = l_Localization_2:getText("Summary", "R15ModeDesc")
            }
        }
    });
end;
v39.getSorter = function(v174) --[[ Line: 558 ]] --[[ Name: getSorter ]]
    -- upvalues: v4 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_SelectInput_0 (copy), v25 (copy)
    local l_props_4 = v174.props;
    local l_Stylizer_1 = l_props_4.Stylizer;
    local l_Localization_3 = l_props_4.Localization;
    return v4.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, l_Stylizer_1.SortBy.Height), 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = l_Stylizer_1.SortBy.Spacing
    }, {
        FilterLabel = v4.createElement(l_TextLabel_0, {
            Text = l_Localization_3:getText("Summary", "Sortby"), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1
        }), 
        Filter = v4.createElement(l_SelectInput_0, {
            PlaceholderText = l_Localization_3:getText("Summary", "Sortby"), 
            SelectedIndex = l_props_4.sortSelection, 
            Items = v25.getOrderedSortData(l_Localization_3), 
            Size = UDim2.fromOffset(l_Stylizer_1.SortBy.Width, l_Stylizer_1.SortBy.Height), 
            LayoutOrder = 2, 
            OnItemActivated = function(_, v179) --[[ Line: 583 ]] --[[ Name: OnItemActivated ]]
                -- upvalues: v174 (copy)
                v174.setSortSelection(v179);
            end
        })
    });
end;
v39.getSortAndRefreshRow = function(v180) --[[ Line: 590 ]] --[[ Name: getSortAndRefreshRow ]]
    -- upvalues: v4 (copy), l_Pane_0 (copy), l_IconButton_0 (copy)
    local l_props_5 = v180.props;
    local l_Stylizer_2 = l_props_5.Stylizer;
    local l_Localization_4 = l_props_5.Localization;
    return v4.createElement(l_Pane_0, {
        LayoutOrder = -1, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_2.SortBy.Height)
    }, {
        sorter = v180:getSorter(); 
        v4.createElement(l_IconButton_0, {
            LeftIcon = l_Stylizer_2.RefreshButton.Icon, 
            Cursor = "PointingHand", 
            OnClick = l_props_5.OnResetPlugin, 
            Size = l_Stylizer_2.RefreshButton.Size, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            BackgroundStyle = l_Stylizer_2.RefreshButton.BackgroundStyle, 
            TooltipText = l_Localization_4:getText("Summary", "Refresh")
        })
    });
end;
v39.getConversionItems = function(v184) --[[ Line: 614 ]] --[[ Name: getConversionItems ]]
    -- upvalues: v4 (copy), v26 (copy)
    local l_props_6 = v184.props;
    local _ = v184.state;
    local l_Localization_5 = l_props_6.Localization;
    local v188 = {
        sortAndRefresh = v184:getSortAndRefreshRow()
    };
    for v189, v190 in v184.state.sections do
        v188[v189] = v4.createElement(v26, {
            LayoutOrder = v189, 
            Rows = v190.expanded and v190.values or {}, 
            Title = l_Localization_5:getText("Summary", "ConvertHeader", {
                currentAmount = tostring(v190.complete), 
                total = tostring(v190.total)
            }), 
            HeaderCellComponent = v190.headerCellComponent, 
            OnClick = function() --[[ Line: 631 ]] --[[ Name: OnClick ]]
                -- upvalues: v184 (copy), v190 (copy)
                v184.setSelectedTab(v190.tabTarget);
            end
        });
    end;
    return v188;
end;
v39.render = function(v191) --[[ Line: 640 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v8 (copy), v4 (copy), l_ScrollingFrame_0 (copy), l_ExpandablePane_0 (copy), l_TextLabel_0 (copy), v26 (copy), l_Pane_0 (copy), l_IconButton_0 (copy)
    local l_props_7 = v191.props;
    local l_Stylizer_3 = l_props_7.Stylizer;
    local l_Localization_6 = l_props_7.Localization;
    local l_expanded_1 = v191.state.expanded;
    local l_isSuccessfullyPublished_0 = l_props_7.isSuccessfullyPublished;
    local l_experienceData_0 = l_props_7.experienceData;
    local v198 = l_LayoutOrderIterator_0.new();
    local function v201(v199, v200) --[[ Line: 652 ]] --[[ Name: getExpandablePaneProps ]]
        -- upvalues: v198 (copy), l_expanded_1 (copy), v191 (copy), l_Stylizer_3 (copy)
        return {
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v198:getNextOrder(), 
            Expanded = l_expanded_1[v199], 
            OnExpandedChanged = v191.onExpandedChanged(v199), 
            ContentPadding = l_Stylizer_3.ExpandedPanePadding, 
            HeaderOverride = v191:renderHeader(v199, v200)
        };
    end;
    local v202 = true;
    for _, v204 in pairs(v191.state.sections) do
        if v204.complete ~= v204.total then
            v202 = false;
            break;
        end;
    end;
    local v205 = not l_props_7.adapted;
    local v206 = l_props_7.avatarType ~= Enum.GameAvatarType.R6;
    local v207 = v202 and v205 and v206;
    local v208 = l_Localization_6:getText("Summary", "PublishButtonText");
    local v209 = v8.getTextSize(v208, l_Stylizer_3.ButtonTextSize, l_Stylizer_3.ButtonFont, l_Stylizer_3.ButtonPadding);
    return v4.createElement(l_ScrollingFrame_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Spacing = l_Stylizer_3.ExpandedPaneSpacing, 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical
    }, {
        Convert = v4.createElement(l_ExpandablePane_0, v201("Convert", v202), v191:getConversionItems()), 
        Test = if l_isSuccessfullyPublished_0 then nil else v4.createElement(l_ExpandablePane_0, v201("Test"), {
            Content = v191:getRadioButtons()
        }), 
        Publish = if l_isSuccessfullyPublished_0 then v4.createElement(l_ExpandablePane_0, v201("Publish", true), {
            Content = if l_experienceData_0 and l_experienceData_0.publishedDateTime then v4.createElement(l_TextLabel_0, {
                Text = l_Localization_6:getText("Summary", "PublishMessage", {
                    experienceName = l_experienceData_0.name, 
                    month = l_experienceData_0.publishedDateTime.month, 
                    day = l_experienceData_0.publishedDateTime.day, 
                    year = l_experienceData_0.publishedDateTime.year, 
                    hour = l_experienceData_0.publishedDateTime.hour, 
                    minute = l_experienceData_0.publishedDateTime.minute, 
                    amPm = l_Localization_6:getText("Summary", l_experienceData_0.publishedDateTime.isPm and "PM" or "AM")
                }), 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                RichText = true
            }) else nil
        }) else v4.createElement(l_ExpandablePane_0, v201("Publish", v207), {
            Content = v4.createElement(v26, {
                LayoutOrder = v198:getNextOrder(), 
                Title = l_Localization_6:getText("Summary", "Checklist"), 
                Rows = {
                    {
                        text = l_Localization_6:getText("Summary", "AllAssetsConverted"), 
                        complete = v202
                    }, 
                    {
                        text = l_Localization_6:getText("Summary", "R15ModeOn"), 
                        complete = v205
                    }, 
                    {
                        text = l_Localization_6:getText("Summary", "GameSettingsAvatarType"), 
                        complete = v206
                    }
                }
            }), 
            PublishButtonPane = v4.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Size = UDim2.new(1, 0, 0, v209.Height.Offset), 
                LayoutOrder = v198:getNextOrder()
            }, {
                PublishButton = v4.createElement(l_IconButton_0, {
                    Disabled = not v207, 
                    LayoutOrder = v198:getNextOrder(), 
                    Size = v209, 
                    Text = v208, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    OnClick = function() --[[ Line: 751 ]] --[[ Name: OnClick ]]
                        game.StudioPublishService:ShowSaveOrPublishPlaceToRoblox(false, true, Enum.StudioCloseMode.None);
                    end, 
                    Style = "PrimaryBrand"
                })
            })
        })
    });
end;
local function v211(v210) --[[ Line: 765 ]] --[[ Name: mapStateToProps ]]
    return {
        animations = v210.AnimationConversion.animations, 
        characters = v210.CharacterConversion.characters, 
        charactersConverted = v210.CharacterConversion.convertedCharacters, 
        characterMetadataLoadedVersion = v210.CharacterConversion.characterMetadataLoadedVersion, 
        scripts = v210.ScriptConversion.diagnostics, 
        adapted = v210.Adapter.adapted, 
        avatarType = v210.AvatarType, 
        selectedTab = v210.PanelSelection.selectedTab, 
        sortSelection = v210.DataDisplay.sortSelection, 
        isSuccessfullyPublished = v210.ConversionProgress.isSuccessfullyPublished, 
        experienceData = v210.ConversionProgress.experienceData
    };
end;
local function v218(v212) --[[ Line: 781 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v28 (copy), v29 (copy), v30 (copy), v32 (copy), v33 (copy)
    return {
        loadCharacterMetadata = function(v213) --[[ Line: 783 ]] --[[ Name: loadCharacterMetadata ]]
            -- upvalues: v212 (copy), v28 (ref)
            v212(v28(v213));
        end, 
        addAdapters = function(v214) --[[ Line: 786 ]] --[[ Name: addAdapters ]]
            -- upvalues: v212 (copy), v29 (ref)
            v212(v29(v214));
        end, 
        removeAdapters = function(v215) --[[ Line: 789 ]] --[[ Name: removeAdapters ]]
            -- upvalues: v212 (copy), v30 (ref)
            v212(v30(v215));
        end, 
        setSelectedTab = function(v216) --[[ Line: 792 ]] --[[ Name: setSelectedTab ]]
            -- upvalues: v212 (copy), v32 (ref)
            v212(v32(v216));
        end, 
        setSortSelection = function(v217) --[[ Line: 795 ]] --[[ Name: setSortSelection ]]
            -- upvalues: v212 (copy), v33 (ref)
            v212(v33(v217));
        end
    };
end;
v39 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    ScriptConversionContext = v9, 
    Analytics = l_ContextServices_0.Analytics
})(v39);
return v6.connect(v211, v218)(v39);