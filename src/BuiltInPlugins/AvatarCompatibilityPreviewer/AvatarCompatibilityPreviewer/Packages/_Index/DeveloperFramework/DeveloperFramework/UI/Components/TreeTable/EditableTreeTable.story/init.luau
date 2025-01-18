local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v2.join;
local l_map_0 = v2.map;
local l_slice_0 = v2.slice;
local v6 = require(l_Parent_0.UI.Components.Breadcrumb);
local v7 = require(l_Parent_0.UI.Components.TreeTable);
local v8 = require(l_Parent_0.SharedFlags.getFFlagSelectRendererOnRenderItem)();
local v9 = {
    {
        Name = "Name", 
        Key = "Name"
    }, 
    {
        Name = "Value", 
        Key = "Value"
    }
};
local v11 = v7.EditTree.new({
    getChildren = function(v10) --[[ Line: 26 ]] --[[ Name: getChildren ]]
        return v10.Children or {};
    end
});
local v12 = {
    Type = "Color"
};
local v13 = {
    Type = "Empty"
};
local v14 = {
    Type = "Select", 
    Items = {
        {
            Id = "Gotham", 
            Label = "Gotham"
        }, 
        {
            Id = "SourceSans", 
            Label = "SourceSans"
        }, 
        {
            Id = "SourceSansBold", 
            Label = "SourceSansBold"
        }
    }
};
local v19 = {
    Type = "Vector", 
    Components = {
        "X", 
        "Y"
    }, 
    GetComponents = function(v15) --[[ Line: 57 ]] --[[ Name: GetComponents ]]
        return {
            v15.X, 
            v15.Y
        };
    end, 
    GetValue = function(v16) --[[ Line: 61 ]] --[[ Name: GetValue ]]
        local v17 = tonumber(v16[1]);
        local v18 = tonumber(v16[2]);
        return Vector2.new(v17, v18);
    end
};
local v20 = {
    Type = "Text", 
    ErrorStyle = "PropertyCellError", 
    PlaceholderText = "Add Property..."
};
local v21 = {
    {
        Id = "Variable", 
        Icon = {
            Image = "rbxasset://textures/StyleEditor/style-variable.png", 
            Size = UDim2.fromOffset(16, 16)
        }, 
        Tooltip = "Assign this property from a variable"
    }
};
local v22 = {
    Type = "Breadcrumb", 
    Delimiters = {
        "%.%.", 
        "%.", 
        "::"
    }, 
    ErrorStyle = "PropertyCellError", 
    GetImageProps = v6.GetSelectorIcon
};
local v23 = {
    {
        Id = "Edit", 
        Icon = {
            Image = "rbxasset://textures/StyleEditor/style-edit.png", 
            Size = UDim2.fromOffset(16, 16)
        }, 
        Tooltip = "Edit the style selector"
    }, 
    {
        Id = "Add", 
        Icon = {
            Image = "rbxasset://textures/StyleEditor/style-add.png", 
            Size = UDim2.fromOffset(16, 16)
        }, 
        Tooltip = "Add a child style"
    }, 
    {
        Id = "Delete", 
        Icon = {
            Image = "rbxasset://textures/StyleEditor/style-bin.png", 
            Size = UDim2.fromOffset(16, 16)
        }, 
        Tooltip = "Delete the style"
    }
};
local v24 = {
    Type = "Text"
};
local v25 = {
    Type = "Slider", 
    Min = 0, 
    Max = 1, 
    ShowInput = true, 
    InputPrecision = 3, 
    SnapIncrement = 0.05
};
local v26 = {
    Type = "Select", 
    Items = {
        {
            Id = "Row", 
            Label = "Row"
        }, 
        {
            Id = "Column", 
            Label = "Column"
        }
    }
};
local function v27() --[[ Line: 139 ]] --[[ Name: getEmptyRow ]]
    -- upvalues: v20 (copy), v13 (copy)
    return {
        Name = {
            Schema = v20, 
            Value = ""
        }, 
        Value = {
            Schema = v13, 
            Value = ""
        }
    };
