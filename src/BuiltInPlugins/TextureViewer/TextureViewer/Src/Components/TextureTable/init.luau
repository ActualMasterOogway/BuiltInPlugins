local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v2.UI.Pane;
local l_IconButton_0 = v2.UI.IconButton;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_TextInput_0 = v2.UI.TextInput;
local l_Image_0 = v2.UI.Image;
local l_Table_0 = v2.UI.Table;
local l_Util_0 = l_Parent_0.Src.Util;
local v10 = require(l_Util_0.Utils);
local v11 = require(l_Util_0.WorkspaceOperations);
local v12 = require(l_Util_0.Constants);
local function v15(v13) --[[ Line: 20 ]] --[[ Name: makeColumns ]]
    local l_Localization_0 = v13.props.Localization;
    return {
        {
            Name = l_Localization_0:getText("TextureTable", "Texture")
        }, 
        {
            Name = l_Localization_0:getText("TextureTable", "Id")
        }, 
        {
            Name = l_Localization_0:getText("TextureTable", "Size")
        }, 
        {
            Name = l_Localization_0:getText("TextureTable", "FindSelect")
        }
    };
end;
local function _(v16, v17) --[[ Line: 30 ]] --[[ Name: makeCell ]]
    -- upvalues: v10 (copy), v1 (copy), l_Image_0 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), l_IconButton_0 (copy), v11 (copy), l_TextLabel_0 (copy), v12 (copy)
    local l_Localization_1 = v16.props.Localization;
    return function(v19) --[[ Line: 33 ]]
        -- upvalues: v17 (copy), v16 (copy), v10 (ref), v1 (ref), l_Image_0 (ref), l_Pane_0 (ref), l_TextInput_0 (ref), l_IconButton_0 (ref), v11 (ref), l_TextLabel_0 (ref), v12 (ref), l_Localization_1 (copy)
        local l_Row_0 = v19.Row;
        local l_ColumnIndex_0 = v19.ColumnIndex;
        local l_RowIndex_0 = v19.RowIndex;
        local v23 = v19.Width or UDim.new(1 / #v19.Columns, 0);
        local l_TableCell_0 = v17.TableCell;
        local v25 = nil;
        local l_Texture_0 = l_Row_0.Texture;
        local function v28(v27) --[[ Line: 43 ]] --[[ Name: handleTextInputChange ]]
            -- upvalues: l_Texture_0 (ref)
            l_Texture_0 = v27;
        end;
        local function v29() --[[ Line: 46 ]] --[[ Name: endInput ]]
            -- upvalues: v16 (ref)
            v16:setState({
                editingCell = -1
            });
        end;
        if l_Row_0 then
            if l_ColumnIndex_0 == 1 then
                local v30 = v10.doesTextureAliasContainId(l_Row_0.Texture) and string.format("rbxthumb://type=Asset&id=%s&w=150&h=150&filters=", l_Row_0.Id) or l_Row_0.Texture;
                v25 = v1.createElement(l_Image_0, {
                    Image = v30, 
                    Size = UDim2.fromScale(1, 1)
                });
            elseif l_ColumnIndex_0 == 2 then
                v25 = if v16.state.editingCell == l_RowIndex_0 then v1.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Vertical, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    TextInput = v1.createElement(l_TextInput_0, {
                        Text = l_Texture_0, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        Size = l_TableCell_0.IdCell.TextInput.Size, 
                        OnTextChanged = v28, 
                        LayoutOrder = 1
                    }), 
                    ButtonsWrapper = v1.createElement(l_Pane_0, {
                        Size = l_TableCell_0.IdCell.Buttons.ButtonsWrapper.Size, 
                        Layout = Enum.FillDirection.Horizontal, 
                        Padding = l_TableCell_0.IdCell.Buttons.Padding, 
                        LayoutOrder = 2
                    }, {
                        CancelButton = v1.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Padding = l_TableCell_0.IdCell.Buttons.Padding, 
                            LayoutOrder = 1
                        }, {
                            v1.createElement(l_IconButton_0, {
                                LeftIcon = l_TableCell_0.IdCell.Buttons.CancelIcon, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                Size = UDim2.fromScale(1, 1), 
                                OnClick = v29
                            })
                        }), 
                        ConfirmButton = v1.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Padding = l_TableCell_0.IdCell.Buttons.Padding, 
                            LayoutOrder = 2
                        }, {
                            v1.createElement(l_IconButton_0, {
                                LeftIcon = l_TableCell_0.IdCell.Buttons.ConfirmIcon, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                Size = UDim2.fromScale(1, 1), 
                                OnClick = function() --[[ Line: 101 ]] --[[ Name: OnClick ]]
                                    -- upvalues: l_Row_0 (copy), l_Texture_0 (ref), v11 (ref), v16 (ref)
                                    if l_Row_0.Texture ~= l_Texture_0 then
                                        v11.replaceAllTexturesWithId(l_Row_0.Id, l_Texture_0);
                                    end;
                                    v16:setState({
                                        editingCell = -1
                                    });
                                    v16:refreshData();
                                end
                            })
                        })
                    })
                }) else v1.createElement(l_TextLabel_0, {
                    Text = l_Row_0.Id
                });
            elseif l_ColumnIndex_0 == 3 then
                local v31 = l_Row_0.Size > 0 and v10.round(l_Row_0.Size / v12.BYTES_IN_KB, 2) .. " KB" or l_Localization_1:getText("TextureTable", "NotLoaded");
                v25 = v1.createElement(l_TextLabel_0, {
                    Text = v31
                });
            elseif l_ColumnIndex_0 == 4 then
                local v32 = nil;
                v32 = if l_Row_0.ZoomedInstanceIndex ~= 0 then tostring((l_Row_0.ZoomedInstanceIndex - 1) % #l_Row_0.Instances + 1) .. "/" .. l_Row_0.Count else "-/" .. l_Row_0.Count;
                v25 = v1.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Horizontal, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    PrevButton = v1.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 1
                    }, {
                        v1.createElement(l_IconButton_0, {
                            LeftIcon = l_TableCell_0.FindSelectCell.PrevButton.Icon, 
                            Size = UDim2.fromScale(1, 1), 
                            OnClick = function() --[[ Line: 142 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_Row_0 (copy), v16 (ref)
                                l_Row_0.ZoomedInstanceIndex = l_Row_0.ZoomedInstanceIndex - 1;
                                if l_Row_0.ZoomedInstanceIndex < 1 then
                                    l_Row_0.ZoomedInstanceIndex = #l_Row_0.Instances;
                                end;
                                local v33 = (l_Row_0.ZoomedInstanceIndex - 1) % #l_Row_0.Instances + 1;
                                v16:zoomTo(l_Row_0.Instances, v33);
                            end
                        })
                    }), 
                    ZoomTextLabel = v1.createElement(l_Pane_0, {
                        Padding = l_TableCell_0.FindSelectCell.ZoomText.Padding, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 2
                    }, {
                        v1.createElement(l_TextLabel_0, {
                            Text = v32, 
                            TextSize = l_TableCell_0.FindSelectCell.ZoomText.TextSize
                        })
                    }), 
                    NextButton = v1.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 3
                    }, {
                        v1.createElement(l_IconButton_0, {
                            LeftIcon = l_TableCell_0.FindSelectCell.NextButton.Icon, 
                            Size = UDim2.fromScale(1, 1), 
                            OnClick = function() --[[ Line: 171 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_Row_0 (copy), v16 (ref)
                                l_Row_0.ZoomedInstanceIndex = l_Row_0.ZoomedInstanceIndex + 1;
                                if l_Row_0.ZoomedInstanceIndex < 1 then
                                    l_Row_0.ZoomedInstanceIndex = #l_Row_0.Instances;
                                end;
                                local v34 = (l_Row_0.ZoomedInstanceIndex - 1) % #l_Row_0.Instances + 1;
                                v16:zoomTo(l_Row_0.Instances, v34);
                            end
                        })
                    })
                });
            end;
        end;
        return v1.createElement(l_Pane_0, {
            LayoutOrder = v19.ColumnIndex, 
            Style = l_TableCell_0.Style, 
            BorderSizePixel = l_TableCell_0.BorderSizePixel, 
            BackgroundColor3 = v19.Style.BackgroundEven, 
            BorderColor3 = v19.Style.Border, 
            Size = UDim2.new(v23.Scale, v23.Offset, 1, 0), 
            OnRightClick = function() --[[ Line: 192 ]] --[[ Name: OnRightClick ]]
                -- upvalues: v16 (ref), l_RowIndex_0 (copy), l_Row_0 (copy)
                v16.showRightClickMenu(l_RowIndex_0, l_Row_0.Instances);
            end, 
            ClipsDescendants = true
        }, {
            Content = v25
        });
    end;
