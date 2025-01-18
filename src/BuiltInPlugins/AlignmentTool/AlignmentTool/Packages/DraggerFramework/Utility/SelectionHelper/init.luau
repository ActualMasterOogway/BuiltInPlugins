local _ = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Utility.shouldDragAsFace);
return {
    updateSelection = function(v3, v4, v5, v6) --[[ Line: 14 ]] --[[ Name: updateSelection ]]
        if not v3 then
            if v6 then
                return false, v4;
            else
                return #v4 > 0, {};
            end;
        elseif v6 and not v5 then
            local v7 = {};
            local v8 = {};
            local v9 = {};
            local v10 = false;
            for _, v12 in ipairs(v4) do
                if v12 == v3 then
                    v10 = true;
                else
                    table.insert(v7, v12);
                end;
            end;
            if v10 then
                table.insert(v9, v3);
            else
                table.insert(v7, v3);
                table.insert(v8, v3);
            end;
            return true, v7, {
                Added = v8, 
                Removed = v9
            };
        else
            local v13 = table.find(v4, v3);
            if v13 and not v5 then
                local v14 = #v4;
                if v13 < v14 then
                    local v15 = {};
                    table.move(v4, 1, v13, 1, v15);
                    table.move(v4, v13 + 1, v14, v13, v15);
                    v15[v14] = v3;
                    return true, v15, {
                        Added = {
                            v3
                        }, 
                        Removed = {
                            v3
                        }
                    };
                else
                    return false, v4;
                end;
            else
                return true, {
                    v3
                };
            end;
        end;
    end, 
    updateSelectionWithMultipleSelectables = function(v16, v17, v18, v19) --[[ Line: 75 ]] --[[ Name: updateSelectionWithMultipleSelectables ]]
        if #v16 == 0 then
            return (not not v18 or v19) and v17 or {};
        else
            local v20 = nil;
            local v21 = {};
            local v22 = {};
            if v18 or v19 then
                v20 = {};
                local v23 = {};
                for _, v25 in ipairs(v17) do
                    v23[v25] = true;
                end;
                if v18 then
                    local v26 = {};
                    for _, v28 in ipairs(v16) do
                        v26[v28] = true;
                    end;
                    for _, v30 in ipairs(v17) do
                        if not v26[v30] then
                            table.insert(v20, v30);
                            table.insert(v21, v30);
                        end;
                    end;
                    for _, v32 in ipairs(v16) do
                        if not v23[v32] then
                            table.insert(v20, v32);
                            table.insert(v21, v32);
                        else
                            table.insert(v22, v32);
                        end;
                    end;
                elseif v19 then
                    for _, v34 in ipairs(v17) do
                        table.insert(v20, v34);
                        table.insert(v21, v34);
                    end;
                    for _, v36 in ipairs(v16) do
                        if not v23[v36] then
                            table.insert(v20, v36);
                            table.insert(v21, v36);
                        else
                            table.insert(v22, v36);
                        end;
                    end;
                end;
            else
                for _, v38 in ipairs(v16) do
                    if not table.find(v17, v38) then
                        table.insert(v21, v38);
                    end;
                end;
                for _, v40 in ipairs(v17) do
                    if not table.find(v16, v40) then
                        table.insert(v22, v40);
                    end;
                end;
                v20 = v16;
            end;
            return v20, {
                Added = v21, 
                Removed = v22
            };
        end;
    end
};