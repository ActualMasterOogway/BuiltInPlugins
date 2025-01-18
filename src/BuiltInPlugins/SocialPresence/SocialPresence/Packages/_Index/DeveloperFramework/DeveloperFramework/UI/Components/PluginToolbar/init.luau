local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v5 = v1.PureComponent:extend("PluginToolbar");
l_Typecheck_0.wrap(v5, script);
v5.createToolbar = function(v6) --[[ Line: 22 ]] --[[ Name: createToolbar ]]
    local l_props_0 = v6.props;
    local v8 = l_props_0.Plugin:get();
    local l_Title_0 = l_props_0.Title;
    assert(typeof(l_Title_0) == "string", string.format("PluginToolbar requires Title to be of type string not %s", (typeof(l_Title_0))));
    v6.toolbar = v8:CreateToolbar(l_Title_0);
end;
v5.render = function(v10) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    if not v10.toolbar then
        v10:createToolbar();
    end;
    local v11 = v10.props.RenderButtons(v10.toolbar);
    if v11 then
        return v1.createFragment(v11);
    else
        return nil;
    end;
end;
v5.willUnmount = function(v12) --[[ Line: 50 ]] --[[ Name: willUnmount ]]
    if v12.toolbar then
        v12.toolbar:Destroy();
    end;
end;
return (l_withContext_0({
    Plugin = v2.Plugin
})(v5));