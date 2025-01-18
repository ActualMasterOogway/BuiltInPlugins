local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Storage_0 = require(l_script_FirstAncestor_0.Src.Types).Storage;
local v2 = require(l_script_FirstAncestor_0.Src.Schemas.Settings);
return {
    Get = function(v3, v4, v5, v6) --[[ Line: 16 ]] --[[ Name: Get ]]
        -- upvalues: v2 (copy), l_Storage_0 (copy)
        local v7 = {};
        for v8, v9 in v2[v3].Storage do
            if v9 == l_Storage_0.GlobalPersistent or v9 == l_Storage_0.GlobalSession then
                v7[v8] = v4:getGlobal(v3, v8, v9);
            elseif v9 == l_Storage_0.LocalPersistent then
                v7[v8] = v5[v8];
            elseif v9 == l_Storage_0.LocalSession and v6 then
                v7[v8] = v6[v8];
            end;
        end;
        return v7;
    end, 
    Set = function(v10, v11, v12) --[[ Line: 42 ]] --[[ Name: Set ]]
        -- upvalues: v2 (copy), l_Storage_0 (copy)
        local v13 = {};
        local v14 = {};
        for v15, v16 in v2[v10].Storage do
            if v12[v15] ~= nil then
                if v16 == l_Storage_0.GlobalPersistent or v16 == l_Storage_0.GlobalSession then
                    v11:setGlobal(v10, v15, v12[v15], v16);
                elseif v16 == l_Storage_0.LocalPersistent then
                    v13[v15] = v12[v15];
                elseif v16 == l_Storage_0.LocalSession then
                    v14[v15] = v12[v15];
                end;
            end;
        end;
        return v13, v14;
    end
};