end;
local function v28() --[[ Line: 152 ]] --[[ Name: getNewStyle ]]
    -- upvalues: v23 (copy), l_join_0 (copy), v22 (copy), v27 (copy)
    return {
        Name = {
            Actions = v23, 
            FullSpan = true, 
            Schema = l_join_0(v22, {
                Editing = true
            }), 
            Value = ""
        }, 
        Children = {
            (v27())
        }
    };
end;
local function v29() --[[ Line: 166 ]] --[[ Name: getItems ]]
    -- upvalues: v23 (copy), v22 (copy), v21 (copy), v20 (copy), v12 (copy), v14 (copy), v19 (copy), v25 (copy), v27 (copy), v24 (copy), v8 (copy), v26 (copy)
    return {
        {
            Name = {
                Actions = v23, 
                FullSpan = true, 
                Schema = v22, 
                Value = "TextLabel"
            }, 
            Children = {
                {
                    Name = {
                        Actions = v21, 
                        Schema = v20, 
                        Value = "BackgroundColor3"
                    }, 
                    Value = {
                        Schema = v12, 
                        Value = Color3.fromRGB(200, 30, 120)
                    }
                }, 
                {
                    Name = {
                        Actions = v21, 
                        Schema = v20, 
                        Value = "Font"
                    }, 
                    Value = {
                        Schema = v14, 
                        Value = "Gotham"
                    }
                }, 
                {
                    Name = {
                        Actions = v21, 
                        Schema = v20, 
                        Value = "AnchorPoint"
                    }, 
                    Value = {
                        Schema = v19, 
                        Value = Vector2.new(0, 0)
                    }
                }, 
                {
                    Name = {
                        Actions = v21, 
                        Schema = v20, 
                        Value = "TextTransparency"
                    }, 
                    Value = {
                        Schema = v25, 
                        Value = 0.5
                    }
                }, 
                (v27())
            }
        }, 
        {
            Name = {
                Actions = v23, 
                FullSpan = true, 
                Schema = v22, 
                Value = "Error", 
                ErrorMessage = "This is an error"
            }, 
            Children = {
                v27(), 
                {
                    Name = {
                        Actions = v23, 
                        FullSpan = true, 
                        Schema = v22, 
                        Value = "Error", 
                        ErrorMessage = "This is an error"
                    }, 
                    Children = {
                        {
                            Name = {
                                Value = "ImageTransparency", 
                                Actions = v21, 
                                Schema = v20
                            }, 
                            Value = {
                                Value = 0.5, 
                                Schema = v25
                            }
                        }, 
                        (v27())
                    }
                }, 
                {
                    Name = {
                        Actions = v23, 
                        FullSpan = true, 
                        Schema = v22, 
                        Value = ":Hover.ImageLabel"
                    }, 
                    Children = {
                        {
                            Name = {
                                Actions = v21, 
                                Schema = v20, 
                                Value = "ImageTransparency"
                            }, 
                            Value = {
                                Schema = v25, 
                                Value = 0.8
                            }
                        }, 
                        (v27())
                    }
                }
            }
        }, 
        {
            Name = {
                Actions = v23, 
                FullSpan = true, 
                Schema = v22, 
                Value = "Frame $Dialog"
            }, 
            Children = {
                {
                    Name = {
                        Actions = v23, 
                        FullSpan = true, 
                        Schema = v22, 
                        Value = "Frame $Alert"
                    }, 
                    Children = {
                        {
                            Name = {
                                Value = "Image", 
                                Actions = v21, 
                                Schema = v20
                            }, 
                            Value = {
                                Value = "rbxassetid://textures/alert", 
                                Schema = v24
                            }
                        }, 
                        (v27())
                    }
                }, 
                {
                    Name = {
                        Actions = v23, 
                        FullSpan = true, 
                        Schema = v22, 
                        Value = ".. Frame $ButtonRow ::UIListLayout"
                    }, 
                    Children = {
                        {
                            Name = {
                                Value = "FillDirection", 
                                Actions = v21, 
                                Schema = v20
                            }, 
                            Value = {
                                Value = v8 and "" or "Row", 
                                Schema = v26
                            }
                        }, 
                        (v27())
                    }
                }
            }
        }
    };
