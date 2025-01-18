return function(...) --[[ Line: 2 ]] --[[ Name: flatten ]]
    local v0 = {};
    for _, v2 in {
        ...
    } do
        table.move(v2, 1, #v2, #v0 + 1, v0);
    end;
    return v0;
end;