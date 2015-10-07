% CSE 574 Project 2 PRC of Cursive 'and' PRC_C(theta1)
% Ruhan Sa 50060400
% This function is for computing the PRC of Cursive 'and'. 
% The tolerance episolon takes 0.
% Means two 'and' should be identical in all variables. Thus the
% probability of x and y should be identical too, which is why the ^2 in
% line 30 comes from.


function prc = PRC_C(theta1)

prc = 0;
for j1 = 0 : 3
    thetaa = theta1(1, j1 + 1);
    for j2 = 0 : 4
        thetab = theta1( 2, j1 * 5 + j2 + 1);
        for j3 = 0 : 2
            thetac = theta1( 3, j3 + 1); 
            for j5 = 0 : 3
                thetae = theta1(5, j5 + 1);
                for j4 = 0 : 4
                    thetad = theta1( 4, j3 * 4 * 5 + j5 * 5 + j4 + 1 );
                    for j6 = 0 : 3
                        thetaf = theta1( 6, j6 + 1);
                        for j8 = 0 : 4
                            thetah = theta1( 8, j8 + 1);
                            for j7 = 0 : 3
                                thetag =  theta1(7, j6 * 5 * 4 + j8 * 4 + j7 + 1);
                                for j9 = 0 : 2
                                    thetai = theta1( 9, j2 * 5 * 4 * 3 + j4 * 4 * 3 + j7 * 3 + j9 + 1);
                                    prc = prc + ( thetaa * thetab * thetac * thetad * thetae * thetaf * thetag * thetah * thetai ) ^2;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end




