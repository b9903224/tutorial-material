function [L, n] = bwlabel_1D(filterImg_row)

n = 0;
filterImg_rowLen = numel(filterImg_row);
L = zeros(1, filterImg_rowLen);

%%
for i = 1 : filterImg_rowLen
    filterImg_row_single = filterImg_row(i);
    if filterImg_row_single
        if i == 1
            n = n + 1;
            L(i) = n;
        elseif filterImg_row_single_old == true
            L(i) = n;
        else
            n = n + 1;
            L(i) = n;
        end
    end
    filterImg_row_single_old = filterImg_row_single;
end

end



















