% CSE 574 Project 2 PRC of Handprint 'and' PRC_C(theta1)
% Ruhan Sa 50060400
% This function is for computing the PRC of Handprint 'and'. 
% The tolerance episolon takes 0.
% Means two 'and' should be identical in all variables.

function prc = PRC_H(theta1)

prc = 0;
for j3 = 0 : 4
    thetac = theta1( 3, j3 + 1);
    for j5 = 0 : 2
        thetae = theta1(5, j3 * 4 + j5 + 1);
        for j2 = 0 : 5
            thetab = theta1( 2, j3 * 3 * 6 + j5 * 6 + j2 + 1);
            for j4 = 0 : 4
                    thetad = theta1( 4, j2 * 5 * 5 + j3 * 5 + j4 + 1 );
                    for j6 = 0 : 4
                        thetaf = theta1( 6, j2 * 3 * 5 + j5 * 5 + j6 + 1);
                        for j8 = 0 : 3
                            thetah = theta1( 8, j5 * 5 * 4 + j6 * 4 + j8 + 1);
                            for j7 = 0 : 5
                                thetag =  theta1(7, j3 * 5 * 5 * 6 + j4 * 5 * 6 + j6 * 6 + j7 + 1);
                                for j1 = 0 : 4
                                    thetaa = theta1(1, j6 * 4 * 3 * 5 + j8 * 3 * 5 + j5 * 5 + j1 + 1);
                                    for j9 = 0 : 2
                                        thetai = theta1( 9, j9 + 1);
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




