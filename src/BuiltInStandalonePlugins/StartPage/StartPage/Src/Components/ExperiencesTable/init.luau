local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useMemo_0 = v1.useMemo;
local v4 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v5 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageFixLastViewed)();
local v6 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageTeamCreateStatus)();
local v7 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v7.ContextServices.Localization;
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v11 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAtomicTestsFixes);
local v12 = game:DefineFastFlag("FixPSCMissingUniverseIdFromLuaStartPage", false);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_TreeTable_0 = v7.UI.TreeTable;
local v15 = require(l_script_FirstAncestor_0.Src.Components.Shimmer);
local v16 = require(l_script_FirstAncestor_0.Src.Util.formatISOTimestamp);
local v17 = {
    {
        Name = "", 
        Key = "Icon", 
        Width = UDim.new(0, 64), 
        ShouldSort = false
    }, 
    {
        Name = "Name", 
        Key = "Name", 
        Width = if v6 then UDim.new(0.25, -64) else UDim.new(0.35, -64), 
        ShouldSort = true, 
        SortParam = "GameName"
    }, 
    {
        Name = "Description", 
        Key = "Description", 
        Width = UDim.new(0.25, 0), 
        ShouldSort = false
    }, 
    {
        Name = "Last Edited", 
        Key = "Edited", 
        Width = UDim.new(0.15, 0), 
        ShouldSort = true, 
        SortParam = "LastUpdated"
    }, 
    {
        Name = "Date Created", 
        Key = "Created", 
        Width = UDim.new(0.15, 0), 
        ShouldSort = true, 
        SortParam = "GameCreated"
    }, 
    {
        Name = "Playability", 
        Key = "Playability", 
        Width = UDim.new(0.1, 0), 
        ShouldSort = false
    }, 
    if v6 then {
        Name = "Team Create", 
        Key = "TeamCreate", 
        Width = UDim.new(0.1, 0), 
        ShouldSort = false
    } else nil
};
local v18 = {
    GameName = 2, 
    LastUpdated = 4, 
    GameCreated = 5
};
local function v19() --[[ Line: 149 ]]
    -- upvalues: v1 (copy), v15 (copy)
    return v1.createElement(v15.Component, {
        CornerRadius = 8, 
        Size = UDim2.new(0.9, 0, 0, 24), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0, 0.5)
    });
end;
local function v20() --[[ Line: 158 ]]
    -- upvalues: v1 (copy), v15 (copy)
    return v1.createElement(v15.Component, {
        CornerRadius = 8, 
        Size = UDim2.new(0, 32, 0, 32), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0, 0.5)
    });
end;
local v21 = {
    Icon = {
        Value = "", 
        Schema = {
            Type = "Placeholder"
        }, 
        Renderers = {
            Placeholder = v20
        }
    }, 
    Name = {
        Value = "", 
        Schema = {
            Type = "Placeholder"
        }, 
        Renderers = {
            Placeholder = v19
        }
    }, 
    Description = {
        Value = "", 
        Schema = {
            Type = "Placeholder"
        }, 
        Renderers = {
            Placeholder = v19
        }
    }, 
    Edited = {
        Value = "", 
        Schema = {
            Type = "Placeholder"
        }, 
        Renderers = {
            Placeholder = v19
        }
    }, 
    Created = {
        Value = "", 
        Schema = {
            Type = "Placeholder"
        }, 
        Renderers = {
            Placeholder = v19
        }
    }, 
    Playability = {
        Value = "", 
        Schema = {
            Type = "Placeholder"
        }, 
        Renderers = {
            Placeholder = v19
        }
    }, 
    Type = {
        Value = "", 
        Schema = {
            Type = "Placeholder"
        }, 
        Renderers = {
            Placeholder = v19
        }
    }, 
    TeamCreate = if v6 then {
        Value = "", 
        Schema = {
            Type = "Placeholder"
        }, 
        Renderers = {
            Placeholder = v19
        }
    } else nil
};
local function v28(v22, v23) --[[ Line: 228 ]] --[[ Name: getUniverseIdFromPlaceId ]]
    -- upvalues: v12 (copy)
    assert(v12, "FFlagFixPSCMissingUniverseIdFromLuaStartPage must be enabled to call getUniverseIdFromPlaceId");
    for _, v25 in ipairs(v22) do
        if v25.Id and v25.Id.Type == "PlaceId" and v25.Id.PlaceId == v23 and v25.UniverseId and v25.UniverseId.Value then
            return v25.UniverseId.Value;
        elseif v25.children then
            for _, v27 in ipairs(v25.children) do
                if v27.Id and v27.Id.Type == "PlaceId" and v27.Id.PlaceId == v23 and v27.UniverseId and v27.UniverseId.Value then
                    return v27.UniverseId.Value;
                end;
            end;
        end;
    end;
    assert(false, "Universe ID not found for place ID " .. v23);
