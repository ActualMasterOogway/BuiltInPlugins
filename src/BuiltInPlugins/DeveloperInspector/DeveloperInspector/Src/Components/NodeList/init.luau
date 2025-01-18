local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Util.InspectorContext);
local l_RoactInspectorApi_0 = v1.DeveloperTools.RoactInspectorApi;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v11 = require(l_Parent_0.Packages.Dash);
local l_collect_0 = v11.collect;
local l_find_0 = v11.find;
local l_shallowEqual_0 = v11.shallowEqual;
local v15 = require(script.NodeListRow);
local v16 = require(l_Parent_0.Src.Util.traceSource);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v18 = require(l_Actions_0.RoactInspector.SelectNode);
local v19 = v2.PureComponent:extend("NodeList");
v19.init = function(v20) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: l_RoactInspectorApi_0 (copy)
    v20.onSelectNode = function(v21) --[[ Line: 34 ]]
        -- upvalues: v20 (copy), l_RoactInspectorApi_0 (ref)
        v20.props.selectNode(v21);
        local v22 = v20.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v22) then
            v22:getFields(v20.props.SelectedPath, v21, {
                "props"
            });
            v22:getFields(v20.props.SelectedPath, v21, {
                "state"
            });
            v22:getFields(v20.props.SelectedPath, v21, {
                "_context"
            });
        end;
    end;
end;
v19.getFlash = function(v23) --[[ Line: 46 ]] --[[ Name: getFlash ]]
    -- upvalues: l_find_0 (copy), l_shallowEqual_0 (copy)
    local v26 = l_find_0(v23.props.Flash, function(_, v25) --[[ Line: 47 ]]
        -- upvalues: l_shallowEqual_0 (ref), v23 (copy)
        return l_shallowEqual_0(v25, v23.props.SelectedPath);
    end);
    if v26 and os.clock() - v26.time < 1 then
        return v26;
    else
        return nil;
    end;
end;
v19.onSelectLink = function(v27, v28) --[[ Line: 59 ]] --[[ Name: onSelectLink ]]
    -- upvalues: v16 (copy)
    local v29 = v27.props.Plugin:get();
    local v30, v31 = v16(v28);
    if v30 then
        v29:OpenScript(v30, v31);
    end;
end;
v19.render = function(v32) --[[ Line: 67 ]] --[[ Name: render ]]
    -- upvalues: l_collect_0 (copy), v2 (copy), v15 (copy), l_Pane_0 (copy), l_ScrollingFrame_0 (copy)
    local l_props_0 = v32.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v35 = v32:getFlash();
    local v39 = l_collect_0(l_props_0.Nodes, function(v36, v37) --[[ Line: 73 ]]
        -- upvalues: v35 (copy), v2 (ref), v15 (ref), l_props_0 (copy), v32 (copy), l_Stylizer_0 (copy)
        local v38 = v35 and v35.indexSet[v36];
        return "Item " .. v36, v2.createElement(v15, {
            Index = v36, 
            Icon = v37.Icon, 
            Name = v37.Name, 
            Flash = v38 and v35 or nil, 
            LinkText = v37.Link, 
            IsSelected = v36 == l_props_0.SelectedIndex, 
            OnSelect = v32.onSelectNode, 
            OnClickLink = function() --[[ Line: 84 ]] --[[ Name: OnClickLink ]]
                -- upvalues: v32 (ref), v37 (copy)
                v32:onSelectLink(v37.Source);
            end, 
            Style = l_Stylizer_0
        });
    end);
    return v2.createElement(l_Pane_0, {
        Padding = l_Stylizer_0.Padding, 
        Size = l_props_0.Size, 
        Style = "BorderBox"
    }, {
        ScrollingFrame = v2.createElement(l_ScrollingFrame_0, {
            Size = UDim2.fromScale(1, 1), 
            Style = l_Stylizer_0.ScrollingFrame, 
            AutoSizeCanvas = true, 
            AutoSizeLayoutOptions = {
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }, v39)
    });
end;
v19 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Plugin = l_ContextServices_0.Plugin, 
    Inspector = v6
})(v19);
return v3.connect(function(v40, _) --[[ Line: 113 ]]
    return {
        Flash = v40.RoactInspector.flashInstances, 
        Nodes = v40.RoactInspector.nodes, 
        SelectedPath = v40.RoactInspector.selectedPath, 
        SelectedIndex = v40.RoactInspector.selectedNodeIndex
    };
end, function(v42) --[[ Line: 120 ]]
    -- upvalues: v18 (copy)
    return {
        selectNode = function(v43) --[[ Line: 122 ]] --[[ Name: selectNode ]]
            -- upvalues: v42 (copy), v18 (ref)
            v42(v18(v43));
        end
    };
end)(v19);