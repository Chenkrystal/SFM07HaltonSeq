function hs = haltontotal(n,b)
hs = zeros(n,1);
for i = 1:n
    hs(i) = HaltonSingle(i,b);
end

% Subfunction to generate the nth number in Halton's sequence
function hn = HaltonSingle(n,b)
% This function generates the n-th number in Halton's low
% discrepancy sequence.
n0 = n;
hn = 0;
f = 1/b;
while (n0>0)
    n1 = floor(n0/b);
    r = n0-n1*b;
    hn = hn + f*r;
    f = f/b;
    n0 = n1;
end 