end;
local v30 = v1.PureComponent:extend("Story");
v30.init = function(v31) --[[ Line: 341 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v11 (copy), v29 (copy), l_join_0 (copy), v22 (copy), v28 (copy), v21 (copy), v20 (copy), v25 (copy), l_slice_0 (copy), v27 (copy)
    v31.state = {
        Columns = v9, 
        Sizes = {
            UDim.new(0.4, 0), 
            UDim.new(0.6, 0)
        }, 
        Expansion = {}, 
        Hidden = {}, 
        Selection = {}, 
        Items = v11:updatePaths((v29()))
    };
    v31.GetCellAutocomplete = function(v32) --[[ Line: 354 ]]
        local v33 = {
            {
                Id = "Text", 
                Label = "Text", 
                Value = "Text"
            }, 
            {
                Id = "Color", 
                Label = "Color", 
                Value = "Color"
            }, 
            {
                Id = "Frame", 
                Label = "Frame", 
                Value = "Frame"
            }, 
            {
                Id = "Image", 
                Label = "Image", 
                Value = "Image"
            }
        };
        local v34 = {};
        for _, v36 in ipairs(v33) do
            if string.sub(string.lower(v36.Id), 1, (string.len(v32))) == string.lower(v32) then
                table.insert(v34, v36);
            end;
        end;
        return v34;
    end;
    v31.onSizesChange = function(v37) --[[ Line: 387 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            Sizes = v37
        });
    end;
    v31.onAction = function(v38, v39, v40) --[[ Line: 392 ]]
        -- upvalues: l_join_0 (ref), v22 (ref), v31 (copy), v11 (ref), v28 (ref)
        if v38 == "Edit" then
            local v41 = {
                Schema = l_join_0(v22, {
                    Editing = true
                })
            };
            v31:setState(function(v42) --[[ Line: 395 ]]
                -- upvalues: v11 (ref), v41 (copy), v39 (copy), v40 (copy)
                return v11:updateCell(v42, v41, v39, v40);
            end);
            return;
        elseif v38 == "Delete" then
            v31:setState(function(v43) --[[ Line: 399 ]]
                -- upvalues: v11 (ref), v39 (copy)
                return v11:removeItem(v43, v39);
            end);
            return;
        elseif v38 == "Add" then
            v31:setState(function(v44) --[[ Line: 403 ]]
                -- upvalues: v28 (ref), v11 (ref), v39 (copy), l_join_0 (ref)
                local v45 = v28();
                local v46 = v11:getChild(v44.Items, v39);
                local v47 = v11:insertRow(v44, v39, v45, #v46.Children + 1);
                local v48 = l_join_0(v47, v11:togglePath(v47, v39, true));
                v48.Expansion[v45] = true;
                return v48;
            end);
            return;
        else
            if v38 == "Variable" then
                print("Switch to Variable schema!");
            end;
            return;
        end;
    end;
    v31.onEdited = function(v49, v50, v51) --[[ Line: 415 ]]
        -- upvalues: v11 (ref), v31 (copy), l_join_0 (ref), v22 (ref), v21 (ref), v20 (ref), v25 (ref), l_slice_0 (ref), v27 (ref)
        local v52 = v11:getChild(v31.state.Items, v50);
        if not v52 then
            return;
        elseif v51 == 1 and v49 == "" and v52.Name.Value ~= "" then
            v31:setState(function(v53) --[[ Line: 421 ]]
                -- upvalues: v11 (ref), v50 (copy)
                return v11:removeItem(v53, v50);
            end);
            return;
        else
            local v54 = {
                Value = v49
            };
            if v49 == "Error" then
                v54.ErrorMessage = "Error tooltip";
            else
                v54.ErrorMessage = "";
            end;
            if v51 == 1 then
                if v52.Name.FullSpan then
                    v54.Schema = l_join_0(v22, {
                        Editing = false
                    });
                elseif v52.Name.Value == "" and v49 ~= "" then
                    v54.Actions = v21;
                    v54.Schema = v20;
                    v31:setState(function(v55) --[[ Line: 441 ]]
                        -- upvalues: v11 (ref), v25 (ref), v50 (copy), l_slice_0 (ref), v27 (ref)
                        local v56 = v11:updateCell(v55, {
                            Value = 0, 
                            Schema = v25
                        }, v50, 2);
                        local v57 = l_slice_0(v50, 1, -1);
                        local v58 = v11:getChild(v56.Items, v57);
                        local v59 = #v58.Children + 1;
                        for v60 = 1, #v58.Children do
                            if v58.Children[v60].Name.FullSpan then
                                v59 = v60;
                                break;
                            end;
                        end;
                        return v11:insertRow(v56, v57, v27(), v59);
                    end);
                end;
            end;
            v31:setState(function(v61) --[[ Line: 460 ]]
                -- upvalues: v11 (ref), v54 (copy), v50 (copy), v51 (copy)
                return v11:updateCell(v61, v54, v50, v51);
            end);
            return;
        end;
    end;
    v31.onPressed = function(v62) --[[ Line: 464 ]]
        -- upvalues: v31 (copy), v11 (ref)
        v31:setState(function(v63) --[[ Line: 465 ]]
            -- upvalues: v11 (ref), v62 (copy)
            return v11:togglePath(v63, v62);
        end);
    end;
end;
v30.render = function(v64) --[[ Line: 471 ]] --[[ Name: render ]]
    -- upvalues: l_map_0 (copy), l_join_0 (copy), v1 (copy), v7 (copy)
    local l_state_0 = v64.state;
    local v68 = l_map_0(l_state_0.Columns, function(v66, v67) --[[ Line: 473 ]]
        -- upvalues: l_join_0 (ref), l_state_0 (copy)
        return l_join_0(v66, {
            Width = l_state_0.Sizes[v67]
        });
    end);
    local l_onSizesChange_0 = v64.onSizesChange;
    return v1.createElement(v7, {
        Size = UDim2.new(1, 0, 0, 400), 
        FullSpanEmphasis = true, 
        Columns = v68, 
        ClampSize = true, 
        GetCellAutocomplete = v64.GetCellAutocomplete, 
        OnExpansionChange = function(v70) --[[ Line: 487 ]] --[[ Name: OnExpansionChange ]]
            -- upvalues: v64 (copy), l_join_0 (ref)
            v64:setState(function(v71) --[[ Line: 488 ]]
                -- upvalues: l_join_0 (ref), v70 (copy)
                return {
                    Expansion = l_join_0(v71.Expansion, v70)
                };
            end);
        end, 
        OnSelectionChange = function(v72) --[[ Line: 494 ]] --[[ Name: OnSelectionChange ]]
            -- upvalues: v64 (copy), l_join_0 (ref)
            v64:setState(function(v73) --[[ Line: 495 ]]
                -- upvalues: l_join_0 (ref), v72 (copy)
                return {
                    Selection = l_join_0(v73.Selection, v72)
                };
            end);
        end, 
        OnColumnSizesChange = l_onSizesChange_0, 
        OnCellAction = v64.onAction, 
        OnCellEdited = v64.onEdited, 
        OnCellPressed = v64.onPressed, 
        Expansion = l_state_0.Expansion, 
        RootItems = l_state_0.Items, 
        RowHeight = 32, 
        GetChildren = function(v74) --[[ Line: 508 ]] --[[ Name: GetChildren ]]
            return v74.Children or {};
        end, 
        Scroll = true, 
        UseScale = true
    });
end;
return v30;