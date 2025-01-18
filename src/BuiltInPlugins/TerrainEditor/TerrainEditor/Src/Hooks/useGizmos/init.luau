local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v1.useMemo;
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = game:DefineFastFlag("TerrainEditorUseGizmosLinkTool", false);
local function v25(v8, v9) --[[ Line: 14 ]] --[[ Name: useGizmos ]]
    -- upvalues: l_useState_0 (copy), l_useMemo_0 (copy), l_useRef_0 (copy), l_useEffect_0 (copy)
    local v10, v11 = l_useState_0({
        Gizmos = {}, 
        FromSelf = false
    });
    local v12 = l_useMemo_0(function() --[[ Line: 19 ]]
        -- upvalues: v8 (copy)
        return v8:getTool();
    end, {
        v10
    });
    local v13, v14 = l_useState_0(false);
    local v15 = l_useRef_0(nil);
    local v16 = l_useRef_0(nil);
    local v17 = l_useRef_0(nil);
    if v16.current then
        if v17.current then
            v17.current = nil;
            v15.current = {
                Gizmos = v12:gizmos(), 
                FromSelf = false, 
                Tool = v12
            };
        end;
        v16.current = nil;
    end;
    if v15.current then
        v11(v15.current);
        v15.current = nil;
        if v13 then
            v14(false);
        end;
    end;
    l_useEffect_0(function() --[[ Line: 53 ]]
        -- upvalues: v8 (copy), v16 (copy), v17 (copy), v15 (copy), v14 (copy), v9 (copy), v12 (copy)
        local v19 = v8.OnToolChanged:Connect(function(v18) --[[ Line: 54 ]]
            -- upvalues: v16 (ref), v17 (ref), v15 (ref), v14 (ref)
            if v16.current then
                v17.current = true;
                return;
            else
                v15.current = {
                    Gizmos = v18:gizmos(), 
                    FromSelf = false, 
                    Tool = v18
                };
                v14(true);
                return;
            end;
        end);
        if not v9 then
            return function() --[[ Line: 70 ]]
                -- upvalues: v19 (copy)
                v19:Disconnect();
            end;
        else
            local v20 = v12.OnInternalsChanged:Connect(function() --[[ Line: 75 ]]
                -- upvalues: v16 (ref), v17 (ref), v15 (ref), v12 (ref), v14 (ref)
                if v16.current then
                    v17.current = true;
                    return;
                else
                    v15.current = {
                        Gizmos = v12:gizmos(), 
                        FromSelf = false, 
                        Tool = v12
                    };
                    v14(true);
                    return;
                end;
            end);
            local v21 = v12.OnFormChanged:Connect(function() --[[ Line: 90 ]]
                -- upvalues: v16 (ref), v17 (ref), v15 (ref), v12 (ref), v14 (ref)
                if v16.current then
                    v17.current = true;
                    return;
                else
                    v15.current = {
                        Gizmos = v12:gizmos(), 
                        FromSelf = false, 
                        Tool = v12
                    };
                    v14(true);
                    return;
                end;
            end);
            local v22 = v12.OnShortcutChanged:Connect(function() --[[ Line: 105 ]]
                -- upvalues: v16 (ref), v17 (ref), v15 (ref), v12 (ref), v14 (ref)
                if v16.current then
                    v17.current = true;
                    return;
                else
                    v15.current = {
                        Gizmos = v12:gizmos(), 
                        FromSelf = false, 
                        Tool = v12
                    };
                    v14(true);
                    return;
                end;
            end);
            return function() --[[ Line: 120 ]]
                -- upvalues: v19 (copy), v21 (copy), v20 (copy), v22 (copy)
                v19:Disconnect();
                v21:Disconnect();
                v20:Disconnect();
                v22:Disconnect();
            end;
        end;
    end, {
        v12, 
        v9
    });
    l_useEffect_0(function() --[[ Line: 128 ]]
        -- upvalues: v11 (copy), v9 (copy), v12 (copy)
        v11(if v9 then {
            Gizmos = v12:gizmos(), 
            FromSelf = false, 
            Tool = v12
        } else {
            Gizmos = {}, 
            FromSelf = false
        });
    end, {
        v9
    });
    return v10.Gizmos, function(_, v24) --[[ Line: 141 ]] --[[ Name: saveGizmos ]]
        -- upvalues: v15 (copy), v16 (copy), v8 (copy), v12 (copy), v14 (copy)
        if v15.current then
            return;
        else
            v16.current = true;
            v8:getTool():saveGizmos(v24);
            v15.current = {
                Gizmos = v8:getTool():gizmos(), 
                FromSelf = true, 
                Tool = v12
            };
            v14(true);
            return;
        end;
    end, v10.Tool or v12, v10.FromSelf;
