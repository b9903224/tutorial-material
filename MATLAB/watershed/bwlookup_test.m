a = [];


lutfun = @(nhood) (nhood(2,2) &(sum(nhood(:)) == 3));
lut = makelut(lutfun,3);
skel_edge = bwlookup(bw_skel,lut);