end;
ExperiencesTable = function(v29) --[[ Line: 252 ]] --[[ Name: ExperiencesTable ]]
    -- upvalues: l_useState_0 (copy), v5 (copy), l_Localization_0 (copy), l_useMemo_0 (copy), v12 (copy), l_join_0 (copy), v21 (copy), v20 (copy), v16 (copy), v6 (copy), v1 (copy), v4 (copy), l_TreeTable_0 (copy), v17 (copy), v11 (copy), v28 (copy), l_StartPageManager_0 (copy), v18 (copy)
    local v30, v31 = l_useState_0({});
    local v32 = if v5 then l_Localization_0:use() else nil;
    local v39 = l_useMemo_0(function() --[[ Line: 258 ]]
        -- upvalues: v29 (copy), v12 (ref), l_join_0 (ref), v21 (ref), v20 (ref), v5 (ref), v16 (ref), v32 (copy), v6 (ref)
        local v33 = {};
        for _, v35 in v29.Cells do
            local v36 = {};
            if not v35.IsPlaceholder and v35.Children then
                for _, v38 in v35.Children do
                    assert(v38.Id, "Child place must have a place ID");
                    table.insert(v36, {
                        Icon = {
                            Value = ""
                        }, 
                        Id = {
                            Type = "PlaceId", 
                            PlaceId = v38.Id
                        }, 
                        Name = {
                            Value = v38.Name
                        }, 
                        Description = {
                            Value = v38.Description
                        }, 
                        Edited = {
                            Value = ""
                        }, 
                        Created = {
                            Value = ""
                        }, 
                        Playability = {
                            Value = ""
                        }, 
                        Type = {
                            Value = ""
                        }, 
                        UniverseId = if v12 then {
                            Value = v38.UniverseId
                        } else nil
                    });
                end;
            end;
            if v35.IsPlaceholder then
                table.insert(v33, l_join_0(v21, {
                    children = v36
                }));
            else
                table.insert(v33, {
                    Icon = if v35.ImageUrl then {
                        Value = "", 
                        LeftIcon = {
                            Image = v35.ImageUrl, 
                            Size = UDim2.new(0, 32, 0, 32)
                        }
                    } else if v35.NoLoadableImage then {
                        Value = "", 
                        LeftIcon = {
                            Image = "rbxasset://studio_svg_textures/Lua/StartPage/Light/SI-Standard/Placeholder.png", 
                            Size = UDim2.new(0, 32, 0, 32)
                        }
                    } else {
                        Value = "", 
                        Schema = {
                            Type = "Placeholder"
                        }, 
                        Renderers = {
                            Placeholder = v20
                        }
                    }, 
                    Id = if v35.RootPlaceId then {
                        Type = "PlaceId", 
                        PlaceId = v35.RootPlaceId
                    } else if v35.FilePath then {
                        Type = "FilePath", 
                        FilePath = v35.FilePath
                    } else nil, 
                    Name = {
                        Value = v35.Name or ""
                    }, 
                    Description = {
                        Value = not v35.Description and "" or v35.Description
                    }, 
                    Edited = {
                        Value = if v5 then if v35.LastViewed then v16(v35.LastViewed, v32) else "" else v16(v35.Updated)
                    }, 
                    Created = {
                        Value = v16(v35.Created, if v5 then v32 else nil)
                    }, 
                    Playability = {
                        Value = v35.PrivacyType or ""
                    }, 
                    Type = {
                        Value = v35.IsGame and "Experience" or "Place"
                    }, 
                    UniverseId = if v12 then {
                        Value = v35.Id
                    } else nil, 
                    TeamCreate = if v6 then {
                        Value = v35.IsTeamCreateEnabled and "Yes" or "No"
                    } else nil, 
                    children = v36
                });
            end;
        end;
        return v33;
    end, {
        v29.Cells
    });
    local v40 = nil;
    if v29.CanDisplayComponentAdjustQuery then
        v40 = if v29.Query.sortOrder == "Asc" then Enum.SortDirection.Descending else Enum.SortDirection.Ascending;
    end;
    return v1.createElement("Frame", {
        Position = if v4 then nil else v29.Position, 
        Size = if v4 then nil else v29.Size, 
        [v1.Tag] = v4 and "X-Transparent StartPage-TablePadding X-Fill" or "X-Transparent StartPage-TablePadding"
    }, {
        v1.createElement(l_TreeTable_0, {
            Columns = v17, 
            OnExpansionChange = function(v41) --[[ Line: 400 ]] --[[ Name: OnExpansionChange ]]
                -- upvalues: v31 (copy), l_join_0 (ref), v30 (copy)
                v31(l_join_0(v30, v41));
            end, 
            Selection = if v11() then {} else nil, 
            OnSelectionChange = function(v42) --[[ Line: 404 ]] --[[ Name: OnSelectionChange ]]
                -- upvalues: v12 (ref), v28 (ref), v39 (copy), l_StartPageManager_0 (ref)
                local v43 = next(v42);
                if type(v43) == "number" then
                    if v12 then
                        local v44 = v28(v39, v43);
                        l_StartPageManager_0:openPlace(v43, v44, false);
                        return;
                    else
                        l_StartPageManager_0:openPlace(v43, 0, false);
                        return;
                    end;
                else
                    if type(v43) == "string" then
                        l_StartPageManager_0:openLocalFile(v43, false);
                    end;
                    return;
                end;
            end, 
            Expansion = v30, 
            RootItems = v39, 
            SortOrder = v40, 
            SortIndex = if v29.CanDisplayComponentAdjustQuery then v18[v29.Query.sortParam] else nil, 
            OnSortChange = function(v45, v46) --[[ Line: 422 ]] --[[ Name: OnSortChange ]]
                -- upvalues: v17 (ref), v29 (copy)
                local v47 = v17[v45];
                assert(v47, "There must be a column at the index when you are attempting to sort");
                if not v29.CanDisplayComponentAdjustQuery then
                    return;
                elseif not v47.ShouldSort then
                    return;
                else
                    v29.DisplayComponentHasAdjustedQuery({
                        sortParam = v47.SortParam, 
                        sortOrder = v46 == Enum.SortDirection.Ascending and "Desc" or "Asc"
                    });
                    return;
                end;
            end, 
            RowHeight = 53, 
            UseDeficit = true, 
            GetChildren = function(v48) --[[ Line: 441 ]] --[[ Name: GetChildren ]]
                return v48.children or {};
            end, 
            GetItemId = function(v49) --[[ Line: 444 ]] --[[ Name: GetItemId ]]
                if not v49.Id then
                    return 1;
                elseif v49.Id.Type == "PlaceId" then
                    return v49.Id.PlaceId;
                else
                    return v49.Id.FilePath;
                end;
            end, 
            OnLoadRange = v29.OnLoadRange, 
            Scroll = true, 
            ScrollProps = {
                CanvasSize = v29.CanvasSize
            }, 
            Variant = "modern", 
            [v1.Tag] = "X-Fill"
        })
    });
end;
return ExperiencesTable;