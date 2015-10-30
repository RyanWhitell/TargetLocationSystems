function  initialize() % Run initialize function to start simulation
  
% Decalare and initailize copter formation
global A B C;
 
% Give the formation an initial referance frame
A = set_se2(-10,0,0);
B = set_se2(10,0,0);
C = set_se2(0,sqrt(20^2-10^2),0);
 
%Locate and converge upon target
EXIT_FLAG = 0;
within = Inf;
while 1
    get_rssi();
    x = 10;
    within = is_D_m_from_target(within);
    if within == 10
        within = 10;
        reduce_formation_size(A,B,C);
        advance(A,B,C,x)
        while 1
            get_rssi()
            x = 4;
            within = is_D_m_from_target(within);
            if within == 5
                within = 5;
                reduce_formation_size(A,B,C);
                advance(A,B,C,x)
                while 1
                    get_rssi()
                    x = 2;
                    within = is_D_m_from_target(within);
                    if within == 3
                        EXIT_FLAG = 1;
                        break;
                    end
                    if EXIT_FLAG, break, end
                    advance(A,B,C,x)
                end
            end
            if EXIT_FLAG, break, end
            advance(A,B,C,x)
        end
    end
    if EXIT_FLAG, break, end
    advance(A,B,C,x)
end
end
