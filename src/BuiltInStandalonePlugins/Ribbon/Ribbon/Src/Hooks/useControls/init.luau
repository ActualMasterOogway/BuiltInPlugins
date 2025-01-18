local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v1.useEffect;
local l_useState_0 = v1.useState;
local v4 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Resources.ControlsModel);
local l_insert_0 = table.insert;
local l_filter_0 = require(l_script_FirstAncestor_0.Packages.Dash).filter;
local v9 = require(l_script_FirstAncestor_0.Src.Util.isControlEnabledFromFlags);
return function(v10, v11) --[[ Line: 25 ]] --[[ Name: useControls ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), v9 (copy), v4 (copy), l_insert_0 (copy), v6 (copy), l_filter_0 (copy)
    local l_v10_PluginComponent_0 = v10:GetPluginComponent("Actions");
    local l_v10_PluginComponent_1 = v10:GetPluginComponent("Settings");
    local v14, v15 = l_useState_0({
        Controls = {}, 
        Actions = {}, 
        Settings = {}
    });
    l_useEffect_0(function() --[[ Line: 35 ]]
        -- upvalues: v9 (ref), v4 (ref), l_insert_0 (ref), v6 (ref), v11 (copy), l_v10_PluginComponent_0 (copy), l_v10_PluginComponent_1 (copy), v15 (copy), l_filter_0 (ref)
        local v16 = {};
        local v17 = {};
        local function v18(v19) --[[ Line: 39 ]] --[[ Name: walkControls ]]
            -- upvalues: v9 (ref), v4 (ref), v16 (copy), l_insert_0 (ref), v17 (copy), v6 (ref), v18 (copy)
            for _, v21 in v19 do
                if v9(v21) then
                    if v21.Action then
                        if v4.isValid(v21.Action) then
                            l_insert_0(v16, v21.Action);
                        else
                            warn((("Uri %* is not valid!"):format((v4.toString(v21.Action)))));
                        end;
                    end;
                    if v21.ActionGroup then
                        for _, v23 in v21.ActionGroup do
                            if v4.isValid(v23) then
                                l_insert_0(v16, v23);
                            else
                                warn((("Uri %* is not valid!"):format((v4.toString(v23)))));
                            end;
                        end;
                    end;
                    if v21.Setting then
                        if v4.isValid(v21.Setting) then
                            l_insert_0(v17, v21.Setting);
                        else
                            warn((("Uri %* is not valid!"):format((v4.toString(v21.Setting)))));
                        end;
                        local v24 = v6.GetModel(v21.Setting);
                        if v24 and v24.Values then
                            v18(v24.Values);
                        end;
                    end;
                    if v21.Children then
                        v18(v21.Children);
                    end;
                end;
            end;
        end;
        v18(v11);
        local l_l_v10_PluginComponent_0_Async_0 = l_v10_PluginComponent_0:GetAsync(v16);
        local v26 = {};
        for _, v28 in l_l_v10_PluginComponent_0_Async_0 do
            v26[v4.toString(v28.Uri)] = v28;
        end;
        local l_l_v10_PluginComponent_1_Async_0 = l_v10_PluginComponent_1:GetAsync(v17);
        local v30 = {};
        for _, v32 in l_l_v10_PluginComponent_1_Async_0 do
            v30[v4.toString(v32.Uri)] = v32;
        end;
        v15({
            Controls = v11, 
            Actions = v26, 
            Settings = v30
        });
        local v33 = {};
        local function v37(v34) --[[ Line: 100 ]]
            -- upvalues: v15 (ref), v4 (ref)
            v15(function(v35) --[[ Line: 101 ]]
                -- upvalues: v4 (ref), v34 (copy)
                local v36 = {
                    Controls = v35.Controls, 
                    Actions = v35.Actions, 
                    Settings = v35.Settings
                };
                v36.Settings[v4.toString(v34.Uri)] = v34;
                return v36;
            end);
        end;
        local v38 = {};
        local function v43() --[[ Line: 113 ]] --[[ Name: bindToSettings ]]
            -- upvalues: l_v10_PluginComponent_1 (ref), v17 (copy), v38 (copy), v37 (copy), l_insert_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 114 ]]
                -- upvalues: l_v10_PluginComponent_1 (ref), v17 (ref)
                return l_v10_PluginComponent_1:MultiBindAsync(v17);
            end);
            if l_status_0 then
                for _, v42 in l_result_0 do
                    l_insert_0(v38, v42:Connect(v37));
                end;
                return;
            else
                warn(l_result_0);
                return;
            end;
        end;
        l_insert_0(v33, (task.defer(v43)));
        local function v47(v44) --[[ Line: 128 ]]
            -- upvalues: v15 (ref), v4 (ref)
            v15(function(v45) --[[ Line: 129 ]]
                -- upvalues: v4 (ref), v44 (copy)
                local v46 = {
                    Controls = v45.Controls, 
                    Actions = v45.Actions, 
                    Settings = v45.Settings
                };
                v46.Actions[v4.toString(v44.Uri)] = v44;
                return v46;
            end);
        end;
        local v48 = {};
        local function v56() --[[ Line: 141 ]] --[[ Name: bindToActions ]]
            -- upvalues: l_filter_0 (ref), v16 (copy), v6 (ref), l_v10_PluginComponent_0 (ref), v48 (copy), v47 (copy), l_insert_0 (ref)
            local v51 = l_filter_0(v16, function(v49) --[[ Line: 142 ]]
                -- upvalues: v6 (ref)
                local v50 = v6.GetModel(v49);
                if v50 and v50.NoBinding then
                    return false;
                else
                    return true;
                end;
            end);
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 149 ]]
                -- upvalues: l_v10_PluginComponent_0 (ref), v51 (copy)
                return l_v10_PluginComponent_0:MultiBindToChangedAsync(v51);
            end);
            if l_status_1 then
                for _, v55 in l_result_1 do
                    l_insert_0(v48, v55:Connect(v47));
                end;
                return;
            else
                warn(l_result_1);
                return;
            end;
        end;
        l_insert_0(v33, (task.defer(v56)));
        local function v68() --[[ Line: 164 ]]
            -- upvalues: v33 (copy), l_v10_PluginComponent_0 (ref), v16 (copy), l_v10_PluginComponent_1 (ref), v17 (copy), v15 (ref), v4 (ref)
            local v57 = true;
            while v57 do
                wait();
                v57 = false;
                for _, v59 in v33 do
                    if coroutine.status(v59) ~= "dead" then
                        v57 = true;
                    end;
                end;
            end;
            local l_l_v10_PluginComponent_0_Async_1 = l_v10_PluginComponent_0:GetAsync(v16);
            local l_l_v10_PluginComponent_1_Async_1 = l_v10_PluginComponent_1:GetAsync(v17);
            v15(function(v62) --[[ Line: 177 ]]
                -- upvalues: l_l_v10_PluginComponent_0_Async_1 (copy), v4 (ref), l_l_v10_PluginComponent_1_Async_1 (copy)
                local v63 = {
                    Controls = v62.Controls, 
                    Actions = v62.Actions, 
                    Settings = v62.Settings
                };
                for _, v65 in l_l_v10_PluginComponent_0_Async_1 do
                    v63.Actions[v4.toString(v65.Uri)] = v65;
                end;
                for _, v67 in l_l_v10_PluginComponent_1_Async_1 do
                    v63.Settings[v4.toString(v67.Uri)] = v67;
                end;
                return v63;
            end);
        end;
        if #v33 > 0 then
            task.defer(v68);
        end;
        return function() --[[ Line: 197 ]]
            -- upvalues: v38 (copy), v48 (copy)
            for _, v70 in v38 do
                v70:Disconnect();
            end;
            for _, v72 in v48 do
                v72:Disconnect();
            end;
        end;
    end, {
        v11, 
        v15
    });
    return v14;
end;