end;
return function(v36, v37) --[[ Line: 202 ]] --[[ Name: TextureTable ]]
    -- upvalues: v1 (copy), l_Table_0 (copy), v15 (copy), v10 (copy), l_Image_0 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), l_IconButton_0 (copy), v11 (copy), l_TextLabel_0 (copy), v12 (copy)
    local l_props_0 = v36.props;
    local _ = l_props_0.Localization;
    local l_TextureTable_0 = l_props_0.Stylizer.TextureTable;
    local l_createElement_0 = v1.createElement;
    local l_l_Table_0_0 = l_Table_0;
    local v43 = {
        Size = l_TextureTable_0.Size, 
        Rows = v37, 
        Columns = v15(v36)
    };
    local l_Localization_3 = v36.props.Localization;
    v43.CellComponent = function(v45) --[[ Line: 33 ]]
        -- upvalues: l_TextureTable_0 (copy), v36 (copy), v10 (ref), v1 (ref), l_Image_0 (ref), l_Pane_0 (ref), l_TextInput_0 (ref), l_IconButton_0 (ref), v11 (ref), l_TextLabel_0 (ref), v12 (ref), l_Localization_3 (copy)
        local l_Row_1 = v45.Row;
        local l_ColumnIndex_1 = v45.ColumnIndex;
        local l_RowIndex_1 = v45.RowIndex;
        local v49 = v45.Width or UDim.new(1 / #v45.Columns, 0);
        local l_TableCell_1 = l_TextureTable_0.TableCell;
        local v51 = nil;
        local l_Texture_1 = l_Row_1.Texture;
        local function v54(v53) --[[ Line: 43 ]] --[[ Name: handleTextInputChange ]]
            -- upvalues: l_Texture_1 (ref)
            l_Texture_1 = v53;
        end;
        local function v55() --[[ Line: 46 ]] --[[ Name: endInput ]]
            -- upvalues: v36 (ref)
            v36:setState({
                editingCell = -1
            });
        end;
        if l_Row_1 then
            if l_ColumnIndex_1 == 1 then
                local v56 = v10.doesTextureAliasContainId(l_Row_1.Texture) and string.format("rbxthumb://type=Asset&id=%s&w=150&h=150&filters=", l_Row_1.Id) or l_Row_1.Texture;
                v51 = v1.createElement(l_Image_0, {
                    Image = v56, 
                    Size = UDim2.fromScale(1, 1)
                });
            elseif l_ColumnIndex_1 == 2 then
                v51 = if v36.state.editingCell == l_RowIndex_1 then v1.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Vertical, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    TextInput = v1.createElement(l_TextInput_0, {
                        Text = l_Texture_1, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        Size = l_TableCell_1.IdCell.TextInput.Size, 
                        OnTextChanged = v54, 
                        LayoutOrder = 1
                    }), 
                    ButtonsWrapper = v1.createElement(l_Pane_0, {
                        Size = l_TableCell_1.IdCell.Buttons.ButtonsWrapper.Size, 
                        Layout = Enum.FillDirection.Horizontal, 
                        Padding = l_TableCell_1.IdCell.Buttons.Padding, 
                        LayoutOrder = 2
                    }, {
                        CancelButton = v1.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Padding = l_TableCell_1.IdCell.Buttons.Padding, 
                            LayoutOrder = 1
                        }, {
                            v1.createElement(l_IconButton_0, {
                                LeftIcon = l_TableCell_1.IdCell.Buttons.CancelIcon, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                Size = UDim2.fromScale(1, 1), 
                                OnClick = v55
                            })
                        }), 
                        ConfirmButton = v1.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Padding = l_TableCell_1.IdCell.Buttons.Padding, 
                            LayoutOrder = 2
                        }, {
                            v1.createElement(l_IconButton_0, {
                                LeftIcon = l_TableCell_1.IdCell.Buttons.ConfirmIcon, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                Size = UDim2.fromScale(1, 1), 
                                OnClick = function() --[[ Line: 101 ]] --[[ Name: OnClick ]]
                                    -- upvalues: l_Row_1 (copy), l_Texture_1 (ref), v11 (ref), v36 (ref)
                                    if l_Row_1.Texture ~= l_Texture_1 then
                                        v11.replaceAllTexturesWithId(l_Row_1.Id, l_Texture_1);
                                    end;
                                    v36:setState({
                                        editingCell = -1
                                    });
                                    v36:refreshData();
                                end
                            })
                        })
                    })
                }) else v1.createElement(l_TextLabel_0, {
                    Text = l_Row_1.Id
                });
            elseif l_ColumnIndex_1 == 3 then
                local v57 = l_Row_1.Size > 0 and v10.round(l_Row_1.Size / v12.BYTES_IN_KB, 2) .. " KB" or l_Localization_3:getText("TextureTable", "NotLoaded");
                v51 = v1.createElement(l_TextLabel_0, {
                    Text = v57
                });
            elseif l_ColumnIndex_1 == 4 then
                local v58 = nil;
                v58 = if l_Row_1.ZoomedInstanceIndex ~= 0 then tostring((l_Row_1.ZoomedInstanceIndex - 1) % #l_Row_1.Instances + 1) .. "/" .. l_Row_1.Count else "-/" .. l_Row_1.Count;
                v51 = v1.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Horizontal, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    PrevButton = v1.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 1
                    }, {
                        v1.createElement(l_IconButton_0, {
                            LeftIcon = l_TableCell_1.FindSelectCell.PrevButton.Icon, 
                            Size = UDim2.fromScale(1, 1), 
                            OnClick = function() --[[ Line: 142 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_Row_1 (copy), v36 (ref)
                                l_Row_1.ZoomedInstanceIndex = l_Row_1.ZoomedInstanceIndex - 1;
                                if l_Row_1.ZoomedInstanceIndex < 1 then
                                    l_Row_1.ZoomedInstanceIndex = #l_Row_1.Instances;
                                end;
                                local v59 = (l_Row_1.ZoomedInstanceIndex - 1) % #l_Row_1.Instances + 1;
                                v36:zoomTo(l_Row_1.Instances, v59);
                            end
                        })
                    }), 
                    ZoomTextLabel = v1.createElement(l_Pane_0, {
                        Padding = l_TableCell_1.FindSelectCell.ZoomText.Padding, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 2
                    }, {
                        v1.createElement(l_TextLabel_0, {
                            Text = v58, 
                            TextSize = l_TableCell_1.FindSelectCell.ZoomText.TextSize
                        })
                    }), 
                    NextButton = v1.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 3
                    }, {
                        v1.createElement(l_IconButton_0, {
                            LeftIcon = l_TableCell_1.FindSelectCell.NextButton.Icon, 
                            Size = UDim2.fromScale(1, 1), 
                            OnClick = function() --[[ Line: 171 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_Row_1 (copy), v36 (ref)
                                l_Row_1.ZoomedInstanceIndex = l_Row_1.ZoomedInstanceIndex + 1;
                                if l_Row_1.ZoomedInstanceIndex < 1 then
                                    l_Row_1.ZoomedInstanceIndex = #l_Row_1.Instances;
                                end;
                                local v60 = (l_Row_1.ZoomedInstanceIndex - 1) % #l_Row_1.Instances + 1;
                                v36:zoomTo(l_Row_1.Instances, v60);
                            end
                        })
                    })
                });
            end;
        end;
        return v1.createElement(l_Pane_0, {
            LayoutOrder = v45.ColumnIndex, 
            Style = l_TableCell_1.Style, 
            BorderSizePixel = l_TableCell_1.BorderSizePixel, 
            BackgroundColor3 = v45.Style.BackgroundEven, 
            BorderColor3 = v45.Style.Border, 
            Size = UDim2.new(v49.Scale, v49.Offset, 1, 0), 
            OnRightClick = function() --[[ Line: 192 ]] --[[ Name: OnRightClick ]]
                -- upvalues: v36 (ref), l_RowIndex_1 (copy), l_Row_1 (copy)
                v36.showRightClickMenu(l_RowIndex_1, l_Row_1.Instances);
            end, 
            ClipsDescendants = true
        }, {
            Content = v51
        });
    end;
    v43.Scroll = true;
    v43.RowHeight = l_TextureTable_0.RowHeight;
    v43.LayoutOrder = 3;
    return l_createElement_0(l_l_Table_0_0, v43);
end;