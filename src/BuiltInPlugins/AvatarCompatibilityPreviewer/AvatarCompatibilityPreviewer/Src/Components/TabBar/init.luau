local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.ForceRerender);
local v5 = require(l_script_FirstAncestor_0.Src.Components.CategoryTab);
local v6 = require(l_script_FirstAncestor_0.Src.Components.PickTabMenu);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local v8 = v7();
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Tabs_0 = l_UI_0.Tabs;
return function(v18) --[[ Line: 34 ]] --[[ Name: TabBar ]]
    -- upvalues: l_Analytics_0 (copy), l_Localization_0 (copy), l_Stylizer_0 (copy), v3 (copy), v1 (copy), v8 (copy), l_Pane_0 (copy), v7 (copy), l_ScrollingFrame_0 (copy), v4 (copy), l_Tabs_0 (copy), v5 (copy), v6 (copy)
    local v19 = l_Analytics_0:use();
    local v20 = l_Localization_0:use();
    local v21 = l_Stylizer_0:use("TabBar");
    local v22 = v3.useRef(nil);
    local v23 = v3.useRef(nil);
    local v24 = v3.useRef({});
    local v25, v26 = v3.useState(100);
    local v27, v28 = v3.useState(100);
    local v29, v30 = v3.useState(Vector2.new());
    local v32 = v3.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v1 (ref), v18 (copy), v20 (copy)
        return v1.map(v18.Tabs, function(v31) --[[ Line: 47 ]]
            -- upvalues: v20 (ref)
            return {
                Key = v31, 
                Label = v20:getText("Categories", v31)
            };
        end);
    end, {
        v20, 
        v18.Tabs
    });
    local v35 = if v8 then v3.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v1 (ref), v18 (copy), v20 (copy), v23 (copy), v24 (copy), v30 (copy)
        return v1.map(v18.Tabs, function(v33) --[[ Line: 57 ]]
            -- upvalues: v20 (ref), v18 (ref), v23 (ref), v24 (ref), v30 (ref)
            return {
                Text = v20:getText("Categories", v33), 
                OnItemClicked = function() --[[ Line: 60 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v18 (ref), v33 (copy), v23 (ref), v24 (ref), v30 (ref)
                    v18.SetSelectedTab(v33);
                    assert(v23.current ~= nil, "Ref to category tabs is nil");
                    assert(v24.current ~= nil, "Ref to category tabs list is nil");
                    local v34 = v24.current[v33];
                    v30(Vector2.new(v34.current.AbsolutePosition.X - v23.current.AbsolutePosition.X, 0));
                end, 
                Checked = v33 == v18.SelectedTab
            };
        end);
    end, {
        v20, 
        v18.Tabs, 
        v18.SelectedTab, 
        v18.SetSelectedTab
    }) else nil;
    local v36 = v25 < v27;
    if v8 then
        v3.useEffect(function() --[[ Line: 84 ]]
            -- upvalues: v22 (copy), v26 (copy), v23 (copy), v28 (copy)
            assert(v22.current ~= nil, "Ref to category tabs frame is nil");
            v26(v22.current.AbsoluteSize.X);
            assert(v23.current ~= nil, "Ref to category tabs is nil");
            v28(v23.current.AbsoluteSize.X);
        end, {});
    end;
    return v3.createElement(l_Pane_0, {
        LayoutOrder = v18.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 32), 
        Style = "SubtleBox", 
        ref = if v7() then v22 else nil, 
        [v3.Change.AbsoluteSize] = v7() and function(v37) --[[ Line: 103 ]]
            -- upvalues: v26 (copy)
            v26(v37.AbsoluteSize.X);
        end or nil
    }, {
        ScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.X, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            CanvasPosition = if v7() then v29 else nil, 
            OnScrollUpdate = if v7() then v30 else nil, 
            Padding = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            ScrollBarThickness = 0, 
            Size = if v7() then UDim2.new(1, v36 and -32 or 0, 1, 0) else nil
        }, {
            Tabs = v3.createElement(v4, {
                component = l_Tabs_0, 
                innerProps = {
                    SelectedTab = v18.SelectedTab, 
                    OnTabSelected = function(v38) --[[ Line: 126 ]] --[[ Name: OnTabSelected ]]
                        -- upvalues: v19 (copy), v18 (copy)
                        v19:report("openTab", v38.Key);
                        v18.SetSelectedTab(v38.Key);
                    end, 
                    Tabs = v32, 
                    TabComponent = if v7() then v5 else nil, 
                    ref = if v7() then v23 else nil, 
                    TabsListRef = v24, 
                    OnAbsoluteSizeChanged = v7() and function(v39) --[[ Line: 135 ]]
                        -- upvalues: v28 (copy)
                        v28(v39.AbsoluteSize.X);
                    end or nil
                }, 
                dependencies = {
                    v32
                }
            })
        }), 
        PickTabMenu = if v7() and v36 then v3.createElement(v6, {
            MenuTabs = v35, 
            BackgroundColor = v21.BackgroundColor, 
            BackgroundColorHover = v21.BackgroundColorHover
        }) else nil
    });
end;