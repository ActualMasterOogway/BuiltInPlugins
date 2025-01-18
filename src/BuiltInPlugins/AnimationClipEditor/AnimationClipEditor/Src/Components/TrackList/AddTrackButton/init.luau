local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v5 = require(l_script_FirstAncestor_0.Packages.Roact);
local v6 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v7 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v8 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v12 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v13 = v5.PureComponent:extend("AddTrackButton");
v13.init = function(v14) --[[ Line: 34 ]] --[[ Name: init ]]
    v14.state = {
        showMenu = false
    };
    v14.showMenu = function() --[[ Line: 39 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            showMenu = true
        });
    end;
    v14.hideMenu = function() --[[ Line: 45 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            showMenu = false
        });
    end;
    v14.mouseEnter = function() --[[ Line: 51 ]]
        -- upvalues: v14 (copy)
        if v14.props.Mouse then
            v14.props.Mouse:__pushCursor("PointingHand");
        end;
        v14:setState({
            hovering = true
        });
    end;
    v14.mouseLeave = function() --[[ Line: 60 ]]
        -- upvalues: v14 (copy)
        if v14.props.Mouse then
            v14.props.Mouse:__popCursor();
        end;
        v14:setState({
            hovering = false
        });
    end;
end;
v13.willUnmount = function(v15) --[[ Line: 70 ]] --[[ Name: willUnmount ]]
    v15.props.Mouse:__resetCursor();
end;
v13.makeFacialAnimationControlSubMenu = function(v16, v17) --[[ Line: 74 ]] --[[ Name: makeFacialAnimationControlSubMenu ]]
    local v18 = {};
    for _, v20 in ipairs(v17) do
        table.insert(v18, {
            Name = v20.Name, 
            ItemSelected = function() --[[ Line: 80 ]] --[[ Name: ItemSelected ]]
                -- upvalues: v16 (copy), v20 (copy)
                if v16.props.OnTrackSelected then
                    v16.props.OnTrackSelected(v20.Instance, v20.Name, v20.Type);
                end;
            end
        });
    end;
    return v18;
end;
v13.makeFacialAnimationRegionSubMenu = function(v21) --[[ Line: 91 ]] --[[ Name: makeFacialAnimationRegionSubMenu ]]
    -- upvalues: v3 (copy), v4 (copy)
    local l_props_0 = v21.props;
    local l_Localization_0 = l_props_0.Localization;
    local v24 = {};
    local v25 = {};
    local v26 = false;
    for _, v28 in ipairs(l_props_0.Facs) do
        local v29 = v3.FacsControlToRegionMap[v28.Name] or v3.FACS_REGIONS.Other;
        if not v25[v29] then
            v25[v29] = {};
        end;
        table.insert(v25[v29], v28);
        v26 = true;
    end;
    if v26 then
        local v30 = v4.Dictionary.keys(v25);
        table.sort(v30);
        for _, v32 in ipairs(v30) do
            if v25[v32] then
                local v33 = {
                    Text = l_Localization_0:getText("Menu", v32)
                };
                for _, v35 in ipairs(v25[v32]) do
                    table.insert(v33, {
                        Text = v35.Name, 
                        OnItemClicked = function() --[[ Line: 124 ]] --[[ Name: OnItemClicked ]]
                            -- upvalues: v21 (copy), v35 (copy)
                            if v21.props.OnTrackSelected then
                                v21.props.OnTrackSelected(v35.Instance, v35.Name, v35.Type);
                            end;
                        end
                    });
                end;
                table.insert(v24, v33);
            end;
        end;
        table.insert(v24, v3.MENU_SEPARATOR);
        table.insert(v24, {
            Text = l_Localization_0:getText("Menu", "AddAllFacs"), 
            OnItemClicked = function() --[[ Line: 139 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: l_props_0 (copy), v21 (copy)
                for _, v37 in ipairs(l_props_0.Facs) do
                    v21.props.OnTrackSelected(v37.Instance, v37.Name, v37.Type);
                end;
            end
        });
    end;
    return v24;
end;
v13.makeTrackActions = function(v38) --[[ Line: 150 ]] --[[ Name: makeTrackActions ]]
    -- upvalues: v3 (copy), v12 (copy)
    local l_props_1 = v38.props;
    local l_Localization_1 = l_props_1.Localization;
    local v41 = {};
    for _, v43 in ipairs(l_props_1.Tracks) do
        table.insert(v41, {
            Text = v43.Name, 
            OnItemClicked = function() --[[ Line: 158 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: v38 (copy), v43 (copy)
                v38.props.OnTrackSelected(v43.Instance, v43.Name, v43.Type);
            end
        });
    end;
    if #l_props_1.Tracks > 0 then
        table.insert(v41, v3.MENU_SEPARATOR);
        table.insert(v41, {
            Text = l_Localization_1:getText("Menu", "AddAllTracks"), 
            OnItemClicked = function() --[[ Line: 168 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: l_props_1 (copy), v38 (copy)
                for _, v45 in ipairs(l_props_1.Tracks) do
                    v38.props.OnTrackSelected(v45.Instance, v45.Name, v45.Type);
                end;
            end
        });
        table.insert(v41, v3.MENU_SEPARATOR);
    end;
    if v12.getFaceControls(v38.props.RootInstance) then
        local v46 = v38:makeFacialAnimationRegionSubMenu();
        for _, v48 in pairs(v46) do
            table.insert(v41, v48);
        end;
    end;
    return v41;
end;
v13.render = function(v49) --[[ Line: 189 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v7 (copy), v8 (copy)
    local _ = v49.props.Localization;
    local l_props_2 = v49.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_state_0 = v49.state;
    local l_showMenu_0 = l_state_0.showMenu;
    local l_hovering_0 = l_state_0.hovering;
    local l_Size_0 = l_props_2.Size;
    local l_Position_0 = l_props_2.Position;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    return v5.createElement("ImageButton", {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = Vector2.new(1, 0.5), 
        Image = l_trackTheme_0.addButtonBackground, 
        ImageColor3 = l_hovering_0 and l_trackTheme_0.hoveredAddButtonColor or l_trackTheme_0.addButtonColor, 
        BackgroundTransparency = 1, 
        [v5.Event.Activated] = v49.showMenu, 
        [v5.Event.MouseEnter] = v49.mouseEnter, 
        [v5.Event.MouseLeave] = v49.mouseLeave
    }, {
        PlusIcon = v5.createElement("ImageLabel", {
            Size = UDim2.new(0, 9, 0, 8), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = l_trackTheme_0.plusIcon, 
            ImageColor3 = l_hovering_0 and l_trackTheme_0.hoveredPlusIconColor or l_trackTheme_0.plusIconColor, 
            BackgroundTransparency = 1
        }), 
        TrackMenu = l_showMenu_0 and v5.createElement(v7, {
            Actions = v49:makeTrackActions(), 
            OnMenuOpened = v49.hideMenu
        }), 
        Tooltip = v5.createElement(v8, {
            TextKey = "AddTrackButton"
        })
    });
end;
local function v61(v59, _) --[[ Line: 234 ]] --[[ Name: mapStateToProps ]]
    return {
        RootInstance = v59.Status.RootInstance
    };
end;
v13 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v13);
return v6.connect(v61)(v13);