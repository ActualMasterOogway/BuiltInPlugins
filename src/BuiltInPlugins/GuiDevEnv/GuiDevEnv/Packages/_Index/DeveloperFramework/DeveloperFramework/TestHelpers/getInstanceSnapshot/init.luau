local l_Parent_0 = script.Parent.Parent;
local l_includes_0 = require(l_Parent_0.Parent.Dash).includes;
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local function v5(v6, v7) --[[ Line: 16 ]] --[[ Name: snapshotLines ]]
    -- upvalues: l_includes_0 (copy), l_insert_0 (copy), l_concat_0 (copy), l_sort_0 (copy), v5 (copy)
    local v8 = v7 or {};
    if v8.IgnoreInstances and l_includes_0(v8.IgnoreInstances, v6.ClassName) then
        return {};
    else
        local v9 = v8.InstanceProperties and v8.InstanceProperties[v6.ClassName] or nil;
        local v10 = "";
        local v11 = {};
        if v9 then
            for _, v13 in ipairs(v9) do
                local v14 = v6[v13];
                l_insert_0(v11, ("%s=%s"):format(v13, if typeof(v14) == "string" then ("%q"):format(v14) else if not (typeof(v14) ~= "number" and typeof(v14) ~= "boolean" and typeof(v14) ~= "userdata" and typeof(v14) ~= "function") or typeof(v14) == "table" then tostring(v14) else ("%s(%s)"):format(typeof(v14), (tostring(v14)))));
            end;
            v10 = (" %s"):format(l_concat_0(v11, " "));
        end;
        local v15 = "";
        if v8.Tags then
            local v16 = {};
            for _, v18 in v8.Tags do
                if v6:HasTag(v18) then
                    l_insert_0(v16, ((".%*"):format(v18)));
                end;
            end;
            v15 = if #v16 > 0 then (" %*"):format((l_concat_0(v16, " "))) else "";
        end;
        if #v6:GetChildren() == 0 then
            return {
                ("<%s #%s%s%s/>"):format(v6.ClassName, v6.Name, v15, v10)
            };
        else
            local v19 = {
                ("<%s #%s%s%s>"):format(v6.ClassName, v6.Name, v15, v10)
            };
            local v20 = {};
            local v21 = false;
            for _, v23 in ipairs(v6:GetChildren()) do
                l_insert_0(v20, v23);
                if v23:IsA("UIListLayout") and v23.SortOrder == Enum.SortOrder.LayoutOrder then
                    v21 = true;
                end;
            end;
            l_sort_0(v20, function(v24, v25) --[[ Line: 66 ]]
                -- upvalues: v21 (ref)
                if v21 and v24:IsA("GuiObject") and v25:IsA("GuiObject") then
                    return v24.LayoutOrder < v25.LayoutOrder;
                else
                    return v24.Name < v25.Name;
                end;
            end);
            for _, v27 in ipairs(v20) do
                local v28 = v5(v27, v8);
                for _, v30 in ipairs(v28) do
                    l_insert_0(v19, "\t" .. v30);
                end;
            end;
            l_insert_0(v19, ("</%s>"):format(v6.ClassName));
            return v19;
        end;
    end;
end;
return function(v31, v32) --[[ Line: 83 ]] --[[ Name: getInstanceSnapshot ]]
    -- upvalues: l_concat_0 (copy), v5 (copy)
    return l_concat_0(v5(v31, v32), "\n");
end;