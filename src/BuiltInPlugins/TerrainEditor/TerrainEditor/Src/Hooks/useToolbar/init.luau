local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Controllers.ToolController);
local _ = require(l_script_FirstAncestor_0.Src.Tools.BaseTool);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v6) --[[ Line: 18 ]] --[[ Name: useToolbar ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v7, v8 = l_useState_0(v6:getToolIndex());
    local v9, v10 = l_useState_0(v6:getTabIndex());
    l_useEffect_0(function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy), v8 (copy)
        local v11 = v6.OnToolIndexChanged:Connect(v8);
        return function() --[[ Line: 25 ]]
            -- upvalues: v11 (copy)
            v11:Disconnect();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 30 ]]
        -- upvalues: v6 (copy), v10 (copy)
        local v12 = v6.OnTabIndexChanged:Connect(v10);
        return function() --[[ Line: 33 ]]
            -- upvalues: v12 (copy)
            v12:Disconnect();
        end;
    end, {});
    return {
        Tabs = v6:getTabs(), 
        TabIndex = v9, 
        Tools = v6:getToolbar(), 
        ToolIndex = v7
    };
end;