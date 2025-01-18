local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v2 = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.ContextMenuActionList);
local _ = require(l_script_FirstAncestor_0.Packages.Explorer);
local _ = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.createContextMenuActionWatcher);
local v5 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
return function(v6, v7) --[[ Line: 15 ]] --[[ Name: createStudioGuestContextMenuActions ]]
    -- upvalues: l_Selection_0 (copy), v5 (copy), v2 (copy)
    local v8 = {};
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local function _() --[[ Line: 28 ]] --[[ Name: getSelection ]]
        -- upvalues: v11 (ref), l_Selection_0 (ref)
        if v11 ~= nil then
            return v11;
        else
            local v12 = l_Selection_0:Get();
            v11 = v12;
            task.defer(function() --[[ Line: 35 ]]
                -- upvalues: v11 (ref)
                v11 = nil;
            end);
            return v12;
        end;
    end;
    local function v21() --[[ Line: 41 ]] --[[ Name: getSelectionTypes ]]
        -- upvalues: v9 (ref), v11 (ref), l_Selection_0 (ref)
        if v9 ~= nil then
            return v9;
        else
            local v14 = {
                selectingService = false, 
                selectingNonService = false
            };
            local v15, v16, v17;
            if v11 ~= nil then
                v15 = v11;
                v16 = nil;
                v17 = nil;
            else
                local v18 = l_Selection_0:Get();
                v11 = v18;
                task.defer(function() --[[ Line: 35 ]]
                    -- upvalues: v11 (ref)
                    v11 = nil;
                end);
                v15 = v18;
                v16 = nil;
                v17 = nil;
            end;
            for _, v20 in v15, v16, v17 do
                if v20.Parent ~= nil and v20.Parent:IsA("DataModel") then
                    v14.selectingService = true;
                    if v14.selectingNonService then
                        break;
                    end;
                else
                    v14.selectingNonService = true;
                    if v14.selectingService then
                        break;
                    end;
                end;
            end;
            v9 = v14;
            task.defer(function() --[[ Line: 73 ]]
                -- upvalues: v9 (ref)
                v9 = nil;
            end);
            return v14;
        end;
    end;
    local function v30(v22) --[[ Line: 80 ]] --[[ Name: shouldShow ]]
        -- upvalues: v10 (ref), v11 (ref), l_Selection_0 (ref)
        if v10 == nil then
            v10 = {};
            task.defer(function() --[[ Line: 85 ]]
                -- upvalues: v10 (ref)
                v10 = nil;
            end);
        end;
        assert(v10 ~= nil, "Luau");
        local v23 = v10[v22];
        if v23 ~= nil then
            return v23;
        else
            local v24, v25, v26;
            if v11 ~= nil then
                v24 = v11;
                v25 = nil;
                v26 = nil;
            else
                local v27 = l_Selection_0:Get();
                v11 = v27;
                task.defer(function() --[[ Line: 35 ]]
                    -- upvalues: v11 (ref)
                    v11 = nil;
                end);
                v24 = v27;
                v25 = nil;
                v26 = nil;
            end;
            for _, v29 in v24, v25, v26 do
                if v22(v29) then
                    v10[v22] = true;
                    return true;
                end;
            end;
            v10[v22] = false;
            return false;
        end;
    end;
    local function v31(v32) --[[ Line: 107 ]] --[[ Name: addItem ]]
        -- upvalues: v8 (copy), v21 (copy), v5 (ref), v30 (copy), v7 (copy), v6 (copy), v31 (copy)
        if v32.source.type == "studioAction" then
            v8[v32.key] = {
                getActionStateAsync = function() --[[ Line: 110 ]] --[[ Name: getActionStateAsync ]]
                    -- upvalues: v21 (ref), v32 (copy), v5 (ref), v30 (ref), v7 (ref)
                    local v33 = v21();
                    local v34 = false;
                    if v32.source.expectation == "All" then
                        v34 = v33.selectingNonService or v33.selectingService;
                    elseif v32.source.expectation == "ServicesAndBlank" then
                        v34 = v33.selectingService or not v33.selectingNonService;
                    elseif v32.source.expectation == "Services" then
                        v34 = v33.selectingService;
                    elseif v32.source.expectation == "NonServices" then
                        v34 = v33.selectingNonService;
                    else
                        v5(v32.source.expectation);
                    end;
                    if not v34 then
                        return {
                            enabled = false, 
                            visible = false
                        };
                    elseif v32.source.shouldShow ~= nil and not v30(v32.source.shouldShow) then
                        return {
                            enabled = false, 
                            visible = false
                        };
                    else
                        local v35 = v7.getStudioActionState(v32.source.uri);
                        return {
                            enabled = v35.Enabled, 
                            visible = v35.Visible
                        };
                    end;
                end, 
                trigger = function() --[[ Line: 148 ]] --[[ Name: trigger ]]
                    -- upvalues: v6 (ref), v32 (copy)
                    task.spawn(function() --[[ Line: 149 ]]
                        -- upvalues: v6 (ref), v32 (ref)
                        v6:GetPluginComponent("Actions"):ActivateAsync(v32.source.uri);
                    end);
                end
            };
            return;
        else
            if v32.source.type == "submenu" then
                for _, v37 in v32.source.submenuCategories do
                    for _, v39 in v37 do
                        v31(v39);
                    end;
                end;
            end;
            return;
        end;
    end;
    for _, v41 in v2 do
        for _, v43 in v41 do
            v31(v43);
        end;
    end;
    return v8;
end;