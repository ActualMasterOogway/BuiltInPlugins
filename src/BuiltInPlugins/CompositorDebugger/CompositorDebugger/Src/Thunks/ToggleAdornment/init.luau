local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_copy_0 = require(l_script_FirstAncestor_0.Packages.Dash).copy;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.SetAdornments);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v5 = require(l_Thunks_0.RenderAdornments);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v7 = require(l_Util_0.Gizmo);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = {
    {
        color = Color3.fromHex("#FDEBAC"), 
        count = 0
    }, 
    {
        color = Color3.fromHex("#FFAE3E"), 
        count = 0
    }, 
    {
        color = Color3.fromHex("#F98B58"), 
        count = 0
    }, 
    {
        color = Color3.fromHex("#FF62C0"), 
        count = 0
    }, 
    {
        color = Color3.fromHex("#D65AFC"), 
        count = 0
    }, 
    {
        color = Color3.fromHex("#1AC8FF"), 
        count = 0
    }, 
    {
        color = Color3.fromHex("#3BF2B1"), 
        count = 0
    }, 
    {
        color = Color3.fromHex("#0ADE52"), 
        count = 0
    }, 
    {
        color = Color3.fromHex("#95FF0F"), 
        count = 0
    }, 
    {
        color = Color3.fromHex("#DBFF66"), 
        count = 0
    }, 
    {
        color = Color3.fromHex("#FBFF3E"), 
        count = 0
    }
};
local function v15() --[[ Line: 36 ]] --[[ Name: findColor ]]
    -- upvalues: v9 (copy)
    local v10 = nil;
    local v11 = nil;
    for v12, v13 in v9 do
        if v10 == nil or v13.count < v10 then
            v10 = v13.count;
            v11 = v12;
        end;
    end;
    local v14 = v9[v11];
    v14.count = v14.count + 1;
    return v11;
end;
local function _(v16) --[[ Line: 51 ]] --[[ Name: releaseColor ]]
    v16.count = v16.count - 1;
end;
return function(v18) --[[ Line: 55 ]]
    -- upvalues: l_copy_0 (copy), v15 (copy), v9 (copy), v7 (copy), v3 (copy), v5 (copy)
    return function(v19) --[[ Line: 56 ]]
        -- upvalues: l_copy_0 (ref), v18 (copy), v15 (ref), v9 (ref), v7 (ref), v3 (ref), v5 (ref)
        local l_Actor_0 = v19:getState().Status.Actor;
        local v21 = l_copy_0(v19:getState().Status.Adornments);
        if not v21[v18] or not v21[v18].enabled then
            local v22 = v15();
            local v23 = v9[v22];
            v21[v18] = {
                enabled = true, 
                colorEntry = v23, 
                index = v22
            };
            if not v21[v18].gizmo then
                v21[v18].gizmo = v7.new(l_Actor_0, v18);
            end;
        else
            local l_colorEntry_0 = v21[v18].colorEntry;
            l_colorEntry_0.count = l_colorEntry_0.count - 1;
            v21[v18].enabled = false;
        end;
        v19:dispatch(v3(v21));
        v19:dispatch(v5());
    end;
end;