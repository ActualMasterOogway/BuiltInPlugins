local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_ContextItem_0 = l_ContextServices_0.ContextItem;
local v5 = require(l_script_FirstAncestor_0.Src.Tools.BaseTool);
local l_Signal_0 = v2.Util.Signal;
local l_findIndex_0 = v1.findIndex;
local v8 = require(l_script_FirstAncestor_0.Src.Tools);
local l_Tab_0 = require(l_script_FirstAncestor_0.Src.Types).Tab;
local v10 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v11 = require(l_script_FirstAncestor_0.Src.Controllers.ShortcutController);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagSmoothVoxels_Tooling);
local v13 = l_ContextItem_0:extend("ToolController");
v13.new = function(v14, v15, v16, v17, v18, v19) --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v13 (copy), v8 (copy), l_findIndex_0 (copy), v12 (copy), l_Tab_0 (copy)
    local v20 = setmetatable({
        _mocking = v19, 
        OnToolChanged = l_Signal_0.new(), 
        OnToolIndexChanged = l_Signal_0.new(), 
        OnTabIndexChanged = l_Signal_0.new()
    }, v13);
    local v21 = {};
    local v22 = {};
    for _, v24 in v8 do
        local v25 = v24:new();
        v25:init({
            Analytics = v16, 
            Localization = v17, 
            PluginController = v14, 
            ShortcutController = v15, 
            Stylizer = v18, 
            ToolController = {
                selectTool = function(v26) --[[ Line: 64 ]] --[[ Name: selectTool ]]
                    -- upvalues: v20 (copy), l_findIndex_0 (ref)
                    v20:setToolIndex(l_findIndex_0(v20._tabs[v20._tabIndex].ToolRegistry, function(v27) --[[ Line: 65 ]]
                        -- upvalues: v26 (copy)
                        return v27._name == v26;
                    end));
                end, 
                selectTab = function(v28) --[[ Line: 69 ]] --[[ Name: selectTab ]]
                    -- upvalues: v20 (copy)
                    v20:setTabIndex(v20._tabRegistry[v28]);
                end, 
                selectTabAndTool = function(v29, v30) --[[ Line: 72 ]] --[[ Name: selectTabAndTool ]]
                    -- upvalues: v20 (copy), l_findIndex_0 (ref)
                    local v31 = v20._tabRegistry[v29];
                    local v33 = l_findIndex_0(v20._tabs[v31].ToolRegistry, function(v32) --[[ Line: 74 ]]
                        -- upvalues: v30 (copy)
                        return v32._name == v30;
                    end);
                    v20:setTabAndToolIndex(v31, v33);
                end
            }
        }, {
            ChangeHistoryService = game:GetService("ChangeHistoryService"), 
            CoreGui = game:GetService("CoreGui"), 
            Selection = game:GetService("Selection"), 
            ShorelineUpgraderService = game:GetService("ShorelineUpgraderService"), 
            SmoothVoxelsUpgraderService = if v12() then game:GetService("SmoothVoxelsUpgraderService") else nil, 
            Terrain = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
        });
        local v34 = v25:getCategory();
        if v34 == l_Tab_0.None then
            if v20._emptyTool then
                assert("Cannot have more than one empty tool.");
            end;
            v20._emptyTool = v25;
        else
            if not v21[v34] then
                local v35 = #v22 + 1;
                table.insert(v22, {
                    Key = v35, 
                    Label = v17:getText("Tabs", v34), 
                    ToolIndex = 1, 
                    ToolRegistry = {}, 
                    Toolbar = {}
                });
                v21[v34] = v35;
            end;
            table.insert(v22[v21[v34]].ToolRegistry, v25);
            table.insert(v22[v21[v34]].Toolbar, v25:getTile());
        end;
    end;
    v20._tabRegistry = v21;
    v20._tabs = v22;
    v20._tabIndex = 1;
    v20._useEmptyTool = true;
    v20._focusedConnection = v14.Activation:Connect(function(v36) --[[ Line: 121 ]]
        -- upvalues: v20 (copy)
        if not v36 then
            v20:getTool():reportAnalytics();
        end;
    end);
    return v20;
end;
v13.mock = function(v37, v38, v39, v40, v41) --[[ Line: 130 ]] --[[ Name: mock ]]
    -- upvalues: v13 (copy), v10 (copy), v11 (copy), l_ContextServices_0 (copy)
    return v13.new(v37 or v10.mock(), v38 or v11.mock(), v39 or l_ContextServices_0.Analytics.mock(), v40 or l_ContextServices_0.Localization.mock(), v41, true);
end;
v13.destroy = function(v42) --[[ Line: 141 ]] --[[ Name: destroy ]]
    v42._focusedConnection:Disconnect();
end;
v13.getTabs = function(v43) --[[ Line: 145 ]] --[[ Name: getTabs ]]
    return v43._tabs;
