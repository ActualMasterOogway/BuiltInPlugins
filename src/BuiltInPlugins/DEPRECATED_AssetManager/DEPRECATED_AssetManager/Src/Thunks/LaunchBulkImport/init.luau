local l_BulkImportService_0 = game:GetService("BulkImportService");
return function(v1) --[[ Line: 4 ]]
    -- upvalues: l_BulkImportService_0 (copy)
    return function(_) --[[ Line: 5 ]]
        -- upvalues: l_BulkImportService_0 (ref), v1 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
            -- upvalues: l_BulkImportService_0 (ref), v1 (ref)
            l_BulkImportService_0:LaunchBulkImport(v1);
        end);
        if not l_status_0 then
            warn(l_result_0);
        end;
    end;
end;