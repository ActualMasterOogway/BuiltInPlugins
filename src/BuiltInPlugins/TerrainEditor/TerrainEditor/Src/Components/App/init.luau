local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
local l_Pane_0 = v2.UI.Pane;
local v9 = require(l_script_FirstAncestor_0.Src.Components.Toolbar);
local v10 = require(l_script_FirstAncestor_0.Src.Components.ToolGizmos);
local v11 = require(l_script_FirstAncestor_0.Src.Components.ToolSettings);
local v12 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
return function() --[[ Line: 23 ]]
    -- upvalues: v12 (copy), l_useState_0 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy), l_LayoutOrderIterator_0 (copy), v1 (copy), l_Pane_0 (copy), v9 (copy), v11 (copy), v10 (copy)
    local v13 = v12:use();
    local v14, v15 = l_useState_0(Vector2.new(0, 0));
    local v16 = l_useRef_0();
    l_useEffect_0(function() --[[ Line: 29 ]]
        -- upvalues: v16 (copy), v13 (copy)
        if v16.current then
            v13:setRoot(v16.current.Parent);
            v13:setPluginWidth(v16.current.AbsoluteSize.X);
        end;
    end, {});
    local v17 = l_useCallback_0(function() --[[ Line: 36 ]]
        -- upvalues: v16 (copy), v13 (copy)
        if v16.current then
            v13:setPluginWidth(v16.current.AbsoluteSize.X);
        end;
    end, {
        v13
    });
    local v18 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        ForwardRef = v16, 
        Size = UDim2.fromScale(1, 1), 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        [v1.Change.AbsoluteSize] = v17
    }, {
        Toolbar = v1.createElement(v9, {
            LayoutOrder = v18:getNextOrder(), 
            OnAbsoluteSizeChanged = v15
        }), 
        ToolSettings = v1.createElement(v11, {
            LayoutOrder = v18:getNextOrder(), 
            Size = UDim2.new(1, 0, 1, -v14.Y)
        }), 
        ToolGizmos = v1.createElement(v10, {
            LayoutOrder = v18:getNextOrder(), 
            Size = UDim2.new()
        })
    });
end;