end;
local function v41(v26, v27) --[[ Line: 161 ]] --[[ Name: DEPRECATED_useGizmos ]]
    -- upvalues: l_useState_0 (copy), l_useMemo_0 (copy), l_useRef_0 (copy), l_useEffect_0 (copy)
    local v28, v29 = l_useState_0({
        Gizmos = {}, 
        FromSelf = false
    });
    local v30 = l_useMemo_0(function() --[[ Line: 169 ]]
        -- upvalues: v26 (copy)
        return v26:getTool();
    end, {
        v28
    });
    local v31, v32 = l_useState_0(false);
    local v33 = l_useRef_0(nil);
    if v33.current then
        v29(v33.current);
        v33.current = nil;
        if v31 then
            v32(false);
        end;
    end;
    l_useEffect_0(function() --[[ Line: 187 ]]
        -- upvalues: v26 (copy), v33 (copy), v29 (copy), v32 (copy), v27 (copy), v30 (copy)
        local v35 = v26.OnToolChanged:Connect(function(v34) --[[ Line: 188 ]]
            -- upvalues: v33 (ref), v29 (ref), v32 (ref)
            v33.current = {
                Gizmos = v34:gizmos(), 
                FromSelf = false
            };
            v29(v33.current);
            v32(true);
        end);
        if not v27 then
            return function() --[[ Line: 198 ]]
                -- upvalues: v35 (copy)
                v35:Disconnect();
            end;
        else
            local v36 = v30.OnInternalsChanged:Connect(function() --[[ Line: 203 ]]
                -- upvalues: v29 (ref), v30 (ref)
                v29({
                    Gizmos = v30:gizmos(), 
                    FromSelf = false
                });
            end);
            local v37 = v30.OnFormChanged:Connect(function() --[[ Line: 210 ]]
                -- upvalues: v33 (ref), v30 (ref), v29 (ref), v32 (ref)
                v33.current = {
                    Gizmos = v30:gizmos(), 
                    FromSelf = false
                };
                v29(v33.current);
                v32(true);
            end);
            local v38 = v30.OnShortcutChanged:Connect(function() --[[ Line: 219 ]]
                -- upvalues: v33 (ref), v30 (ref), v29 (ref), v32 (ref)
                v33.current = {
                    Gizmos = v30:gizmos(), 
                    FromSelf = false
                };
                v29(v33.current);
                v32(true);
            end);
            return function() --[[ Line: 228 ]]
                -- upvalues: v35 (copy), v37 (copy), v36 (copy), v38 (copy)
                v35:Disconnect();
                v37:Disconnect();
                v36:Disconnect();
                v38:Disconnect();
            end;
        end;
    end, {
        v30, 
        v27
    });
    l_useEffect_0(function() --[[ Line: 236 ]]
        -- upvalues: v29 (copy), v27 (copy), v30 (copy)
        v29(if v27 then {
            Gizmos = v30:gizmos(), 
            FromSelf = false
        } else {
            Gizmos = {}, 
            FromSelf = false
        });
    end, {
        v27
    });
    return v28.Gizmos, function(_, v40) --[[ Line: 248 ]] --[[ Name: saveGizmos ]]
        -- upvalues: v33 (copy), v26 (copy), v29 (copy)
        if v33.current then
            return;
        else
            v26:getTool():saveGizmos(v40);
            v29({
                Gizmos = v26:getTool():gizmos(), 
                FromSelf = true
            });
            return;
        end;
    end, v30, v28.FromSelf;
end;
if v7 then
    return v25;
else
    return v41;
end;