% CSE 574 project 2 BN sampling BNsample_H(theta1, Mv)
% Ruhan Sa 50060400
% This function is for Ancestral sampling based on BN given for cursive 'and'.

function s = BNsample_H(theta1)
% Mv is the feature value of the groundtruth. Here Mv is used for
% restricting the value to be chosen from the 'truthCursive.txt'

% generating 9 random numbers
r = 1 .*rand(9,1);
order = [ 3, 9, 5, 2, 4, 6, 7, 8, 1]; % in order to sample the parents first

for m = 1 : 9 
    i = order(m);
    % determine the value range
    if ( i == 1 || i == 3 || i == 4 || i == 6)
		jtotal = 5;
	elseif( i == 2 || i == 7 )
		jtotal = 6;
    elseif ( i == 5 || i == 9)
        jtotal = 3;
	else
		jtotal = 4;
    end
    
    if ( i == 3 || i == 9) % no parents
        sum = theta1(i, 1);
        for j = 1 : jtotal
            if ( r(i) <= sum)
                s(i) = j;
            else
                sum  = sum + theta1(i, j);
            end
        end
    else % have parent(s)
        if ( i == 1)
            offset = s(6) * 4 * 3 * jtotal + s(8) * 3 * jtotal + s(5) * jtotal + 1;
        elseif (i == 2)
            offset = s(3) * 3 * jtotal + s(5) * jtotal + 1; % set the offset
        elseif ( i == 4 )
            offset = s(2) * 5 * jtotal + s(3) * jtotal + 1;
        elseif ( i == 5 )
            offset = s(3) * jtotal + 1;
        elseif ( i == 6 )
            offset = s(2) * 3 * jtotal + s(5) * jtotal + 1;
        elseif ( i == 7 )
            offset = s(3) * 5 * 5 * jtotal + s(4) * 5 * jtotal + s(6)* jtotal + 1;
        elseif ( i == 8 )
            offset = s(5) * 5 * jtotal + s(6) * jtotal + 1;
        end 
        sum = theta1(i, offset);
        for n = offset : (offset + jtotal)   
            if ( r(i) <= sum)
                s(i) = n - offset;
            else
                sum = sum + theta1(i, n);
            end
        end
    end    
end
