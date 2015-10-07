% CSE 574 project 2 BN sampling BNsample_C(theta1, Mv)
% Ruhan Sa 50060400
% This function is for Ancestral sampling based on BN given for cursive 'and'.

function s = BNsample_C(theta)
% generating 9 random numbers
r = 1 .*rand(9,1);
order = [ 1, 3, 5, 6, 8, 2, 4, 7, 9]; % in orders to sample the parents first

for m = 1 : 9 
    i = order(m);
    % determine the value range
    if ( i == 1 || i == 5 || i == 6 || i == 7)
		jtotal = 4;
	elseif( i == 2 || i == 4 || i == 8)
		jtotal = 5;
	else
		jtotal = 3;
    end
    
    if ( i == 1 || i == 3 || i == 5 || i == 6 || i == 8) % no parents
        sum = theta(i, 1);
        for j = 1 : jtotal
            if ( r(i) <= sum)
                s(i) = j;
            else
                sum  = sum + theta(i, j);
            end
        end
    else % have parent(s)
        if (i == 2)
            offset = s(1) * jtotal + 1; % set the offset
        elseif ( i == 4 )
            offset = s(3) * 4 * jtotal + s(5) * jtotal + 1;
        elseif ( i == 7 )
            offset = s(6) * 5 * jtotal + s(8) * jtotal + 1;
        elseif ( i == 9 )
            offset = s(2) * 5 * 4 * jtotal + s(4) * 4 * jtotal + s(7) * jtotal + 1;
        end 
        sum = theta(i, offset);
        for j = offset : (offset + jtotal)   
            if ( r(i) <= sum)
                s(i) = j - offset;
            else
                sum = sum + theta(i, j);
            end
        end
    end    
end
