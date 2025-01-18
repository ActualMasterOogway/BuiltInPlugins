local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Components.UGCAvatarServiceContext);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useRefWithInitial);
local l_createElement_0 = v1.createElement;
local v5 = {
    userCatalogFolder = nil
};
local v6 = v1.createContext(v5);
return {
    Context = v6, 
    Provider = function(v7) --[[ Line: 24 ]] --[[ Name: Provider ]]
        -- upvalues: v1 (copy), v2 (copy), v3 (copy), l_createElement_0 (copy), v6 (copy)
        local v8 = v1.useContext(v2);
        local v11 = v3(function() --[[ Line: 29 ]] --[[ Name: createOrGetFolder ]]
            -- upvalues: v8 (copy)
            local l_Catalog_0 = v8:FindFirstChild("Catalog");
            if l_Catalog_0 ~= nil and l_Catalog_0:IsA("Folder") then
                return l_Catalog_0;
            else
                local l_Folder_0 = Instance.new("Folder");
                l_Folder_0.Name = "Catalog";
                l_Folder_0.Parent = v8;
                return l_Folder_0;
            end;
        end);
        v1.useEffect(function() --[[ Line: 43 ]]
            -- upvalues: v8 (copy), v11 (copy)
            local v12 = nil;
            local function v13() --[[ Line: 46 ]] --[[ Name: work ]]
                -- upvalues: v8 (ref), v11 (ref), v12 (ref), v13 (copy)
                local l_Catalog_1 = v8:FindFirstChild("Catalog");
                local v15;
                if l_Catalog_1 ~= nil and l_Catalog_1:IsA("Folder") then
                    v15 = l_Catalog_1;
                else
                    local l_Folder_1 = Instance.new("Folder");
                    l_Folder_1.Name = "Catalog";
                    l_Folder_1.Parent = v8;
                    v15 = l_Folder_1;
                end;
                v11.current = v15;
                l_Catalog_1 = v15.AncestryChanged:Once(function() --[[ Line: 50 ]]
                    -- upvalues: v12 (ref), v13 (ref)
                    task.defer(function() --[[ Line: 51 ]]
                        -- upvalues: v12 (ref), v13 (ref)
                        v12 = v13();
                    end);
                end);
                return function() --[[ Line: 56 ]]
                    -- upvalues: l_Catalog_1 (copy)
                    l_Catalog_1:Disconnect();
                end;
            end;
            v12 = v13();
            return function() --[[ Line: 63 ]]
                -- upvalues: v12 (ref)
                v12();
            end;
        end, {
            v8
        });
        local v17 = {
            userCatalogFolder = v11.current
        };
        return l_createElement_0(v6.Provider, {
            value = v17
        }, v7.children);
    end
};