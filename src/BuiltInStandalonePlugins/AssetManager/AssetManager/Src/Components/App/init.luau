local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_UI_0 = v2.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_SplitPane_0 = l_UI_0.SplitPane;
local v8 = require(script.MainView);
local v9 = require(script.Sidebar);
local v10 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
local v15 = require(l_script_FirstAncestor_0.Src.Hooks.useShowSidebar);
local v16 = require(l_script_FirstAncestor_0.Src.Hooks.usePluginSize);
local v17 = require(l_script_FirstAncestor_0.Src.Util.Images);
local v18 = require(script.styles);
return function(_) --[[ Line: 34 ]] --[[ Name: App ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v10 (copy), v15 (copy), v16 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy), v1 (copy), v9 (copy), v8 (copy), v18 (copy), l_useState_0 (copy), l_SplitPane_0 (copy), l_IconButton_0 (copy), v17 (copy), l_Pane_0 (copy)
    local v20 = l_LayoutOrderIterator_0.new();
    local v21 = v10.use();
    local v22 = v15(v21);
    local _, v24 = v16(v21);
    local v25 = l_useRef_0(nil);
    l_useEffect_0(function() --[[ Line: 43 ]]
        -- upvalues: v25 (copy), v21 (copy)
        if v25.current then
            v21:setRoot(v25.current.Parent);
            v21:setPluginWidth(v25.current.AbsoluteSize.X);
        end;
    end, {});
    local v26 = l_useCallback_0(function() --[[ Line: 50 ]]
        -- upvalues: v25 (copy), v21 (copy)
        if v25.current then
            v21:setPluginWidth(v25.current.AbsoluteSize.X);
        end;
    end, {
        v21
    });
    local v27 = v1.createElement(v9, {
        LayoutOrder = v20:getNextOrder(), 
        ZIndex = 2
    });
    local v28 = v1.createElement(v8, {
        LayoutOrder = v20:getNextOrder()
    });
    local v29 = if v22 then {
        v18:GetAttribute("DefaultSizeSidebar"), 
        v18:GetAttribute("DefaultSizeMainView")
    } else nil;
    local v30 = if v22 then {
        v18:GetAttribute("MinimumSizeSidebar"), 
        v18:GetAttribute("MinimumSizeMainView")
    } else nil;
    local v31, v32 = l_useState_0(v29);
    local v33 = {};
    if v22 then
        if v24 then
            v33.Sidebar = v27;
        else
            v33.SplitContents = v1.createElement(l_SplitPane_0, {
                ZIndex = 1, 
                UseScale = true, 
                ClampSize = true, 
                MinSizes = v30, 
                Sizes = v31, 
                OnSizesChange = function(v34) --[[ Line: 88 ]] --[[ Name: OnSizesChange ]]
                    -- upvalues: v32 (copy)
                    v32(v34);
                end
            }, {
                v27, 
                v28
            });
        end;
    else
        v33.MainView = v28;
    end;
    v33.CollapseSidebarButton = v1.createElement(l_IconButton_0, {
        LayoutOrder = v20:getNextOrder(), 
        ZIndex = 3, 
        LeftIcon = if v22 then v17.getImageHelper(v17.AvailableImages.SidebarCollapseIcon) else v17.getImageHelper(v17.AvailableImages.SidebarExpandIcon), 
        Cursor = "PointingHand", 
        OnClick = function() --[[ Line: 107 ]] --[[ Name: OnClick ]]
            -- upvalues: v21 (copy)
            v21:toggleSidebar();
        end, 
        [v1.Tag] = "SidebarButton"
    });
    return v1.createElement(l_Pane_0, {
        ForwardRef = v25, 
        [v1.Change.AbsoluteSize] = v26, 
        [v1.Tag] = "App X-Fill"
    }, v33);
end;