end;
v13.getTabIndex = function(v44) --[[ Line: 149 ]] --[[ Name: getTabIndex ]]
    return v44._tabIndex;
end;
v13.getToolbar = function(v45) --[[ Line: 153 ]] --[[ Name: getToolbar ]]
    return v45._tabs[v45._tabIndex].Toolbar;
end;
v13.getToolIndex = function(v46) --[[ Line: 157 ]] --[[ Name: getToolIndex ]]
    if v46._useEmptyTool then
        return -1;
    else
        return v46._tabs[v46._tabIndex].ToolIndex;
    end;
end;
v13.getTool = function(v47) --[[ Line: 161 ]] --[[ Name: getTool ]]
    -- upvalues: v5 (copy)
    local v48 = v47._tabs[v47._tabIndex];
    if v47._useEmptyTool then
        return v47._emptyTool;
    else
        return v48.ToolRegistry[v48.ToolIndex] or v5.empty();
    end;
end;
v13.setToolIndex = function(v49, v50) --[[ Line: 166 ]] --[[ Name: setToolIndex ]]
    local v51 = v49._tabs[v49._tabIndex];
    assert(v50 <= #v51.ToolRegistry);
    if v50 == v51.ToolIndex and not v49._useEmptyTool then
        v51.ToolRegistry[v51.ToolIndex]:deactivate();
        v49._useEmptyTool = true;
        v49._emptyTool:activate();
        v49.OnToolIndexChanged:Fire(-1);
        v49.OnToolChanged:Fire(v49._emptyTool);
        return;
    else
        if v49._useEmptyTool then
            v49._useEmptyTool = false;
            v49._emptyTool:deactivate();
        else
            v51.ToolRegistry[v51.ToolIndex]:deactivate();
        end;
        v51.ToolIndex = v50;
        v51.ToolRegistry[v51.ToolIndex]:activate();
        v49.OnToolIndexChanged:Fire(v50);
        v49.OnToolChanged:Fire(v51.ToolRegistry[v51.ToolIndex]);
        return;
    end;
end;
v13.setTabIndex = function(v52, v53) --[[ Line: 194 ]] --[[ Name: setTabIndex ]]
    local v54 = v52._tabs[v52._tabIndex];
    if not v52._useEmptyTool then
        v54.ToolRegistry[v54.ToolIndex]:deactivate();
    end;
    v52._tabIndex = v53;
    v54 = v52._tabs[v52._tabIndex];
    if not v52._useEmptyTool then
        v54.ToolRegistry[v54.ToolIndex]:activate();
    end;
    v52.OnTabIndexChanged:Fire(v53);
    if v52._useEmptyTool then
        v52.OnToolIndexChanged:Fire(-1);
        v52.OnToolChanged:Fire(v52._emptyTool);
        return;
    else
        v52.OnToolIndexChanged:Fire(v54.ToolIndex);
        v52.OnToolChanged:Fire(v54.ToolRegistry[v54.ToolIndex]);
        return;
    end;
end;
v13.setTabAndToolIndex = function(v55, v56, v57) --[[ Line: 216 ]] --[[ Name: setTabAndToolIndex ]]
    local v58 = v55._tabs[v55._tabIndex];
    if v57 == v58.ToolIndex and v55._tabIndex == v56 and not v55._useEmptyTool then
        v58.ToolRegistry[v58.ToolIndex]:deactivate();
        v55._useEmptyTool = true;
        v55._emptyTool:activate();
        v55.OnToolIndexChanged:Fire(-1);
        v55.OnToolChanged:Fire(v55._emptyTool);
        return;
    else
        if v55._useEmptyTool then
            v55._useEmptyTool = false;
            v55._emptyTool:deactivate();
        else
            v58.ToolRegistry[v58.ToolIndex]:deactivate();
        end;
        if v57 == v58.ToolIndex then
            v55._useEmptyTool = true;
        end;
        v55._useEmptyTool = false;
        v55._tabIndex = v56;
        v58 = v55._tabs[v55._tabIndex];
        v58.ToolIndex = v57;
        v58.ToolRegistry[v58.ToolIndex]:activate();
        v55.OnTabIndexChanged:Fire(v56);
        v55.OnToolIndexChanged:Fire(v58.ToolIndex);
        v55.OnToolChanged:Fire(v58.ToolRegistry[v58.ToolIndex]);
        return;
    end;
end;
v13.selectTabAndTool = function(v59, v60, v61) --[[ Line: 249 ]] --[[ Name: selectTabAndTool ]]
    -- upvalues: l_findIndex_0 (copy)
    local v62 = v59._tabRegistry[v60];
    v59:setTabAndToolIndex(v62, (l_findIndex_0(v59._tabs[v62].ToolRegistry, function(v63) --[[ Line: 251 ]]
        -- upvalues: v61 (copy)
        return v63._name == v61;
    end)));
end;
return v13;